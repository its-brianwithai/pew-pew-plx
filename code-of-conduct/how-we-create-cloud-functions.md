---
document_type: code of conduct
goal: define process for creating new cloud functions for the Roomy backend
gpt_action: follow these steps when creating a new cloud function
---

# 🎯 Cloud Function Creation Process

1. [[GPT Agent]] [[setup feature structure]]
   1. [[setup feature structure]]
      1. Create new directory: `functions/src/[feature-name]`
      2. Create subdirectories following project structure:
      ```
      [feature-name]/
      ├── abstracts/      # Feature-specific abstract classes
      ├── analytics/      # Feature-specific analytics
      ├── api/           # Feature-specific API code
      ├── constants/     # Feature-specific constants
      ├── dtos/          # Feature-specific DTOs
      ├── enums/         # Feature-specific enums
      ├── exceptions/    # Feature-specific exceptions
      ├── functions/     # Feature-specific functions
      ├── middleware/    # Feature-specific middleware
      ├── models/        # Feature-specific models
      ├── requests/      # Feature-specific request types
      ├── responses/     # Feature-specific responses
      ├── services/      # Feature-specific services
      └── util/          # Feature-specific utilities
      ```

2. [[GPT Agent]] [[configure collection]]
   1. [[configure collection]]
      1. Update `core/enums/firestoreCollectionType.ts`
      2. Add new collection type to enum
      3. Update firestoreDto function
      4. Update firestorePath function
      ```typescript
      enum FirestoreCollectionType {
          // existing types...
          yourCollection,
      }

      function firestoreDto<T>(type: FirestoreCollectionType, data: any): T {
          switch (type) {
              // existing cases...
              case FirestoreCollectionType.yourCollection:
                  return YourDto.fromJson(data) as T;
          }
      }

      function firestorePath(type: FirestoreCollectionType): string {
          switch (type) {
              // existing cases...
              case FirestoreCollectionType.yourCollection:
                  return 'yourCollection';
          }
      }
      ```

3. [[GPT Agent]] [[create data types]]
   1. [[create data types]]
      1. Create DTO class in `[feature-name]/dtos/your_dto.ts`
      2. Implement fromJson and toJson methods
      ```typescript
      export class YourDto {
          constructor(
              public field1: string,
              public field2: number,
          ) {}

          static fromJson(json: any): YourDto {
              return new YourDto(
                  json.field1,
                  json.field2,
              );
          }

          toJson(): any {
              return {
                  field1: this.field1,
                  field2: this.field2,
              };
          }
      }
      ```
      3. Create request interface in `[feature-name]/requests/your_request.ts`
      ```typescript
      export interface YourRequest {
          param1: string;
          param2: number;
      }
      ```

4. [[GPT Agent]] [[implement function]]
   1. [[implement function]]
      1. Create function file in `[feature-name]/functions/your_function.ts`
      2. Import required dependencies
      3. Add auth middleware
      4. Implement function logic
      5. Return CloudResponse
      ```typescript
      import {onCall} from "firebase-functions/v2/https";
      import {CloudResponse} from "../core/responses/cloudResponse";
      import {callableAuthMiddleware} from "../core/middleware/callableAuthMiddleware";
      import {YourRequest} from "./requests/your_request";

      export const yourFunction = onCall(async (request) => {
          const auth = await callableAuthMiddleware(request);
          const data = request.data as YourRequest;
          
          // Your implementation
          
          return new CloudResponse({
              statusCode: 200,
              result: yourResult
          });
      });
      ```

5. [[GPT Agent]] [[export function]]
   1. [[export function]]
      1. Update `functions/src/index.ts`
      ```typescript
      export {yourFunction} from './[feature-name]';
      ```

# ✅ Verification Checklist

1. [[GPT Agent]] [[verify implementation]]
   1. [[verify implementation]]
      1. Confirm feature directory structure is complete
      2. Verify collection type is properly configured
      3. Check DTO implementation is complete
      4. Validate request type definitions
      5. Test function with auth middleware
      6. Verify error handling using core utilities
      7. Confirm CloudResponse format is correct
      8. Check function is properly exported
      9. Test function with sample request
      10. Verify error cases are handled

# 🔧 Error Handling Guide

1. [[GPT Agent]] [[handle errors]]
   1. [[handle errors]]
      1. Import error utilities
      ```typescript
      import {throwNotFound} from "../core/util/throwNotFound";
      import {throwPermissionDenied} from "../core/util/throwPermissionDenied";
      ```
      2. Use appropriate error functions
      ```typescript
      // Not Found (404)
      throwNotFound("Resource not found");

      // Permission Denied (403)
      throwPermissionDenied("User not authorized");
      ```
      3. Return proper CloudResponse
      ```typescript
      new CloudResponse({
          statusCode: 200,     // HTTP status code
          message?: string,    // Optional message
          result: T | null     // Response data
      });
      ``` 
