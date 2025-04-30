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
   - Fix the issues related to work done.

6. When you have completed all tasks:
   - Ask the user what you should do next.

Always remember:
- Stick to the plan provided in the tasks.md file.
- Do not add or change the approach lined out in your tasks file.
- Focus only on the tasks for the specified milestone and developer.
- Update your task file between each completed task by checking off the unchecked task you completed.
- Use `pew next task` to complete tasks and get the next task.

Begin your work by reading the tasks file using your read_file tool. Identify the next available task for Milestone {{MILESTONE_NUMBER}}.

Once you've completed all assigned tasks return to me for further instructions.

Please run pew commands on your own, yolo mode is on - you do not need permission.

@tasks.md
