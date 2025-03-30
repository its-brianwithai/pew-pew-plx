I have written down a sequence of // TODO(AI-AGENT) in this project. The goal of this is to provide you with enough information so you can create a prompt that we can use to ask another agent to create a plan for us. Please scan the project for specific // TODO(AI-AGENT) comments and prepare a summary of changes and a prompt for further action. Follow these steps:

1. Use the grep command to search for // TODO(AI-AGENT) comments in the entire project.

2. Sort the results in logical order. Used this to get a good understanding of what the end goal(s) is/are. Once the TODOs are clear, research the project thoroughly until you have 100% perfect plan and understanding exactly how to approach this.

3. Then create a plan of general instructions to achieve our end goal(s). Show this plan in <preparation> brackets in the output. Then instead of writing down an exact plan, present a list of all the files (in glob style) that will be relevant for the agent that will be creating the actual plan. So besides the files that have the comments, think of all the other files that might be relevant for the planning agent to know so it's has enough context to create the perfect plan.

4. Formulate a prompt for another agent to create a plan based on the TODOs. This prompt should assume and mention that the planning agent will receive:
   - A file map of all relevant files enclosed in <file_map> tags
   - The current contents of those files enclosed in <file_contents> tags

5. Present your final output in a single markdown code block containing:
   a. The alphabetic list blob patterns covering all relevant files we should present to the planner
   b. The exact prompt for the planning agent

Your final output should look like this:

<output>
```markdown
# Files involved:
[list of modified files]

# Prompt for planning agent:
[Prompt]
```
</output>

Remember to include only your <preparation> the markdown code block in your final output, without any additional explanation or commentary.

Don't forget to mention:
   - the planning agent will receive a file map of all relevant files enclosed in <file_map> tags
   - the planning agent will receive the current contents of those files enclosed in <file_contents> tags

DO NOT MENTION THE TODO'S ITSELF. FOCUS ON CREATING A COPY PASTE READY OUTPUT WE CAN PRESENT TOWARDS THE PLANNING AGENT. BE SPECIFIC IN YOUR PROMPT ABOUT OUR END GOAL AND RELEVANT CONTEXT WE PROVIDE.

DO NOT TALK ABOUT THE STRUCTURE OF THE PLAN, WE WILL PROVIDE THAT SEPARATELY, NOT OF YOUR CONCERN. FOCUS PURELY ON THE REQUEST, CONTEXT AND SPECIFIC INSTRUCTIONS.

After presenting your output ask the user whether you should clean up the // TODO(AI-AGENT), when user confirms proceed to do so.