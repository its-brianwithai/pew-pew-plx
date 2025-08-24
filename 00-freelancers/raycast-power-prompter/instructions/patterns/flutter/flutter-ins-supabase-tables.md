# Supabase Tables

This document provides a comprehensive guide to managing our Supabase database. It covers everything from adding new tables and defining data models to writing Row Level Security (RLS) policies and implementing server-side logic with Edge Functions. Adhering to these conventions is crucial for maintaining a stable, secure, and scalable backend.

Our core philosophy is that **the Supabase schema is the single source of truth for our data**.

## 1. How We Add a New Table

Adding a new table is a structured process that ensures all parts of our system are in sync.

### Step 1: Define the Table in Supabase Studio (or via Migration)

The first step is to define the schema for your new table. This should be done via a SQL migration file in your `supabase/migrations` directory.

-   **Convention:** Use snake_case for table and column names. Define primary keys, foreign keys, and indexes appropriately.
-   **Example Migration (`supabase/migrations/..._create_tasks_table.sql`):**
    ```sql
    create table public.tasks (
        id uuid primary key default gen_random_uuid(),
        user_id uuid references auth.users not null,
        title text check (length(title) > 0),
        created_at timestamp with time zone default timezone('utc'::text, now()) not null,
        -- other columns
    );
    ```

### Step 2: Create DTOs in the Flutter App

Based on the table definition, create a corresponding Data Transfer Object (DTO) in the Flutter application.

-   **Location:** `lib/your_feature/dtos/your_model_dto.dart`
-   **Convention:** Use `json_serializable` with `fieldRename: FieldRename.snake`. Run `flutter pub run build_runner build` after creating your DTO.
-   **Base Class:** Your DTO must extend `SupabaseDto`.

### Step 3: Create a `SupabaseApi` Instance

Each table is accessed through our generic `SupabaseApi` class. This is typically instantiated inside the service that manages the data for that table.

-   **Location:** `lib/your_feature/services/your_table_service.dart`
-   **Convention:** The service will hold a `late final` instance of `SupabaseApi<YourDto>`.
    ```dart
    // In TaskService.dart
    late final SupabaseApi<TaskDto> _api = SupabaseApi(
      client: Supabase.instance.client,
      table: 'tasks',
      fromJsonFactory: TaskDto.fromJson,
      toJsonFactory: (task) => task.toJson(),
    );
    ```

### Step 4: Create a Service

If the table's data needs to be held in state, shared across features, or requires business logic, create a service.

-   **Location:** `lib/your_feature/services/your_table_service.dart`
-   **Convention:** Extend `SyncedDocsService` (for collections) or `SyncedDocService` (for single items) and register it as a lazy singleton in `lib/core/services/locator_service.dart`.

## 2. How We Handle Security with RLS

Row Level Security (RLS) policies are our primary defense for protecting user data. They are defined as SQL in migration files and must be created for every new table.

Our policies follow these principles:
-   **Default Deny:** RLS is enabled on all tables, so access is denied unless an explicit policy allows it.
-   **Authentication Required:** Nearly all policies check that the user is authenticated using `auth.uid()`.
-   **Data Validation:** We use `CHECK` constraints in our table definitions to validate incoming data.
-   **Ownership and Permissions:** Access control is based on ownership. Policies check `auth.uid()` against a `user_id` column in the table.
    ```sql
    -- Example RLS policy for 'tasks' table
    alter table public.tasks enable row level security;

    create policy "Users can manage their own tasks."
    on public.tasks for all
    using (auth.uid() = user_id)
    with check (auth.uid() = user_id);
    ```

## 3. Things We Consider When Managing Tables

-   **Scalability & Cost:** How will this design perform with millions of rows? We design queries to be efficient and ensure proper indexing on columns that are frequently queried.
-   **Data Integrity:** We use **Postgres Transactions** for any operation that involves multiple writes to ensure atomicity. This can be done inside an RPC (a Postgres function exposed to the API) or an Edge Function.
-   **Denormalization:** We sometimes duplicate data to optimize for read performance. When we do this, we create a **database trigger and function** to keep the duplicated data in sync.
-   **Cleanup:** When a user is deleted, what related data needs to be cleaned up? We use `ON DELETE CASCADE` in our foreign key constraints or database triggers for this.

## 4. How We Use Supabase in Edge Functions

Our server-side logic is written in TypeScript and deployed as Supabase Edge Functions.

-   **SDK:** We use the **Supabase client library** for Deno. When using a service role key, the function has privileged access to the database, bypassing RLS policies.
-   **Triggers:** We use database triggers and webhooks to invoke Edge Functions in response to data changes.
-   **DTOs:** Edge Functions should have their own DTOs located in `supabase/functions/_shared/dtos/`. These must be kept in sync with the table definitions.