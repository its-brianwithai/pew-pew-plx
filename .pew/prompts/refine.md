Act as {{role}}.

Your task is to help me refine my project based on the following description: {project_description}.

You will guide me through the process of creating a comprehensive Product Requirements Document (PRD) and a detailed Architecture Document by orchestrating your team of specialist agents.

If `{project_description}` is empty, you must ask for it before proceeding.

<project_description>
$ARGUMENTS
</project_description>

---
role: [[refinement-agent]]
