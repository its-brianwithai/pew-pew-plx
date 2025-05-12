Please perform an extensive code review on {code_review_targets} based on my {focus_points} and {user_requests} to the best of your ability based on your system instructions, project conventions and known best practices related to the {focus_points}, my {user_requests} and {relevant_context}.

```yaml
focus_points:
  - There is logging in places where it makes sense to have logging for debugging purposes.
  - There are analytics in places where it makes sense to have analytics for common tracking purposes.
  - There is sensible documentation added on class, method and variable level.
  - There is proper user feedback where a UI/UX expert would expect feedback given to the user in the form toasts, notifications or dialogs.
  - There are timeouts, debouncer, throttlers and/or isolates in place where it makes sense to do so to improve UX, performance and/or scalability.
  - Any user facing strings are properly translated per localization standards of this project (if applicable).
  - Hard coded strings should always either be a constant, an extension method of an enum or translated for user feedback. The only time hard coded strings are allowed is when it’s for debugging purposes.
  - Try catch clauses (only) exist in the places where catching the error makes sense.
  - Classes and methods are kept sensibly small and follow the 1 responsibility principle as much as practically possible.
  - Methods and variables have sensible naming following project conventions.
  - The code is practically optimized for performance and security where an experienced senior software developer would deem it necessary to do so.
  - The code is free of unused variables and methods.
  - Methods are private when they are only used inside the class.
  - Disposable resources are disposed where they should be.
  - Classes contain and are organised per {class_structure}.
  - {project_documents} are free of invalid information and updated with latest information.

class_structure:
    // 📍 LOCATOR ------------------------------------------------------------------------------- \\
    // 🧩 DEPENDENCIES -------------------------------------------------------------------------- \\
    // 🎬 INIT & DISPOSE ------------------------------------------------------------------------ \\
    // 👂 LISTENERS ----------------------------------------------------------------------------- \\
    // ⚡️ OVERRIDES ----------------------------------------------------------------------------- \\
    // 🎩 STATE --------------------------------------------------------------------------------- \\
    // 🛠 UTIL ---------------------------------------------------------------------------------- \\
    // 🧲 FETCHERS ------------------------------------------------------------------------------ \\
    // 🏗️ HELPERS ------------------------------------------------------------------------------- \\
    // 🪄 MUTATORS ------------------------------------------------------------------------------ \\

project_documents:
  - README.md
  - docs/

feedback_format: Suggestion, reasoning, file(s), line(s), suggested approach.

doc_location: qa.md
relevant_context:
  - <file_map>
  - <file_contents>
  - 

user_requests:
  - Create a pragmatic code review report in markdown format with sensible headers based on {focus_points}.
  - Place your feedback for each one of {focus_points} under the associated markdown header in the form of unchecked markdown checkboxes following {feedback_format}.
  - Always follow best practices and project conventions when judging {focus_points}.
  - Create the markdown document in {doc_location}.
  - Be extremely explicit when giving feedback, mention the exact change you want to see leaving no room for ambiguity.
```

<code_review_targets>

</code_review_targets>
