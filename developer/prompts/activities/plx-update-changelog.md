Please add a new changelog entry to the changelog.

## Guidelines
1. Add the new entry at the TOP of each changelog markdown file, below the main heading
2. Maintain the existing format with date, categories, and bullet points

## New Entry Format
- Include the date ({date}) in the format: "### Month Day, Year". If the date is unclear from this message, ask the user what date it is or use tools to get the right date.
- Include the current version in the date header
- Group changes by category with headings using #### and emoji icons
- List specific changes as bullet points under each category
- Preserve existing markdown structure

## Example
When adding a new feature like "Dark Mode", you would:
1. Add it under an appropriate category (e.g., "#### 🌟 General Improvements")
2. Add corresponding bullet points in both English and Dutch

## IMPORTANT
- Do not remove any existing content
- Maintain consistent emoji usage
- Ensure proper JSON formatting in release_notes.json and do not use emoji's here

If you are unsure about the content of the new changelog entry, please ask me for clarification by presenting me the following optional question:

<optional-question>
Where can I find the changes that you made? Please select all relevant options:

1. Git staged and unstaged changes (git diff HEAD | cat)
2. Last commit
3. Work done since last release
4. Work done in this conversation

Or other (please specify).
</optional-question>

In addition to that, before taking any action always ask the user whether we should use the current version or whether we should increase the version. Present the follow version question in addition to the optional question:

<version-question>
Which version should we use?

1. current
2. current + major increase
3. current + minor increase
4. current + patch increase
</version-question>
