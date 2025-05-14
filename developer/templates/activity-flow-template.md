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
