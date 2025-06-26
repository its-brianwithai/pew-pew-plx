# 🔄 Activity Flow: {Activity Name}

> Detailed step-by-step workflow specification for {activity_name} defining the interaction between classes, methods, and data flow. Maps out execution paths including success scenarios, error handling, and alternative flows for implementing {feature/process} with clear technical requirements and test criteria.

<!-- IMPORTANT: This template is for defining activity flows, often in a YAML-like structure. Ensure the 'name' field under 'activity' is updated to match the specific context. -->

## 🤖 AI Agent Context
> 💡 *Essential information for the AI agent to understand and execute tasks related to this activity flow. Review all linked resources thoroughly before proceeding.*

## 📚 Relevant Project Files & Code
> 💡 *List all project files, code snippets, or directories that the AI agent **must read and understand** to effectively define or implement this activity flow. Include paths relative to the project root and a brief note on their relevance.*
*   `[path/to/related_feature_requirements.md]` - (Relevance: Overall requirements this flow is part of)
*   `[path/to/existing_class_definitions/]` - (Relevance: Classes that will be involved in this flow)
*   *Example: `src/services/user_service.dart` - (Relevance: Service whose methods might be called in this flow)*

## 🌐 Relevant Documentation & Links
> 💡 *List any external web pages, API documentation, design specifications (e.g., Figma for UI flows), or other online resources the AI agent should consult.*
*   `[Link to Sequence Diagram or State Machine if available]` - (Relevance: Visual representation of the flow)
*   `[Link to UI mockups if this is a user-facing flow]` - (Relevance: Expected user interface interactions)
*   *Example: `https://docs.api.example.com/endpoints/action_xyz` - (Relevance: API endpoint triggered in this flow)*

## 💡 Other Key Information
> 💡 *Include any other critical context, specific instructions, or points the AI agent needs to be aware of. This could include error handling strategies, performance considerations, or specific business rules governing the flow.*
*   `[Context point 1: e.g., This flow must handle potential network errors gracefully.]`
*   `[Context point 2: e.g., All state changes must be logged for auditing purposes.]`
*   *Example: The primary goal is to clearly define the success path and key alternative/error paths.*

## 📋 Activity Definition

activity:
name: [Enter Activity Name]
steps:
# Repeat this block for each step in the activity
- step: "`[Step Keyword e.g., Given, When, Then, And]` [Step Description]"
classes:
# Option 1: Class listed by name only (repeat or use Option 2 as needed)
- name: [ClassNameOnly]
# Option 2: Class with details (repeat or use Option 1 as needed)
- name: [ClassNameWithDetails]
variables:
- [variable_name_1]
# - [variable_name_2]
methods:
# Method 1 (repeat this method structure as needed)
- name: [method_name_1]
type: [return_type | void | async]
inputs:
- [input_name_1_for_method_1]
# - [input_name_2_for_method_1]
outputs:
- [output_name_1_for_method_1]
# - [output_name_2_for_method_1]
logic:
- [logic_step_1_for_method_1]
# - [logic_step_2_for_method_1]
tests:
- [test_description_1_for_method_1]
# - [test_description_2_for_method_1]
-
# Method 2 (example if more methods are needed)
# - name: [method_name_2]
#   type: [return_type | void | async]
#   inputs:
#     - [input_name_1_for_method_2]
#   logic:
#     - [logic_step_1_for_method_2]
#   tests:
#     - [test_description_1_for_method_2]
chores:
- [chore_description_1]
# - [chore_description_2]
# Example of another step:
# - step: "`[Another Step Keyword]` [Another Step Description]"
#   classes:
#     - name: [AnotherClassName]
#     - name: [YetAnotherClassNameWithDetails]
#       # ... (details structured as above)