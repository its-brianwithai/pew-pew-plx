You are tasked with creating a new unit test file for a specific Dart class or file within the project. Your goal is to write comprehensive, well-structured, and maintainable unit tests that adhere to the project's established testing practices and utilize its testing utilities.

**Project Testing Context & Tool Usage Deep Dive:**

*   **Primary Testing Framework: `flutter_test` (for unit tests)**
    *   **Purpose:** Provides the core framework for writing unit tests in Dart and Flutter.
    *   **Key Functions/Classes:**
        *   `group(description, body)`: Organizes multiple related tests under a common description.
        *   `test(description, body)`: Defines an individual unit test case.
        *   `setUp(callback)`: A function that runs before each test in a group or file. Ideal for setting up preconditions or resetting state.
        *   `tearDown(callback)`: A function that runs after each test. Used for cleanup.
        *   `setUpAll(callback)`: Runs once before all tests in a group or file.
        *   `tearDownAll(callback)`: Runs once after all tests in a group or file.
        *   `expect(actual, matcher)`: The primary assertion function. It checks if the `actual` value meets the criteria defined by the `matcher`.
        *   **Matchers:** Various objects used with `expect` to define expected outcomes (e.g., `equals`, `isA<Type>()`, `isNull`, `isTrue`, `throwsA<ExceptionType>()`, `completes`).

*   **Mocking Framework: `mockito`**
    *   **Purpose:** Allows creating mock (simulated) versions of dependencies to isolate the unit under test. This makes tests faster, more reliable, and focused on the specific logic being tested.
    *   **Generating Mocks:**
        *   `@GenerateNiceMocks([MockSpec<ClassName>()])` or `@GenerateMocks([ClassName])`: Annotation used to tell `build_runner` which classes to mock. `@GenerateNiceMocks` is often preferred as it provides default "nice" responses (like null or empty values) for unstubbed methods, reducing boilerplate.
        *   `flutter pub run build_runner build --delete-conflicting-outputs`: Command to run to generate the mock implementation files (usually `*.mocks.dart`).
    *   **Using Mocks:**
        *   Import the generated `*.mocks.dart` file.
        *   Instantiate mock objects: `final mockMyService = MockMyService();`.
    *   **Stubbing (Defining Behavior):** (See `mockito` package: `src/mock.dart` - `when` function)
        *   `when(mockObject.method(arguments)).thenReturn(value)`: For synchronous methods, returns `value` when `method` is called with matching `arguments`.
        *   `when(mockObject.method(arguments)).thenAnswer((_) async => futureValue)`: For asynchronous methods, returns a `Future` that completes with `futureValue`.
        *   `when(mockObject.method(arguments)).thenThrow(exception)`: Makes the mocked method throw `exception`.
    *   **Verification (Checking Interactions):** (See `mockito` package: `src/mock.dart` - `verify` function)
        *   `verify(mockObject.method(arguments))`: Checks if `method` was called on `mockObject` with matching `arguments`. Can be chained with `.called(count)` (e.g., `.called(1)`).
        *   `verifyNever(mockObject.method(arguments))`: Checks if `method` was never called.
    *   **Argument Matchers:** Used within `when` or `verify` for flexible argument checking: (See `mockito` package: `src/mock.dart` - `any`, `argThat`, `captureAny` etc.)
        *   `any`: Matches any value for a positional argument.
        *   `anyNamed('paramName')`: Matches any value for a named argument `paramName`.
        *   `argThat(matcher, named: 'paramName')`: Matches an argument that satisfies the given `matcher` (e.g., `argThat(startsWith('http'))`).
        *   `captureAny`, `captureAnyNamed('paramName')`, `captureThat(matcher, named: 'paramName')`: Captures the argument passed to the mock for later inspection using `verify(...).captured`.

*   **Dependency Injection / Service Locator: `get_it`**
    *   **Purpose:** Provides a way to decouple classes from their concrete dependencies by offering a central registry (service locator) from which dependencies can be retrieved. This is highly beneficial for testing, as real dependencies can be easily swapped with mocks.
    *   **Key Functions (typically used with an instance like `final sl = GetIt.instance;`):**
        *   `sl.registerSingleton<InterfaceType>(mockInstance)`: Registers `mockInstance` as a singleton for `InterfaceType`. Every call to `sl<InterfaceType>()` will return this same instance.
        *   `sl.registerLazySingleton<InterfaceType>(() => MockClass())`: Registers a factory function that creates the mock instance only when it's first requested. Subsequent calls return the same instance.
        *   `sl.registerFactory<InterfaceType>(() => MockClass())`: Registers a factory function that creates a new mock instance every time `InterfaceType` is requested.
        *   `sl.reset()`: Clears all registered types from `GetIt`. **Crucial for test isolation**; typically called in `tearDown()` or `tearDownAll()` to prevent mocks registered in one test from affecting others.
        *   `sl<InterfaceType>()` or `sl.get<InterfaceType>()`: Retrieves the registered instance (or mock) of `InterfaceType`.
    *   **Testability Pattern (Optional Constructor Injection):** Classes can be designed to fetch dependencies from `GetIt` by default but also allow injecting them via the constructor for easier testing.

