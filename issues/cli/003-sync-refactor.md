Workflows:
have:
- Orchestrator (Agent)
- Steps
have:
- Input (optional Template)
- Orchestrator (Agent)
- Prompt
syncs:
- FROM: prompts
- TO: .claude/plx/{verb}/{object}.md (`plx:create:issue.md`)
- Output (Template)
has:
- Blocks
syncs:
- FROM: templates
- TO: .claude/use/{filename}.md (`use/story-template`)
- Output(s)
syncs:
- FROM: workflows
- TO: .claude/start/{filename}.md (`/start:refinement-workflow`)

Agents:
have:
- Expert Role
- Instructions
are:
- Best Practices
- Personal Preferences
- Examples
- Acceptance Criteria
- Rules
- Constraints
syncs:
- FROM: instructions
- TO: .claude/apply/{filename}.md (`/apply:project-conventions`)
syncs:
- FROM: agents
- TO: .claude/agents/{filename}.md (sub agents)
- TO: .claude/commands/act/{filename}.md (`/act:as-requirements-expert`)

All syncs are done per script and:
- replace any wikilinks with @relative/path.md so it gets added to context upon triggered with a command in claude code - we first search the project locations for the location and stop if we find it: prompts, agents, instructions, templates, context, docs - then we search the .claude folder - in claude folder do not specify specific paths the find just look recursivley
- all files synced as commands get inserted a starting instructing to greet the user and take on the persona and wairt for instructions per matching `blocks/meta/{type}-command-block.md` - create any missing ones and insert them the same way
- all prompts always start with a verb - if a prompt has more than 1 word thus a prompt and an object we rename it when we sync it to remove the `{verb}-` part and place it in the folder with the verb name - any prompts that are just one word just get synced to the root of the commands folder.
