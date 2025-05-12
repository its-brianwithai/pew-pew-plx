Please perform an extensive code review on {code_review_targets} based on my {focus_points} and {user_requests} to the best of your ability based on your system instructions, project conventions and known best practices related to the {focus_points}, my {user_requests} and {relevant_context}.

```yaml
focus_points:
  - There is logging in places where it makes sense to have logging for debugging purposes.
  - There is sensible documentation added on class, method and variable level.
  - There is proper user feedback where a UI/UX expert would expect feedback given to the user in the form toasts, notifications or dialogs.
  - Any user facing strings are properly translated per localization standards of this project (if applicable).
  - Hard coded strings are either a static constant in a dedicated file, an extension method of an enum or translated for user feedback. The only time hard coded strings are allowed is when it’s for debugging purposes.
  - Try catch clauses (only) exist in the places where catching the error makes sense.
  - Classes and methods are kept sensibly small and follow the 1 responsibility principle as much as practically possible.
  - Code does not repeat itself unnecessarily.
  - Methods and variables have sensible naming following project conventions.
  - The code is practically optimized for performance (Big O) and security where an experienced senior software developer would deem it necessary to do so following .
  - The code is free of unused variables and methods.
  - Methods are private when they are only used inside the class.
  - Disposable resources are disposed where they should be.
  - Classes contain and are organised per {class_structure}.
  - This file is free of invalid information and updated with latest information.

class_structure: |
    // 📍 LOCATOR ------------------------------------------------------------------------------- \\
    // For dependency injection and service location
    - Static getters/methods for dependency injection
    - Factory registration methods
    
    // 🧩 DEPENDENCIES -------------------------------------------------------------------------- \\
    // For injected dependencies and services
    - Final service instances
    - API instances
    - Other dependencies
    
    // 🎬 INIT & DISPOSE ------------------------------------------------------------------------ \\
    // For initialization and cleanup
    - initState/dispose overrides
    - Custom initialization methods
    - Cleanup methods
    
    // 👂 LISTENERS ----------------------------------------------------------------------------- \\
    // For event listeners and subscriptions
    - Stream subscriptions
    - Event handlers
    - Callback methods
    
    // ⚡️ OVERRIDES ----------------------------------------------------------------------------- \\
    // For method overrides from parent classes
    - Required overrides
    - Optional overrides
    - Interface implementations
    
    // 🎩 STATE --------------------------------------------------------------------------------- \\
    // For state management
    - Informers
    - StateNotifiers
    - Form controllers
    - Local state variables
    
    // 🛠 UTIL ---------------------------------------------------------------------------------- \\
    // For technical utilities
    - Mutexes
    - Debouncers
    - Technical helpers
    
    // 🧲 FETCHERS ------------------------------------------------------------------------------ \\
    // For data retrieval
    - Getters
    - Data fetching methods
    
    // 🏗️ HELPERS ------------------------------------------------------------------------------- \\
    // For complex operations and business logic
    - Business logic methods
    - Complex calculations
    - Data transformations
    - Helper functions
    - Formatters
    
    // 🪄 MUTATORS ------------------------------------------------------------------------------ \\
    // For state mutations and updates
    - Methods that change state
    - Update operations
    - API calls

project_documents:
  - README.md
  - docs/

relevant_context:
  - 

user_requests:
  - Always follow best practices and project conventions when judging {focus_points}.
  - Fix all the issues you find in the code review.
```
