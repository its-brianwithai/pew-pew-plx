
Een goede prompt bestaat uit:

- Persona
  - Expertise
  - Domain
  - Role
  - Context
  - Knowledge
  - Experience
  - Skills
  - Abilities
  - Responsibilities
  - Interests
  - Background
  - Preferences
- Request & End Goal
- Workflow
  - Steps
  - Deliverables
- Instructies (when)
  - (When) Scenario:
    - [Best Practices]
    - [Conventions]
    - [Constraints]
    - [Rules]
    - Acceptance Criteria
- Output Format

Alles moet waarde toevoegen aan het end_goal
Dingen moeten niet twee keer voorkomen

- Create frontmatter inserters with prompts - any wiki links in frontmatter get inserted
      - agent: [[agent-here]]
      - agent-backticks: 10
      - agent-backtick-count: 1
      - agent-leading: # Persona\n\nAct as {{persona}}.
      - agent-trailing:
      - agent-tag: persona
      - prompt: [[prompt-here]] - inserted leading # Instructions - trailing
      - workflow: [[instructions-here]] - inserted leading # Instructions - trailing
      - instructions: [[instructions-here]] - inserted leading # Instructions - trailing
        - rules: [[instructions-here]] - inserted leading # Instructions - trailing
        - quality_standards: [[instructions-here]] - inserted leading # Instructions - trailing
        - best_practices: [[instructions-here]] - inserted leading # Instructions - trailing
      - output-format: [[some-template]] - inserted leading # Instructions - trailing
  - this allows prompts to be focused on the actual activity and get 
- Remove default agents, prompts and subagents from workflows
- Allow same struture
- this removes the need for 


- add plx/refine/backlog - which goes over all backlog issues and refines it with refine agent
- add an advisor type of agent that advices what to do based on waht you want to achieve - ith advice prompt
  - also suggest the next best thing to do in the project in terms of creating special agents, creating certain prompts, creating templates, creating context documents - for this we need to create a workflow that creates or updates a project perfect initialisation
- add process feedback prompt - which instructs to improve and agent templates and prompts
- add create branch etc
- add open 
- frontmatter for issue - status
- transform command - transform something ito something else - thus local issue draft to story
- contextualize / conventionalise command - turns any document into a project spe - hmm same as transform-to-project
- add open command - open in cursor, open in intellij, open in finder
- add back /as/ in between folder for agents
- add plx/refine/backlog - which goes over all backlog issues and refines it with refine agnet

```
<plan-workflow>
Discovery Workflow

- TBA

Plan Workflow


1. Initial Request
2. Actors & Components: Who and what?
3. Acceptance Criteria (per actor/component): What should be? What can do?
    1. Abilities
        1. Able to
        2. Can do
    2. States
        1. Is
        2. Has
4. Scenario’s (per acceptance criteria): Which happy flow of actors and components prove acceptance criteria is met?
    1. Step: [Actor or component] [a verb] [subject]
    2. [Another step, add more as needed]
    3. […]
5. Deliverables (per scenario (step)): What needs to exist / be created per step? By who?
    1. Sub deliverables (per deliverable): Which deliverables can be made even smaller aiming for a deliverable that can be delivered within a 3 story point ticket max?
6. User Stories: Which user stories belong to which (set of) deliverables)
7. High level plan: What high level CRUD steps need to be taken for each user story.
    1. Devils Advocate: Argue why it won’t work, what problems will arise and adjust.
8. Action Plan (per high level crud step): What exact steps need to be taken? Which files? What content?
    1. Devils Advocate: Argue why it won’t work, what problems will arise and adjust.




, Component Breakdown, Final Refinement





Initial Refinement

description: transform an idea into tangible feature flows and deliverables

1. Actors & Components: What should be? What can do?
    1. Scenario: What steps do which actors take?
        1. Deliverables: What needs to exist / be created per step? By who?

we already have this as scenario template - change it to 

2. Epic Workflow

output: Epic template

1. Isolation: Which deliverables belong together? What can be worked on in isolation independend of others?
2. High Level Plan: What high level CRUD steps need to be taken to create set of deliverable?
3. Package: Within set of deliverables, what is small enough to be created together and released?
4. Order: In which chronological (and parallel) order should each set of deliverables be delivered? And in which order should the splits be delivered, if any?

3. Story Workflow

input: Deliverable Package
output: User Stories

1. Refinement: How does set of deliverables look like when refined as user story tickets?
2. Development: How does actual implementation look like in current project?

**Placeholders:**
- Use double curly {{ brackets }} to indicate inline instructions the implementer should follow.
- Use `<instructions>` tags within ``` code blocks for multi-line instructions.
- Use `<example>` tags inside `<instructions>` tags to provide concrete examples of expected content.
- Use `<commentary>` tags inside `<instructions>` tags to add explanatory notes or context.


Agent
---
has
---
Expert Role
Instructions
Output (Template)

Template
---
has
---
Sections

Instructions
---
are
---
Best Practices
Project Conventions
Personal Preferences
Examples
Acceptance Criteria
Constraints

Step
---
has
---
Agent
Prompt

Workflows
---
has
---
Steps





Rules of this framework:

Workflows:
    have:
        - Orchestrator (Agent)
        - Steps
            have:
                - Input (optional Template)
                - Orchestrator (Agent)
                - Prompt
                    syncs to:
                        - .claude/plx/{verb}/{object}.md (`plx:create:issue.md`)
                - Output (Template)
                    has:
                        - Blocks
                    sync to:
                        - .claude/use/{filename}.md (`use/story-template`)
            sync to:
                - .claude/execute/{filename}.md (`/execute:create-issue-step`)
        - Output(s)
    sync to:
        - .claude/start/{filename}.md (`/start:refinement-workflow`)

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
            sync to:
                - .claude/follow/{filename}.md (`/follow:project-conventions`)
    sync to:
        - .claude/agents/{filename}.md (sub agents)
        - .claude/commands/act/as-{filename}.md (`/act:as-requirements-expert`)




</plan-workflow>
```


- based on previous work or arguments, suggest any prompts, agents, templates etc - ask the expert themselves and present them with wrk done and come back with a full report
- add tools, dependencies, etc to project context
- add init-plx which goes over entire project and suggests all project context in a file where you has to markdown checklist yes and no
```
<idea>
create the concept of context parameters, which for example can be any [actor-template]. so make it configurable per front-matter.

``````
in that same fashion create highly reusable verb prompts like change and then question and the mode and the different modes for example as arguments - allowing teh user to specifiy 1/2/3 which can be me question-mode-1 as context or just 1 and then any agent should know it means ofn of theose pew pew 
``````

</idea>
```


/suggest
/suggest:and:improve

modes

defaut behavuours:
- research first
/init-plx
/tutorial
- - devils advocate
- - docuemntation style

yaml config for which secondaries
yaml config which context can be used as input - if not specified  when running an input command, suggest possible inputs
for locations of syncs
make backlog items

default agent behaviours
self analyzing coming up with suggestions - do we have the right agents for the job

plx dev plan

default agent behaviours

with, and - meta

meta context

start/workflow - show wizard

plx/help
plx/commands

integrate bmad


add name and description to all entities
