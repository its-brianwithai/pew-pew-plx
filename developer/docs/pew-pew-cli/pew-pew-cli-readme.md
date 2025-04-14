# pewPewCLI ❤️ agents fav dev tool 🔫

A simple CLI for agents to manage their markdown task files. Run commands like `pew next task` to check off tasks or `pew paste tasks` to update your task list from clipboard.

## 💻 Install

```bash
npm install -g pew-pew-cli
```

## 🏗️ Usage

```bash
pew init
pew paste tasks
pew next task
```

## 💬 Prompt

Here's a prompt to get started once you have a task file:

```
You are an AI assistant tasked with executing the next available milestones and set of tasks. Follow these instructions carefully:

1. First, review the content of the tasks.md file:
<tasks_md>
tasks.md
</tasks_md>

1. Understand the context of your task:
   - Your goal is to complete the next available milestone and set of tasks for the next developer
   - You must follow the plan exactly without adding or changing anything

2. Identify the next available milestone and tasks:
   - Look for Milestone {{MILESTONE_NUMBER}}
   - Identify the next uncompleted set of tasks until the next milestone
   - Use `pew next task` to get your first task

3. Research project context
   - Based on the output of `pew nexxt task` scan all related files until you have a good understanding of:
       - The repository structure
       - How similar features are organized
       - Which files are important for your task

4. Execute the tasks:
   - Complete each task in order.
   - Use `pew next task` to complete your current task and get your next task
   - After completing a task, update the tasks.md file by marking the completed task with [x] using `pew next task`
   - Do not skip any tasks or change their order
   - If a task is unclear, do your best to interpret it based on the context provided

5. After completing all tasks for the milestone:
   - Run `pew` commands to confirm everything works.
   - Fix the issues related to work done.

6. When you have completed all tasks:
   - Ask the user what you should do next.

Always remember:
- Stick to the plan provided in the tasks.md file.
- Do not add or change the approach lined out in your tasks file.
- Focus only on the tasks for the specified milestone and developer.
- Update your task file between each completed task by checking off the unchecked task you completed.
- Use `pew` commands to navigate tasks and manage your project.

Begin your work by reading the tasks file using your read_file tool. Identify the next available task for Milestone {{MILESTONE_NUMBER}}.

Once you've completed all assigned tasks return to me for further instructions.

Please run pew commands on your own, yolo mode is on - you do not need permission.
```

For more prompts and examples check out [ultrawideturbodevs.com](https://ultrawideturbodevs.com)

## 📝 Commands

| Command                 | Description                                                           | Arguments          | Options                                                                                                |
| :---------------------- | :-------------------------------------------------------------------- | :----------------- | :----------------------------------------------------------------------------------------------------- |
| `pew init`              | Initialize the pewPewCLI project structure in the current directory.  | _None_             | `-f, --force`: Force initialization even if `.pew` directory exists.                                    |
| `pew set path`          | Set a configuration value for a path.                                 | _None_             | `--field <field>`: Field to set (currently only `tasks`).<br>`--value <value>`: Path value to set.<br>`-g, --global`: Set in global config (`~/.pew`). |
| `pew paste tasks`       | Paste clipboard content into the configured primary tasks file.         | `tasks` (required) | `--overwrite`: Overwrite the entire tasks file.<br>`--append`: Append content to the end.<br>`--insert`: Insert content at the beginning.<br>`--force`: Alias for `--overwrite`. |
| `pew next task`         | Mark the current task as complete and display the next task.          | `task` (required)  | _None_                                                                                                 |

## 📦 Configuration

### 📂 Initialize Project

Creates the `.pew` directory and default configuration files (`.pew/config/paths.yaml`, `.pew/tasks.md`) in the current directory. It will prompt for the primary tasks file path unless `--force` is used.

```bash
pew init
```

Force initialization without prompts:

```bash
pew init --force
```

**`paths.yaml` structure:**

```yaml
tasks:
  - path/to/your/tasks.md # Can be relative
  # - /absolute/path/to/another/tasks.md # Absolute paths also work
```

### 📋 Paste from Clipboard

Paste clipboard content into the configured primary tasks file. If no mode flag is provided, you will be prompted to choose.

Append content:

```bash
pew paste tasks --append
```

Overwrite content:

```bash
pew paste tasks --overwrite
# or
pew paste tasks --force
```

Insert content at the beginning:

```bash
pew paste tasks --insert
```

Paste with interactive prompt for mode:

```bash
pew paste tasks
# > Choose paste mode: (Use arrow keys)
# > overwrite
#   append
#   insert
```

### 🎯 Advance to Next Task

Marks the first uncompleted task (`- [ ]`) in the primary tasks file as complete (`- [x]`) and displays the next uncompleted task along with context (headers) and summary statistics.

```bash
pew next task
```

## 📦 Dependencies

Key dependencies include:

-   [commander](https://github.com/tj/commander.js/): For command-line argument parsing.
-   [inquirer](https://github.com/SBoudrias/Inquirer.js/): For interactive CLI prompts.
-   [clipboardy](https://github.com/sindresorhus/clipboardy): For clipboard access.
-   [js-yaml](https://github.com/nodeca/js-yaml): For YAML parsing and serialization.

## 👋 Contact

[ultrawideturbodevs.com](https://ultrawideturbodevs.com)
