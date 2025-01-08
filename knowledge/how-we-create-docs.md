---
document_type: knowledge
goal: define structure for knowledge, protocol and workflow documents
gpt_action: follow this template when asked to create new documents
---

# Core Components

1. **Actors and Components**
   - Use double brackets to define actors: `[[Actor]]`
   - Use double brackets to define components: `[[Component]]`

2. **Actions**
   - Use double brackets for reusable actions: `[[action name]]`
   - First usage of an action can include definition if needed
   - Subsequent uses can reference without definition

3. **Relationships**
   - Actor/Component DOES Action
   - Action CAN HAVE sub-actions
   - Action CAN HAVE code examples
   - Action CAN BE conditional
   - Actions CAN BE reused across sections

4. **Code Examples**
   - Use triple backticks to define code examples: ```dart
   - You may insert these underneath steps or actions

## Structure Pattern

1. **Document Header**```markdown
---
document_type: [protocol|workflow]
goal: [clear goal statement]
gpt_action: [specific instruction for GPT]
---
```

2. **Milestone Headers**
   - Use emoji + title: `# 🎯 Milestone Name`
   - Keep consistent emoji per type:
     - 🧱 Planning
     - 🛠️ Development
     - 🚀 Release
     - etc.

3. **Steps Format**
```markdown
1. [[Actor]] [[action]]
   1. [[action]]
      1. Sub-step
      2. Sub-step
   2. Next action
2. [[Actor]] [[different action]]
```

4. **Conditional Logic**
```markdown
1. IF [[Condition]]
   1. [[Actor]] [[action]]
   2. [[Actor]] [[another action]]
```

## Action Definition Pattern

When defining an action for the first time:
```markdown
1. [[Actor]] [[new action]]
   1. [[new action]]
      1. First step of action
      2. Second step of action
      3. IF [[condition]]
         1. Conditional step
```

## Example

```markdown
# 🎯 Feature Implementation

1. [[Developer]] [[analyze requirements]]
   1. [[analyze requirements]]
      1. Review documentation
      2. List dependencies
      3. IF [[missing information]]
         1. [[Developer]] [[request clarification]]
2. [[Developer]] [[write tests]]
``` 

## Complete Example: Development Workflow

```markdown
---
document_type: workflow
goal: define core development workflow
gpt_action: follow these steps for all development work that you do
---

# 🧱 Planning

1. [[User]] gives [[input]]
2. [[GPT Agent]] start with [[research solution]] based on [[input]]
   1. [[research solution]]
      1. Scan codebase
      2. Scan documentation
      3. Scan user input
      4. Ask clarifying questions
3. [[GPT Agent]] [[create plan]]
   1. [[create plan]]
      1. Create clear step-by-step list of [[chronological atomic tasks]]
      2. Divide tasks under [[clear milestones]]
      3. Create and add test tasks that confirm exactly and only result of testable [[chronological atomic tasks]] & testable [[clear milestones]].
4. [[GPT Agent]] presents plan
5. [[User]] and [[GPT Agent]] enter [[feedback loop]]
   1. [[feedback loop]]
      1. IF [[User]] gives feedback
         1. [[GPT Agent]] process feedback
      2. [[User]] and [[GPT Agent]] repeat until [[User]] approves
6. [[GPT Agent]] starts with implementation of plan

# 🛠️ Development

1. [[GPT Agent]] [[start new task]] with with first of [[clear milestones]] and first of [[chronological atomic tasks]]
   2. [[start new task]]
      1. IF [[Task is first of new milestone]]
         1. [[GPT Agent]] confirms approach
         2. [[User]] and [[GPT Agent]] enter [[feedback loop]]
         3. [[GPT Agent]] start with implementation of task
      2. [[GPT Agent]] completes task
         1. IF [[Task is test]]
            1. [[GPT Agent]] starts [[testing process]]
               1. IF [[Tests fail]]
                  1. [[GPT Agent]] analyses first failing test
                  2. [[GPT Agent]] [[research solution]] to create [[fix test approach]]
                  3. [[User]] and [[GPT Agent]] enter [[feedback loop]]
                  4. [[GPT Agent]] start with implementation of [[fix test approach]]
                  5. [[GPT Agent]] repeats [[testing process]]
      3. [[GPT Agent]] updates [[your-todo-list]]
      4. [[GPT Agent]] [[start new task]]

# 🚀 Release

1. [[GPT Agent]] starts [[testing process]]
2. [[GPT Agent]] presents summary of all work done to [[User]]
3. [[GPT Agent]] and [[User]] enter [[feedback loop]]
4. [[GPT Agent]] asks [[User]] for release process
5. [[GPT Agent]] is a hero
```

This example demonstrates:
1. Clear milestone headers with emojis (🧱 Planning, 🛠️ Development, 🚀 Release)
2. Actors ([[User]], [[GPT Agent]]) performing actions
3. Action definitions on first use (e.g., [[research solution]], [[create plan]])
4. Conditional logic (IF statements)
5. Reuse of actions (e.g., [[feedback loop]] used multiple times)
6. Hierarchical task structure with clear relationships 
