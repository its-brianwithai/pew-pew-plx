# Supabase Edge Functions and DTOs

This document explains how we handle Supabase Edge Functions and Data Transfer Objects (DTOs) in this project, ensuring type-safe communication between the Flutter app and backend services.

## 1. DTOs (Data Transfer Objects)

DTOs are our standardized way of defining data structures that are sent to and received from APIs, particularly Edge Functions.

### DTO Structure

All DTOs that are written to Supabase tables must extend `SupabaseDto`.

```dart
import 'package:json_annotation/json_annotation.dart';
import 'package:float_note/core/dto/supabase_dto.dart';

part 'example_dto.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ExampleDto extends SupabaseDto {
  ExampleDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.field1,
    this.field2,
  });

  factory ExampleDto.fromJson(Map<String, dynamic> json) =>
      _$ExampleDtoFromJson(json);

  static const fromJsonFactory = _$ExampleDtoFromJson;
  static const toJsonFactory = _$ExampleDtoToJson;
  
  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  
  final String field1;
  final String? field2;

  @override
  Map<String, dynamic> toJson() => _$ExampleDtoToJson(this);
}
```

### Request & Response DTOs

For Edge Functions, we may use DTOs that don't extend `SupabaseDto` if they don't map directly to a table. These are simple classes with `json_serializable`.

```dart
// Request DTO sent to an Edge Function
@JsonSerializable()
class MyFunctionRequest {
  MyFunctionRequest({required this.someValue});
  final String someValue;
  // fromJson/toJson ...
}

// Response DTO received from an Edge Function
@JsonSerializable()
class MyFunctionResponse {
  MyFunctionResponse({required this.result});
  final String result;
  // fromJson/toJson ...
}
```

## 2. Calling Edge Functions

Edge Functions are called from a Service class in the Flutter app.

### Service Structure

```dart
class MyFeatureService with Loglytics {
  // ...
  SupabaseClient get _supabaseClient => Supabase.instance.client;

  Future<TurboResponse<MyFunctionResponse>> callMyFunction({
    required String someValue,
  }) async {
    try {
      final response = await _supabaseClient.functions.invoke(
        'my-function-name',
        body: MyFunctionRequest(someValue: someValue).toJson(),
      );

      if (response.status != 200) {
        return TurboResponse.fail(
          title: 'Error',
          message: 'Failed to call function: ${response.data}',
        );
      }

      return TurboResponse.success(
        result: MyFunctionResponse.fromJson(response.data),
      );
    } catch (e, s) {
      log.error('Failed to invoke Edge Function', error: e, stackTrace: s);
      return TurboResponse.fail(
        title: 'Error',
        message: 'An unexpected error occurred.',
      );
    }
  }
}
```

## 3. Edge Function Backend Structure

Our Edge Functions are written in TypeScript and located in a separate `supabase/functions` directory.

### Service-Oriented Architecture

Split logic into focused service classes:

```typescript
// supabase/functions/_shared/services/ValidationService.ts
export class ValidationService {
  static validateInput(data: unknown): MyFunctionRequest {
    // Validation logic here
    // Throws an error if invalid
    return data as MyFunctionRequest;
  }
}
```

### Main Function Structure

```typescript
// supabase/functions/my-function-name/index.ts
import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { ValidationService } from "../_shared/services/ValidationService.ts";

serve(async (req) => {
  try {
    const requestData = await req.json();
    const validatedData = ValidationService.validateInput(requestData);

    // Business logic...
    const result = `You sent: ${validatedData.someValue}`;

    return new Response(
      JSON.stringify({ result }),
      { headers: { "Content-Type": "application/json" }, status: 200 },
    );
  } catch (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      { headers: { "Content-Type": "application/json" }, status: 400 },
    );
  }
});
```

## 4. Error Handling

Edge Functions should return meaningful JSON error messages with appropriate status codes (e.g., 400 for bad request, 500 for server error). The Flutter service layer then converts these into user-friendly `TurboResponse.fail` objects.

## 5. Testing Edge Functions

Always test with the Supabase CLI:

```bash
# Start local Supabase environment
supabase start

# In Flutter, configure SupabaseService to use local URLs
# (This is handled by our Environment enum)
flutter run --dart-define=env=emulators
```

## Key Takeaways

1.  **Always create DTOs** for Edge Function requests and responses.
2.  **Use `TurboResponse<DTO>`** in your Flutter services for type-safe returns from function calls.
3.  **Call functions** using `Supabase.instance.client.functions.invoke()`.
4.  **Extract logic into services** in your TypeScript function code.
5.  **Validate all incoming data** inside your Edge Function.
6.  **Return structured JSON responses** (both for success and errors).