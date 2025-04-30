# 🛠️ Best Practices for TypeScript CLI Tools and Unit Testing

## 🏗️ Project Structure and Organization

Organize your CLI project in a clear, conventional structure. This makes the codebase easier to navigate and scale. A recommended layout is:
*   `bin/` – Contains the executable script(s) for your CLI (with a proper shebang). This is what runs when the CLI is invoked.
*   `src/commands/` – Each command in its own module. This separation keeps command implementations modular and maintainable.
*   `src/utils/` – Utility functions and helpers used across commands (e.g. formatting output, common validations).
*   `src/lib/` – Core business logic of your tool, especially if it interacts with external APIs or performs complex operations.
*   Project root – Include essential files like `package.json` and `README.md` for package metadata and documentation. The `README.md` should outline installation and usage clearly.

Always place TypeScript source under `src/` and compile to a separate output (e.g. `dist/`). Keep the compiled output out of version control. Maintain a strict TypeScript configuration (enable strict mode) to catch errors early. This structure ensures a clean separation between the CLI entry point and the logic, which is crucial for testability.

## ⌨️️ Command Definition and Parsing

Define CLI commands and options explicitly and follow widely accepted CLI conventions. Use a robust command-line parsing library like Commander.js or Yargs (both support TypeScript) to define commands, subcommands, and options. These libraries enforce POSIX-compliant syntax, which users expect. Best practices include:
*   **POSIX-Style Flags:** Support short `-f` and long `--flag` options. Single-letter flags should be prefixed with a single dash, and full-word options with `--`. Allow flags to be combined (`-abc` as alias for `-a -b -c`) for convenience.
*   **Descriptive Commands:** For multi-command CLIs, name commands after the action they perform (e.g. `init`, `generate`). Provide a one-line description for each command in the help output.
*   **Option Arguments:** Use angle brackets `<arg>` for required arguments and square brackets `[arg]` for optional ones in help text. This standard notation clearly communicates usage to users.
*   **Default Commands:** If your CLI has a primary action, consider making it the default when no subcommand is given. Otherwise, show the help if an unknown command is used.

Each command’s implementation should be encapsulated in a function or class (in `src/commands`). The command definition (using Commander/Yargs) should simply parse inputs and delegate to the implementation function. Never bury core logic inside the parsing layer – keep it separate. This makes the code easier to maintain and test.

## 💬 Argument Handling and Interactive Prompts

Handle command-line arguments rigorously and provide a good user experience for missing or invalid inputs. Always validate required arguments and options, and give clear error messages when something is wrong. Follow the “empathic CLI” approach: instead of failing on a missing required input, prompt the user interactively when appropriate. For example, if a required parameter is not provided, the CLI can fall back to asking the user via an interactive prompt, thus turning a potential error into a guided interaction.

Use Inquirer.js (a standard library for CLI prompts) to implement interactive questions when needed. Best practices for interactive prompts include:
*   **Only Prompt When Necessary:** Do not force interaction if information can be reliably auto-detected or provided via arguments. For example, if a configuration value can be read from an env variable or config file, use it instead of asking the user every time (zero-configuration principle).
*   **Use Rich Prompt Types:** Leverage confirm dialogs for yes/no, lists for multiple choice, password prompts for secrets, etc., instead of free-text for everything. This makes input less error-prone and more user-friendly (e.g. using checkboxes or auto-complete for known values).
*   **Graceful Defaults:** Provide sensible default values in prompts and option definitions. Defaults should be indicated in the help text. This speeds up usage for common cases.
*   **Skippable/Non-Interactive Mode:** Ensure your CLI can run non-interactively as well. Provide flags like `--yes` to skip confirmations or detect CI environments to avoid hanging on prompts. Always allow opting out of interactivity if running in a script or unsupported terminal.

When designing prompt flows, remember that a CLI might be used in pipelines. Always time-out or provide a non-interactive alternative for prompts so automation doesn’t stall. Also, respect standard env vars like `NO_COLOR` or a `CI` flag to modify behavior appropriately (e.g. disable color or animations and avoid prompts in CI).

## ⚙️ Configuration Management

Implement a robust configuration management strategy for your CLI tool. Configuration can come from multiple sources, and your tool should support a clear order of precedence:
1.  Command-line arguments (highest priority)
2.  Environment variables (next priority)
3.  Project-level config files (e.g. a config in the current project directory)
4.  User-level config (e.g. in the user’s home directory, `~/.myclirc` or under `~/.config/…`)
5.  System-level config (if applicable)

