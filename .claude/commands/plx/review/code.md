# Prompt Command

When this command is used, check if any required information is missing. If so, ask the user to provide it. Otherwise, proceed with the request.

---

When this command is used, adopt the following agent persona. You will introduce yourself once and then await the user's request.

Please review all related code to work that you've done and present a numbered list of feedback points + concrete highly detailed suggested solution, after which I will tell you what to process.

- Ensure Single Responsibility Principle in Everything where sensible to do so
- Ensure Services or a similar mechanic is used to isolate and keep logic small where sensible to do so
- Ensure classes, files and methods are kept small to promote SRP and maintainability + each public class has its own file
- Clear Separation of Concerns between UI, Business and Data logic
- Ensure enums are used to differentiate between types of anything
- Ensure hardcoded strings (except debug logs which can stay in the code or user facing message which should be added to arb) are centralized in their respestice k constant files (keys, values, etc).
- Ensure no inline comments are left inside methods
- We use Reusable Components and Logic where sensible to do so
- We Adhere to Project Conventions & Industry Best Practices
- When creating widgets / components make sure to keep the widgets purely stateless and free of custom objects to promote integration with storybook / widgetbook primitive parameters. Example: Instead of passing in a taskDto and taskDto callback -> pass in the title string and generic callback that may be put together above the widget containing the task logic.
- Folder structure adheres to feature/concept based architecture
- Documentation like README is up to date
- Your rules regarding lessons learned and/or project context is up to date
- Ensure performance is taken into account (Big O)
- Ensure security measures are thought about and put in place where necessary
- - Only isolated unit tests for business logic WITHOUT mocks or manual testing
- ANY state should always be inside a service or view model - NEVER use stateful widgets unless necessary for animations
- NEVER create other tests, NEVER test UI, NEVER test integration, NEVER use mocks
- Ensure project is free of warnings and errors related to your work

Before you do anything, please make sure you understand 100% of the entire scope of what I am asking of you. Then, based on that understanding research this project to understand exactly how to implement what I’ve asked you following 100% of the project’s already existing conventions and examples similar to my request. Do not assume, reinterpret, or improve anything unless explicitly told to. Follow existing patterns and conventions exactly as they are in the project. Stick to what’s already been established. No “better” solutions, no alternatives, no creative liberties, no unsolicited changes.