*   **Custom Testing Utilities: `Tester` class (in `test/util/tester.dart`)**
    *   **Purpose:** A project-specific helper class designed to streamline test setup and provide common testing functionalities.
    *   **Likely Functions:**
        *   **Initialization:** `final tester = Tester(tag: 'MyTest'); tester.ensureInitialized();` (The `ensureInitialized` might handle global test setup).
        *   **Mock Management:**
            *   Likely initializes and registers a set of common mocks (e.g., using a `Mocks` helper class which itself uses `GetIt`).
            *   Provides access to these mocks: `tester.mocks.myMockService`.
        *   **Logging:** Provides a test-specific logger: `tester.log.info('message')`.
        *   **Service Locator Setup:** May set up a test-specific `GetIt` environment, registering mocks for services.
        *   **Data Storage (TesterBox):** `tester.box.get('key', initialValue: ...)` might be used for storing/retrieving test-specific data or mock instances if not managed by `GetIt` directly within `Tester`.
        *   **Disposal:** `tester.dispose()`: Called in `tearDownAll()` or after tests to clean up resources used by the `Tester` instance (e.g., calling `GetIt.I.reset()`, disposing `Mocks` or `TesterBox`).

**Instructions:**

1.  **Understand the Target:**
    *   Thoroughly analyze the `{user_requests}` and `{relevant_context}`.
    *   Identify its public API (methods, getters, setters), its primary responsibilities, and all its dependencies (other classes or services it interacts with).
    *   Determine the specific functionalities, behaviors, and scenarios to be covered by the tests, as outlined in `{user_requests}`.

