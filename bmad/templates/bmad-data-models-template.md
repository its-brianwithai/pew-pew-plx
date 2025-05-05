# {Project Name} Data Models

## 2. Core Application Entities / Domain Objects

{Define the main objects/concepts the application works with. Repeat subsection for each key entity.}

### {Entity Name, e.g., User, Order, Product}

- **Description:** {What does this entity represent?}
- **Schema / Interface Definition:**
  ```typescript
  // Example using TypeScript Interface
  export interface {EntityName} {
    id: string; // {Description, e.g., Unique identifier}
    propertyName: string; // {Description}
    optionalProperty?: number; // {Description}
    // ... other properties
  }
  ```
  _(Alternatively, use JSON Schema, class definitions, or other relevant format)_
- **Validation Rules:** {List any specific validation rules beyond basic types - e.g., max length, format, range.}

### {Another Entity Name}

{...}

## API Payload Schemas (If distinct)

{Define schemas specifically for data sent to or received from APIs, if they differ significantly from the core entities. Reference `docs/api-reference.md`.}

### {API Endpoint / Purpose, e.g., Create Order Request}

- **Schema / Interface Definition:**
  ```typescript
  // Example
  export interface CreateOrderRequest {
    customerId: string;
    items: { productId: string; quantity: number }[];
    // ...
  }
  ```

### {Another API Payload}

{...}

## Database Schemas (If applicable)

{If using a database, define table structures or document database schemas.}

### {Table / Collection Name}

- **Purpose:** {What data does this table store?}
- **Schema Definition:**
  ```sql
  -- Example SQL
  CREATE TABLE {TableName} (
    id VARCHAR(36) PRIMARY KEY,
    column_name VARCHAR(255) NOT NULL,
    numeric_column DECIMAL(10, 2),
    -- ... other columns, indexes, constraints
  );
  ```
  _(Alternatively, use ORM model definitions, NoSQL document structure, etc.)_

### {Another Table / Collection Name}

{...}

## State File Schemas (If applicable)

{If the application uses files for persisting state.}

### {State File Name / Purpose, e.g., processed_items.json}

- **Purpose:** {What state does this file track?}
- **Format:** {e.g., JSON}
- **Schema Definition:**
  ```json
  {
    "type": "object",
    "properties": {
      "processedIds": {
        "type": "array",
        "items": {
          "type": "string"
        },
        "description": "List of IDs that have been processed."
      }
      // ... other state properties
    },
    "required": ["processedIds"]
  }
  ```

## Change Log

| Change        | Date       | Version | Description   | Author         |
| ------------- | ---------- | ------- | ------------- | -------------- |
| Initial draft | YYYY-MM-DD | 0.1     | Initial draft | {Agent/Person} |
| ...           | ...        | ...     | ...           | ...            |