Always let explicit CLI arguments override anything else. For environment variables, adopt conventional names (for example, `MYCLI_TOKEN` for an API token) and document them. Use a config library or loader (like cosmiconfig or similar) to search for config files in standard locations. Follow the XDG Base Directory spec for where to store user config and data files – e.g. use `~/.config/yourapp/config.json` rather than cluttering the home directory with custom dotfiles.

**Stateful Configuration:** Persist user preferences to avoid forcing repetitive input. For instance, if a user provides an API key the first time, store it securely so subsequent runs don’t ask again. Use a well-vetted config store (like the `conf` or `configstore` packages) that respects the OS conventions for config paths. This provides a seamless experience between invocations of your CLI (remembering past inputs, tokens, etc.) and reduces annoyance of retyping the same info.

Always document the configuration hierarchy. In your help output or docs, explain how config values are determined (e.g. “Command-line flag `--foo` overrides `FOO` env var, which overrides the value in the config file.”). This transparency helps users understand and customize the CLI’s behavior.

## 📦 Dependency Management and Code Modularization

Manage your dependencies carefully and keep the code modular:
*   **Minimal Dependencies:** Limit external dependencies to what is truly needed. A smaller dependency footprint means faster installs and fewer potential security issues. Each additional package can slow down global installation (especially when users invoke your CLI via `npx` each time). Vet your dependencies (and their transitive deps) for size and quality to avoid bloating the CLI.
*   **No “Reinventing the Wheel”:** That said, do leverage well-known libraries for standard needs (argument parsing, prompting, config). Don’t hand-roll functionality that a reliable library already provides – this ensures consistency and reduces bugs. Strike a balance between too many dependencies and not writing unnecessary custom code.
*   **Lock Versions:** Use a lockfile (`package-lock.json` or an `npm-shrinkwrap.json`) to pin dependency versions for your published CLI. This guarantees that users installing your CLI get tested, known-good versions of dependencies. Automated tools can handle updating these in a controlled way.
*   **Modular Code Structure:** Follow SOLID principles within your code. Separate concerns by dividing logic into distinct modules (as noted in the project structure). For example, parsing/validation logic can be in one module, business logic in another, and output formatting in another. This makes each part easier to test in isolation.
*   **Dependency Injection for External Services:** If your CLI interacts with external systems (like making HTTP requests, or reading/writing files), abstract those interactions behind interfaces or modules. This way, you can inject mock implementations during testing (see Testing section) and swap out components easily. Never hard-code calls to external services without an abstraction, as that makes testing and maintenance harder.

By modularizing, you also enable reuse of your CLI’s core logic as a library, if needed. Users could programmatically require your CLI’s modules for scripting purposes. Therefore, design modules with clear APIs and minimize inter-module coupling.

## 🚀 Packaging and Publishing as a Global NPM Tool

When preparing your CLI for distribution via npm, follow best practices so it installs and runs smoothly for users:
*   **Executable Entry:** In your `package.json`, use the `"bin"` field to specify the CLI executable name and the path to its startup script. For example:
	```json
	"bin": {
		"mycli": "./dist/index.js"
	}
	```
	This maps the command name `mycli` to your compiled entry file. Upon global install, npm will symlink this to the user’s PATH.

*   **Shebang:** Ensure the entry file (e.g. `bin/index.js` or the compiled `dist/index.js`) has a proper shebang line at the top: `#!/usr/bin/env node`. This makes it directly executable in Unix environments by locating the Node.js runtime automatically. Avoid hard-coding a Node path in the shebang (like `#!/usr/local/bin/node`), as it may not exist on all systems.
*   **Cross-Platform Considerations:** Use Node’s cross-platform path and spawning utilities. For example, if your CLI spawns other processes or scripts, invoke `node` explicitly (e.g. `child_process.spawn('node', [script.js])` rather than executing a script by relative path) to avoid issues with shebang on Windows. Also, handle differences in file paths (use `path.join` instead of manual string concatenation for paths).
*   **Pre-Publish Checks:** Before publishing, test your CLI locally by installing it globally (e.g. via `npm link` or `npm pack`). Verify that running the command works on a clean system, the help text is accessible, and no dev-only files are needed at runtime.
*   **Global Install Guidelines:** Clearly instruct users to install your package globally (`npm install -g yourcli`). If your CLI can also be used via `npx yourcli`, mention that as an option for one-off usage. Keep startup time snappy – avoid heavy initialization so that even `npx` (which reinstalls on each invocation) is quick.
*   **Engine Compatibility:** Specify the Node engine requirement in your `package.json` (e.g. `"engines": {"node": ">=16.0"}`) if you rely on modern Node features. This helps users know the prerequisites and prevents installation on unsupported Node versions.

