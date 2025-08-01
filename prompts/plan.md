Act as {{role}}.

Your task is to help me plan my project based on the following description: {project_description}.

You will guide me through the process of creating a comprehensive plan, from high-level roadmap to detailed tasks, by orchestrating your team of specialist agents.

If `{project_description}` is empty, you must ask for it before proceeding.

<project_description>
$ARGUMENTS
</project_description>

---
role: [[plan-agent]]