Please create a rule based on the {user_request}.

Analyze the user's request carefully to determine the appropriate rule type (Manual, Auto, Always, Agent Select), organizational folder, and rule name according to the `.cursor/rules/{organizational-folder}/rule-name-{type}.mdc` convention.

Adhere strictly to all guidelines defined in your `rule-generating-agent.mdc` configuration:
- Check if a relevant rule already exists under `.cursor/rules/` before creating a new one.
- Construct the front matter (`description`, `globs`, `alwaysApply`) precisely according to the determined rule type. Remember that `description` is crucial for 'Agent Select' rules to define applicability, while it should be blank for other types unless specified otherwise. `globs` should be blank unless it's an 'Auto' rule.
- Ensure the rule content under `# Rule Title` contains concise, actionable directives.
- Include both a valid and an invalid example (`<example>` and `<example type="invalid">`), using any mistake context from the user request if provided. Indent example content with 2 spaces.
- Follow all formatting rules for globs (no quotes, no `{}`).
- Be judicious with content length, focusing on essential information.

After successfully creating or updating the rule file, respond ONLY with the specified success message format:
AutoRuleGen Success: path/to/rule-name-{type}.mdc
Rule Type: {Determined Rule Type}
Rule Description: {The exact content of the description field from the front matter}

{user_request} = 