When publishing updates, adhere to semantic versioning (see below) so users (and tools like npm or semantic-release) can manage upgrades predictably. Provide a changelog or release notes for each release so users know what changed.

## 🏷️ Versioning, Changelogs, and Semantic Release Conventions

Adopt Semantic Versioning (SemVer) for your CLI project and maintain clear changelogs. Under SemVer, every release version conveys meaning about the changes:
*   **MAJOR** version: incremented for incompatible API or CLI interface changes (breaking changes). E.g. removing a command or changing its behavior in a non-backward-compatible way.
*   **MINOR** version: incremented when new features or commands are added in a backwards-compatible manner. E.g. adding a new subcommand or option that doesn’t break existing usage.
*   **PATCH** version: incremented for backwards-compatible bug fixes.

Always update the version accordingly before publishing, and tag releases in your source control. Maintain a `CHANGELOG.md` that lists notable changes for each version (date and summary of additions, changes, fixes). Follow the Keep a Changelog format or a similar standard for consistency (e.g. categorize changes into Added, Changed, Fixed, Removed).

For automating releases, consider using conventional commits and tools like semantic-release. By enforcing a convention in commit messages (for example, Angular commit message format: `feat: ...`, `fix: ...`, `docs: ...`), you enable automation to determine release versions and generate changelog entries. Semantic-release or similar will parse commits to decide if the next release is a major, minor, or patch, and can automatically publish to npm and update the changelog. This ensures your versioning is strictly tied to documented changes and removes human error from the process.

**Changelog Best Practices:** Every user-facing change should be documented. Write changelog entries in plain language, focusing on how the release affects users (e.g. “Added: new `--verbose` flag to show detailed output” or “Changed: the `init` command now writes to `~/.mycli/config.json` instead of the current directory”). This goes hand-in-hand with versioning: users should be able to glance at the changelog and understand if an update is major (potentially breaking) or minor.

In summary, never skip updating the version or changelog for a release. Adhering to semantic versioning and clear changelogs builds trust with your users, as they can upgrade with confidence and know what to expect from each new version.

## 📚 Documentation and Help Output

Provide comprehensive documentation and built-in help for your CLI:
*   **Help Command:** Your CLI must support `-h`/`--help` and output usage instructions for all commands and options. Libraries like Commander generate help text automatically if you define `.description()` and `.option()` for each command. Ensure the help text includes a brief summary of each command, required vs optional arguments, and available global options. The formatting should follow Unix conventions (usage synopsis, then options list, then examples).
*   **Usage Examples:** Include real-world usage examples in the help output or documentation. For complex commands, showing an example invocation and its outcome is invaluable for users. Many CLI help sections have an “Examples:” section – make sure to provide one for clarity.
*   **Man Page or `–help` Detail:** For very intricate CLIs, consider offering extended help (for example `yourcli help <command>` for detailed docs on a subcommand). However, a well-structured `--help` output is usually sufficient if kept up-to-date.
*   **README Documentation:** The project README should serve as a quickstart guide. At minimum, document how to install the CLI, a quick usage snippet, and list the primary commands and options. Use clear, terse language and avoid assuming prior context. Many users will read the README on GitHub or npm, so it should contain the necessary info to get started and a link to more detailed docs if available.
*   **Consistency:** Ensure the documentation matches the actual behavior of the CLI. If an option or command is changed or deprecated, update the help text and README in the same commit as the code change to avoid drift.
*   **Output Standards:** Make the CLI output informative but not overwhelming. By default, print concise success messages or results. Use color highlighting to make important text stand out (e.g. errors in red, headings in bold), but also support a plain output mode (no color) for scripting or accessibility. For machine-consumable output, consider a `--json` flag to output structured JSON instead of pretty text, if applicable.
*   **Error Messages:** (Related to documentation) When usage errors occur (e.g. unknown command, missing argument), provide an error message and remind the user how to get help. For example: “Error: missing required `<filename>` argument. Use `mycli cmd --help` for more information.” This guides users to the documentation instead of leaving them frustrated.