2.  **Set up the Test File:**
    *   Create a new Dart file in the appropriate testing folder` (e.g., if testing `lib/services/auth_service.dart`, the test file would be `test/services/auth_service_test.dart`).
    *   Add necessary imports:
        *   `import 'package:flutter_test/flutter_test.dart';`
        *   `import 'package:mockito/annotations.dart';` (if generating new mocks in this file)
        *   `import 'package:mockito/mockito.dart';`
        *   The Dart file containing the class/code to be tested (e.g., `import 'package:your_project/services/auth_service.dart';`).
        *   The project's mock generation file (e.g., `import '../util/mocks.mocks.dart';`).
        *   The project's custom `Tester` utility (e.g., `import '../util/tester.dart';`).
        *   Any other relevant project files or packages.
    *   If new mocks are required for dependencies that are not already generated:
        *   Ensure the dependency interfaces/classes are suitable for mocking (not private, not final if a class).
        *   Add or update a `@GenerateNiceMocks([MockSpec<DependencyClass>()])` annotation. This is typically done in a central place like `test/util/mocks.dart` or directly in the test file if the mock is specific to it.
        *   Run the build_runner command to generate/update the mock files: `flutter pub run build_runner build --delete-conflicting-outputs`.
        *   Ensure the generated `*.mocks.dart` file is imported.

3.  **Structure the Tests:**
    *   Use a `main()` function as the entry point for the tests in the file.
    *   Initialize your project's custom `Tester` instance at the beginning of `main()`: `final tester = Tester(tag: '[NameOfTest]Test');`.
    *   Call `tester.ensureInitialized();` if it's part of your `Tester`'s setup routine.
    *   Use `group('Descriptive group name for related tests', () { ... });` to organize tests for specific methods or functionalities of the class under test.
    *   Inside each `group` or at the top level of `main()` (if tests are not grouped extensively):
        *   Use `setUpAll(() async { ... });` for one-time setup for all tests in the group/file (e.g., registering mocks that are shared across all tests in the group via `GetIt`).
        *   Use `setUp(() async { ... });` for setup that needs to run before *each* individual test (e.g., resetting mock states, re-registering fresh mock instances with `GetIt` if needed for test isolation).
            *   **GetIt Mock Registration:** If using `GetIt` for dependencies, register mock instances here: `GetIt.I.registerSingleton<MyMockedService>(tester.mocks.myMockedService);`
        *   Use `tearDown(() async { ... });` for cleanup that needs to run after *each* individual test.
            *   **GetIt Reset:** **Crucially**, if `GetIt` is used to register mocks in `setUp`, call `GetIt.I.reset();` here to ensure test isolation. This prevents mocks from one test affecting another.
        *   Use `tearDownAll(() async { ... });` for one-time cleanup after all tests in the group/file (e.g., `tester.dispose();` if your `Tester` class requires it, which might internally call `GetIt.I.reset()`).

4.  **Write Individual Test Cases (Adhering to Arrange-Act-Assert):**
    *   For each functionality or scenario, create a `test('should ... when ... given ...', () async { ... });` block. Test names should be highly descriptive of the behavior being tested, the conditions, and the expected outcome.
    *   **Arrange (Setup the test conditions):**
        *   If the class under test retrieves dependencies from `GetIt` internally, ensure those dependencies (or their mocks) have been registered in `setUp()` or `setUpAll()`.
        *   Define the behavior of mock dependencies using `mockito`'s `when` syntax. This is critical for controlling how dependencies respond during the test.
            *   `when(tester.mocks.myMockService.someMethod(any)).thenReturn(expectedValue);`
            *   `when(tester.mocks.myMockService.someAsyncMethod(any)).thenAnswer((_) async => expectedFutureValue);`
            *   `when(tester.mocks.myMockService.methodThatThrows()).thenThrow(SpecificException());`
            *   Use argument matchers (`any`, `anyNamed('param')`, `argThat(...)`, `captureAny`) as needed to make stubs flexible or specific.
        *   Prepare any input data or state required for the test.
    *   **Act (Execute the code being tested):**
        *   Call the specific method or trigger the behavior on the instance of the System Under Test (SUT) that you intend to test.
        *   If the method is asynchronous, `await` its result.
    *   **Assert (Verify the outcome):**
        *   Use `expect()` from `flutter_test` to check if the actual results match the expected results.
            *   `expect(actualValue, expectedValue);`
            *   `expect(actualValue, isA<ExpectedType>());`
            *   `expect(() => sut.methodThatThrows(), throwsA<SpecificException>());`
            *   For Futures: `expect(future, completes);` or `expect(future, completion(matcher));` or `expect(future, throwsA<ExceptionType>());`
        *   Verify interactions with mock dependencies using `mockito`'s `verify` syntax. This ensures the SUT called its dependencies correctly.
            *   `verify(tester.mocks.myMockService.someMethod(expectedArgument)).called(1);` (Ensure it was called once)
            *   `verify(tester.mocks.myMockService.anotherMethod(captureAnyNamed('id'))).called(once);`
            *   `verifyNever(tester.mocks.myMockService.unwantedMethod(any));`
        *   If arguments were captured, assert their values:
            *   `final capturedArgs = verify(tester.mocks.myService.someMethod(captureAny)).captured;`
            *   `expect(capturedArgs.first, expectedCapturedValue);`

5.  **Best Practices to Follow & Refine:**
    *   **Focus & Atomicity:** Each test should verify a single, specific piece of behavior or a single scenario. Avoid testing multiple things in one test case.
    *   **Independence:** Tests must be independent. The outcome of one test should not affect another. This is why resetting mocks and `GetIt` (in `tearDown`) is crucial.
    *   **Readability:**
        *   Use clear, descriptive names for test groups (`group`) and test cases (`test`). The "should ... when ... given ..." pattern is good.
        *   Use comments sparingly, only where the code isn't self-explanatory.
    *   **Maintainability:**
        *   Test the public API and observable behavior of the SUT, not its internal implementation details. This makes tests less brittle to refactoring.
        *   Mock all external dependencies to isolate the SUT.
    *   **Arrange-Act-Assert (AAA):** Clearly structure each test with these three distinct sections.
    *   **DRY (Don't Repeat Yourself):** Use `setUp` for common arrangement logic. Create helper functions within the test file for complex or repeated setup/assertions if necessary.
    *   **Coverage - Test Scenarios Systematically:**
        *   **Happy Paths:** Test with typical, valid inputs and ensure correct, expected outcomes.
        *   **Edge Cases:** Test with boundary values (e.g., empty lists, zero, max values), null inputs (where allowed), and unusual but valid inputs.
        *   **Error Conditions:** Test how the SUT behaves when its dependencies throw errors, or when it receives invalid data. Ensure it handles errors gracefully (e.g., throws the correct exception, returns an error state).
    *   **Asynchronous Code:**
        *   Mark test functions as `async` if they involve `await`.
        *   Use `expect(future, completes)` for Futures that should complete successfully without a specific value.
        *   Use `expect(future, completion(matcher))` to check the value of a completing Future.
        *   Use `expect(future, throwsA(isA<ExceptionType>()))` to verify Futures that should throw.
    *   **Custom Utilities:** Fully leverage the project's `Tester` class, including `tester.mocks` for accessing pre-configured mocks, `tester.log` for test-specific logging, and `tester.box` if used for test data management. Follow its intended patterns for initializing and disposing of test resources.

6.  **Final Review:**
    *   Run all tests and ensure they pass.
    *   Confirm that the tests adequately cover all requirements and scenarios outlined in `{user_requests}`.
    *   Review for clarity, conciseness, and adherence to all project conventions and the best practices outlined above.
    *   Ensure no `print()` statements are left in the test code; use `tester.log` instead.

Provide the complete content of the new unit test file, including all necessary imports, setup, test cases, and assertions.

```yaml
relevant_context: <extra_context>
user_requests: {cursor}
```

```xml
<extra_context>
</extra_context>
```
