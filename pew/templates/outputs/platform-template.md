---
name: platform-template
description: Use this template to indicate certain platforms within this project. It's important that we don't put specific project details in this template, so we can also use this platform description elsewhere. We need to focus purely on what the platform does, what the possibilities are, and how you get access to the platform.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
# [Fitting Emoji] Platform: [Name]
> 💡 *An external service, tool, or technology platform that this project integrates with or depends on.*

[Short description of what this platform is and what it enables.]

## 🧩 Function
> 💡 *The core purpose and role this platform serves within this project ecosystem.*

[What the platform provides or supports within the system.]

## ⚙️ Capabilities
> 💡 *Key features, services, or actions the platform enables. Focus on what's possible and relevant to this project.*

[List of key features and capabilities the platform offers]

<example>
- Data storage and retrieval
- User authentication and authorization
- Real-time notifications via [[example-notification-service]]
- Integration with [[example-third-party-api]]
- Analytics and reporting dashboard
</example>

## 🔐 Access & Configuration
> 💡 *How the platform is accessed, who manages it, and any relevant setup or integration requirements.*

[Information about access, management, and configuration details]

<example>
- **Access:** Web dashboard at [platform URL]
- **Authentication:** API keys managed by [[example-team-backend]]
- **Configuration:** Environment variables in [[example-config-file]]
- **Documentation:** [Link to platform documentation]
- **Support:** Contact [support method] for issues
</example>
