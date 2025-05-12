Act as Expert Project Decomposer.

Your task is to decompose a comprehensive project plan, provided in `{input_project_plan_content}`, into separate, self-contained Markdown files for each milestone. These files will be stored in the `{output_base_directory}`.

Follow these steps:

1.  **Understand the Input:**
    *   Thoroughly read the entire project plan located at `{input_project_plan_content}`.
    *   Identify the main project name, epic name, or a suitable high-level identifier from the project plan's title or overview. This will be used as `{project_name_or_epic}` for naming the output files.

2.  **Locate Milestones:**
    *   Find the section in the project plan that lists the milestones and their associated tasks (e.g., a section titled 'Milestones and Tasks', 'Project Phases', or similar).

3.  **Process Each Milestone:**
    *   For each milestone identified:
        *   Extract the full milestone title, including its number and name (e.g., 'Milestone 1: Cache Structure & Loading'). Let this be `{milestone_full_title}`.
        *   Generate a kebab-case version from the milestone number and name for the filename (e.g., for 'Milestone 1: Cache Structure & Loading', the kebab-case version would be `milestone-1-cache-structure-loading`). Let this be `{milestone_kebab_filename_part}`.
        *   The output filename MUST follow the pattern: `{output_base_directory}/{project_name_or_epic}-{milestone_kebab_filename_part}.md`. For example, if `{output_base_directory}` is `backlog/`, `{project_name_or_epic}` is `offline-caching-project`, and `{milestone_kebab_filename_part}` is `milestone-1-cache-structure-loading`, the filename will be `backlog/offline-caching-project-milestone-1-cache-structure-loading.md`.
        *   Create this new Markdown file.
        *   Populate the file with the following structure and content, ensuring all information is specific to *this* milestone:

            ```markdown
            # {milestone_full_title}

            ## 1. Milestone Overview

            ### 1.1. Purpose of this Milestone
            (Extract or synthesize a concise summary of this milestone's primary goals, deliverables, and overall purpose. This section should clearly state what this milestone is about, based on its description in the original project plan.)

            ### 1.2. Relation to Overall Project
            (Briefly explain how this milestone contributes to the overall project goals. You may need to refer to the original project plan's 'Project Overview' section and synthesize a concise, milestone-relevant summary that puts this milestone into the larger project context.)

            ### 1.3. Preceding Work (Context)
            (If this is not the first milestone, briefly describe what was completed in the previous milestone(s) that sets the stage for this one, i.e., what has been developed before this. If it is the first milestone, state: "This is the initial milestone for the project.")

            ## 2. Milestone-Specific Requirements and Tasks
            (Carefully extract ALL tasks, sub-tasks, 'Do:' items, sequence diagrams (as Mermaid code blocks), file lists, class details, variable changes, method definitions, process descriptions, and any other detailed requirements that are listed *under this specific milestone* in the original project plan.
            Maintain the original structure, formatting (including headings, sub-headings, bullet points, checklists `[ ]` or `[x]`), code blocks, and indentation of these details as accurately as possible.)
            ```
        *   Ensure that the content for 'Purpose of this Milestone', 'Relation to Overall Project', and 'Preceding Work (Context)' is derived and summarized by you, based on your understanding of the original plan and the current milestone's scope.
        *   The 'Milestone-Specific Requirements and Tasks' section must be a direct and complete extraction of the details pertaining *only* to the current milestone from the original plan.

4.  **Final Check:**
    *   Verify that each generated milestone file is self-contained and provides sufficient information for an AI agent to work on that milestone independently.
    *   Ensure filenames are correctly formatted according to the specified pattern and are placed in the `{output_base_directory}`.

```yaml
persona:
project_name_or_epic:
output_base_directory:
```

<input_project_plan_content>
</input_project_plan_content>