Remember that good documentation and help output significantly improve the user experience and reduce support requests. Treat the help text as part of the user interface – polish it as you would your code.

## 🧪 Unit Testing Best Practices

Implement comprehensive unit tests to ensure each component of your CLI works reliably. Unit tests verify individual functions and modules in isolation, catching bugs early and facilitating refactoring. Use the standard JavaScript/TypeScript testing framework **Jest**, which includes a built-in assertion library (`expect`).

### 📂 Test Structure and Organization

Organize your tests logically alongside your source code. Place test files in a dedicated `__tests__/` directory at the root or within `src/`, mirroring the structure of the code being tested. Alternatively, use a top-level `test/` directory.

*   `src/commands/__tests__/myCommand.test.ts` – Tests for `src/commands/myCommand.ts`.
*   `src/utils/__tests__/helpers.test.ts` – Tests for `src/utils/helpers.ts`.

Configure your test runner (e.g., in `package.json` or a config file like `jest.config.js`) to discover and execute these test files. Use TypeScript-aware runners or tools like `ts-jest` or `ts-node` to run tests directly against your TypeScript source.

### ✍️ Writing Effective Unit Tests

Focus unit tests on verifying the logic of individual functions or classes. Each test case must follow an Arrange-Act-Assert pattern:
1.  **Arrange:** Set up the necessary preconditions and inputs. This includes creating mock objects, preparing input data, or configuring stubs.
2.  **Act:** Execute the function or method being tested with the arranged inputs.
3.  **Assert:** Verify that the outcome matches expectations. Check return values, state changes, or whether specific functions (spies) were called correctly.

**Initial Test Focus:**

When writing tests initially, adhere strictly to the following approach:

<tests>
{{LIST_OF_TESTS}}

Only create tests that confirm the core functionality of the feature. Do not create tests for edge cases, error flows or anything else that does not directly confirm just and only the core functionality.
</tests>

Tests for edge cases and error handling must be deferred unless specifically requested or as part of a dedicated testing phase.

**Test Execution and Reporting:**

Follow this process for running tests and reporting failures:

1.  Create all required happy-path tests.
2.  Run all new and project existing tests together.
3.  For every failed test provide the following:

<format>
# 📝 Activity: ACTOR_VERB
💎 Expected: EXPECTED
🧱 Actual: ACTUAL
💭 Reason: WHY_IT_FAILED
🔧 Proposed Fix: CODE_SNIPPET
</format>

After reporting the test results wait for further instructions on how to proceed.

---

# 👤 Actors & 🧩 Components (Who or what)
> - Someone or something that can perform actions or be interacted with (examples include User, Button, Screen, Input Field, Message, System, API, Database, and they can be a person, service, visual or non-visual).

# 🎬 Activities (Who or what does what?)
> - Actions that an Actor or Component performs (examples include Create List, Delete Item, Sync Data, and they must always contain a verb + action).

**Example Test Case:**

```typescript
import { add } from '../src/utils/math';

describe('Math Utils', () => {
	describe('add function', () => {
	it('should return the sum of two positive numbers', () => {
		// Arrange: Inputs are 2 and 3
		// Act: Call the add function
		const result = add(2, 3);
		// Assert: Expect the result to be 5
		expect(result).toBe(5);
	});

	// Add more happy-path tests as needed
	});
});
```

Keep unit tests small, focused, and fast. They must run quickly and independently of external systems or other tests.

### 🔬 Isolating CLI Logic for Testability

Structure your CLI code to separate core logic from I/O operations (like reading arguments, printing to console, file system access, network requests). This is crucial for effective unit testing.

**Command Logic:** Implement the core functionality of each command in dedicated functions or classes that accept parameters and return results, rather than directly interacting with `process.argv` or `console.log`.

