# Raycast Power Prompter

Welcome to the Raycast Power Prompter repository! This project is a collection of structured prompts, templates, and conventions designed to be used as [Raycast Snippets](https://www.raycast.com/pro/snippets). It forms the core of the "Power Prompter Engineering Workbench" (PEW), a framework for streamlining development, documentation, and communication workflows.

## ✨ Features

-   **Modular Blocks**: Reusable components for building complex documents (`title-block`, `user-stories-block`, etc.).
-   **Project Conventions**: Detailed guides for development, especially for Flutter (`flutter-con-*`, `flutter-ins-*`).
-   **Workflow Prompts**: Ready-to-use prompts for common tasks like Git commits, refining documents, and processing feedback.
-   **Scriptable**: Comes with a set of shell scripts to parse all files into a Raycast-compatible JSON format.

## ⚙️ How It Works

This repository is structured as a collection of plain text files (`.md`, `.sh`, etc.) that serve as the source for the Raycast snippets. A set of shell scripts located in the `/scripts` directory reads these files, formats them, and generates JSON files that you can directly import into Raycast.

This approach allows the snippets to be version-controlled, easily shared, and collaboratively improved.

## 🏁 Getting Started: A Step-by-Step Guide

Follow these steps to merge the PEW snippets with your own and import them into Raycast.

### Step 1: Export Your Existing Raycast Snippets (Optional but Recommended)

To avoid overwriting your personal snippets, you should first export them from Raycast. This allows our scripts to merge them with the snippets from this repository.

1.  Open the Raycast command bar.
2.  Type `Export Snippets` and run the command.
3.  Raycast will prompt you to save a `.json` file.
4.  Save this file inside this repository at the following location: `imports/current-raycast-snippets.json`. If the `imports` folder doesn't exist, please create it.

By placing your snippets here, the scripts will automatically pick them up and merge them, ensuring none of your work is lost.

### Step 2: Run the Parsing Scripts

The repository includes an orchestrator script that handles the entire parsing and merging process.

1.  First, make sure the scripts are executable. Open your terminal in the repository's root directory and run:
    ```sh
    chmod +x scripts/*.sh
    ```
2.  Now, run the main parsing script:
    ```sh
    ./scripts/parse-all-raycast-snippets.sh
    ```
    This script will process all the source files, merge them with your existing snippets (if provided), and generate the final JSON files in the `exports/` directory.

### Step 3: Understand the Generated Export Files

After the script finishes, you will find the following files in the `exports/` directory:

-   `pew-raycast-snippets.json`: Contains **all** snippets from this repository. This is the complete, standalone PEW framework set.
-   `new-raycast-snippets.json`: Contains only the PEW snippets that **do not** have a matching keyword in your `imports/current-raycast-snippets.json`. This is ideal if you only want to add the new, missing snippets from this project without affecting your existing ones.
-   `combined-raycast-snippets.json`: A comprehensive file that merges the contents of your `imports/current-raycast-snippets.json` with `pew-raycast-snippets.json`. **This is the recommended file to import** for a complete, unified set of snippets. By default, snippets from this repo will overwrite any of your existing snippets that share the same keyword.

### Step 4: Import into Raycast

1.  Open Raycast Preferences (you can type `Preferences` in the Raycast bar).
2.  Navigate to the `Extensions` tab and find `Snippets` in the list.
3.  Click the `Import/Export` button and select `Import Snippets`.
4.  Choose one of the generated files from the `exports/` directory. We recommend using `combined-raycast-snippets.json`.

Your snippets are now updated!

## 🔄 Workflow: Keeping Your Snippets Synced

To keep your personal snippets and the PEW framework snippets in sync over time, you can follow this simple workflow:

1.  **Update in Raycast**: Create, edit, or delete snippets directly within the Raycast app as you normally would.
2.  **Export**: When you're ready to sync, export your snippets from Raycast again, overwriting the `imports/current-raycast-snippets.json` file.
3.  **Pull Changes**: Get the latest updates from this repository (`git pull`).
4.  **Re-run Script**: Execute `./scripts/parse-all-raycast-snippets.sh` to generate the new merged files.
5.  **Re-import**: Import the updated `exports/combined-raycast-snippets.json` back into Raycast.

This cycle ensures your personal collection of snippets grows alongside the PEW framework.

## 🛠️ Script Breakdown

-   **`parse-pew-raycast-snippets.sh`**: Reads all source files in the repository (excluding `imports/` and `exports/`) and creates `pew-raycast-snippets.json`.
-   **`parse-new-raycast-snippets.sh`**: Compares `pew-raycast-snippets.json` with `current-raycast-snippets.json` and outputs only the snippets that are unique to the PEW set.
-   **`parse-combined-raycast-snippets.sh`**: Merges your current snippets with the PEW snippets. It contains a `PEW_TAKES_PRECEDENCE` flag to control conflict resolution.
-   **`parse-all-raycast-snippets.sh`**: The main orchestrator that runs the other scripts in the correct order.