```typescript
// src/commands/greet.ts
export function generateGreeting(name: string): string {
	if (!name) {
	throw new Error('Name is required'); // Note: Error handling tests are deferred initially
	}
	return `Hello, ${name}!`;
}

// src/cli.ts (simplified entry point)
import { generateGreeting } from './commands/greet';
import { Command } from 'commander';

const program = new Command();

program
	.command('greet <name>')
	.description('Greets the specified person')
	.action((name) => {
	try {
		const message = generateGreeting(name);
		console.log(message);
	} catch (error: any) {
		console.error(`Error: ${error.message}`);
		process.exit(1);
	}
	});

// program.parse(process.argv); // Example invocation
```

**Testing the Logic:** In your tests, import and call the logic function (`generateGreeting`) directly, providing inputs and asserting the output. This bypasses the CLI parsing layer and console I/O.

```typescript
// src/commands/__tests__/greet.test.ts
import { generateGreeting } from '../greet';

describe('generateGreeting', () => {
	it('should return a greeting message for a valid name', () => {
	expect(generateGreeting('Alice')).toBe('Hello, Alice!');
	});

	// Initially, do not add tests for error cases like empty names
	// it('should throw an error if the name is empty', () => {
	//  expect(() => generateGreeting('')).toThrow('Name is required');
	// });
});
```

This approach makes your core logic highly testable without needing to simulate the entire CLI environment or spawn subprocesses for most unit tests. Reserve full end-to-end tests (which *do* run the CLI executable) for integration testing.

### 🎭 Mocks, Spies, and Stubs

Unit tests must run in isolation, without real side effects like writing files or making network calls. Use test doubles (mocks, spies, stubs) to simulate and control these interactions:

*   **Mocks:** Replace entire modules or classes with controlled fake implementations. Use these for simulating external dependencies (e.g., an API client). Jest provides powerful mocking capabilities (`jest.mock`, `jest.fn`).
*   **Spies:** Wrap existing functions to track calls, arguments, and return values without changing the original behavior. Use these for verifying that a function was called correctly (e.g., ensuring a logging function was invoked). Use `jest.spyOn`.
*   **Stubs:** Replace specific functions with predefined behavior, often to force a certain code path (e.g., making a function that reads a file return specific content or throw an error).

**Note on Mocking:** While essential for isolating units, avoid excessive mocking. Tests heavily reliant on mocks might not accurately reflect how components interact in the real application. When feasible, consider using real dependencies in a controlled test environment (e.g., a temporary directory for file operations, an in-memory database, or a dedicated test API endpoint) or writing integration tests that cover the interaction points without mocking every layer. The goal is to balance isolation with realistic testing.

**Example: Mocking File System Access (using Jest)**

```typescript
// src/utils/fileHandler.ts
import fs from 'fs';

export function readFileContent(filePath: string): string {
	// Assume happy path for initial tests; error handling tested later
	return fs.readFileSync(filePath, 'utf-8');
}

// src/utils/__tests__/fileHandler.test.ts
import fs from 'fs';
import { readFileContent } from '../fileHandler';

jest.mock('fs'); // Mock the entire fs module

describe('readFileContent', () => {
	it('should return the content of the file', () => {
	const mockReadFileSync = fs.readFileSync as jest.Mock;
	mockReadFileSync.mockReturnValue('Mock file content'); // Stub the return value

	const content = readFileContent('dummy/path.txt');

	expect(content).toBe('Mock file content');
	expect(mockReadFileSync).toHaveBeenCalledWith('dummy/path.txt', 'utf-8'); // Verify call
	});

	// Initially, do not add tests for file system errors
	// it('should propagate errors if readFileSync throws', () => {
	//  const mockReadFileSync = fs.readFileSync as jest.Mock;
	//  mockReadFileSync.mockImplementation(() => { // Stub the implementation to throw
	//      throw new Error('File not found');
	//  });
	//
	//  expect(() => readFileContent('error/path.txt')).toThrow('File not found');
	// });
});
```

**Testing Prompts:** For interactive prompts (e.g., using Inquirer.js), mock the prompt library to provide predefined answers instead of waiting for user input.

```typescript
import inquirer from 'inquirer';

// Spy on and mock the prompt method before tests that need it
jest.spyOn(inquirer, 'prompt').mockResolvedValue({ confirmation: true });

// Call the code that uses inquirer.prompt
// It will immediately resolve with { confirmation: true }

// Restore mocks after tests if needed
jest.restoreAllMocks();
```

By effectively using test doubles, you ensure your unit tests are fast, reliable, and focused solely on the logic of the unit under test. Integrate these tests into your CI/CD pipeline to catch regressions automatically.