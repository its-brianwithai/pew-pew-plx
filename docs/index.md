---
layout: default
title: ⚡ Ultra Wide Turbo Workspace
---

# ⚡ Ultra Wide Turbo Workspace

[![Brought to you by ultrawideturbodevs.com](https://img.shields.io/badge/Brought%20to%20you%20by-ultrawideturbodevs.com-blue?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0id2hpdGUiIGQ9Ik0xMiAyQzYuNDggMiAyIDYuNDggMiAxMnM0LjQ4IDEwIDEwIDEwIDEwLTQuNDggMTAtMTBTMTcuNTIgMiAxMiAyem0xIDE1aC0ydi0yaDJ2MnptMC00aC0yVjdoMnY2eiIvPjwvc3ZnPg==)](https://ultrawideturbodevs.com)

🎩 A virtual organization where you are the CEO. This workspace is structured around distinct **Roles**, each represented by a top-level folder acting as their dedicated "office".

## Latest Release

{% assign latest_release = site.github.releases | first %}
{% if latest_release %}
**{{ latest_release.name }}** - Released on {{ latest_release.published_at | date: "%B %d, %Y" }}

{{ latest_release.body }}

[View all releases]({{ site.github.releases_url }})
{% else %}
Check our [releases page]({{ site.github.releases_url }}) for the latest updates.
{% endif %}

## 📁 Role Folder Structure

Each role's top-level folder serves as their office. Inside, you can optionally organize resources into standardized subfolders to maintain consistency:

| Folder                 | Purpose                                                  | Examples                                             |
|------------------------|----------------------------------------------------------|------------------------------------------------------|
| 💬 prompts/agents/     | AI persona definitions with expertise & responsibilities | Files defining agent roles (e.g., `you-are-{persona}.md`) |
| 💬 prompts/activities/ | Structured instructions for specific well-defined tasks  | Files defining tasks (e.g., `plx-{activity}.md`)     |
| ✨ snippets/           | Reusable text fragments or code blocks                   | Short text files (e.g., `;given.md`, `;ai.md`)       |
| 📋 templates/          | Standardized formats                                     | Document templates, starter files (`*-template.md`)  |
| ✨ wows/                | Way of Workings (Best Practices/Guides)                  | How-to guides, best practice docs (`wow-*.md`)       |
| ✅ rubrics/             | Evaluation criteria                                      | Quality standards, assessment frameworks             |
| 📜 scripts/            | Automated procedures                                     | Shell scripts, Python scripts                        |
| ⚙️ systems/            | Repeatable workflows & standard procedures               | Process templates, defined workflows                 |
| 📦 resources/          | Reusable assets & reference materials                    | Collections, reference materials                     |

## 👥 Workspace Roles

{% assign roles = site.pages | where_exp: "page", "page.path contains '/docs/roles/'" | sort: "title" %}

<div class="role-grid">
{% for role in roles %}
  <div class="role-card">
    <h3><a href="{{ role.url | relative_url }}">{{ role.title }}</a></h3>
    <p>{{ role.description }}</p>
  </div>
{% endfor %}
</div>

<div class="role-list">
  <h3>🏛️ <a href="roles/architect">Architect</a></h3>
  <p>Creates detailed technical blueprints and architectural designs based on product requirements.</p>
  
  <h3>📱 <a href="roles/aso-expert">ASO Expert</a></h3>
  <p>Specializes in App Store Optimization strategies to improve mobile application visibility.</p>
  
  <h3>🔄 <a href="roles/automation-alchemist">Automation Alchemist</a></h3>
  <p>Specializes in automating complex tasks and research processes.</p>
  
  <h3>🧱 <a href="roles/bmad">BMAD</a></h3>
  <p>Dedicated to exploring and implementing BMad methodologies.</p>
  
  <h3>💡 <a href="roles/brainstormer">Brainstormer</a></h3>
  <p>Facilitates idea generation and creative problem-solving sessions.</p>
  
  <h3>📊 <a href="roles/business-analyst">Business Analyst</a></h3>
  <p>Performs market research and project definition, analyzing opportunities and user demographics.</p>
  
  <h3>📢 <a href="roles/communications-officer">Communications Officer</a></h3>
  <p>Manages internal and external communications, preparing meeting agendas and summaries.</p>
  
  <h3>📝 <a href="roles/content-creator">Content Creator</a></h3>
  <p>Develops optimized content for various platforms and channels.</p>
  
  <h3>💻 <a href="roles/developer">Developer</a></h3>
  <p>Implements features according to technical specifications, following coding standards and best practices.</p>
  
  <h3>📖 <a href="roles/doc-expert">Doc Expert</a></h3>
  <p>Specializes in creating, reviewing, and transforming documentation.</p>
  
  <h3>📋 <a href="roles/project-manager">Project Manager</a></h3>
  <p>Creates product requirements documents and manages the Agile workflow.</p>
  
  <h3>🤖 <a href="roles/prompt-engineer">Prompt Engineer</a></h3>
  <p>Designs and optimizes prompts for AI interactions.</p>
  
  <h3>📑 <a href="roles/proposal-manager">Proposal Manager</a></h3>
  <p>Creates milestone proposals and project proposals.</p>
  
  <h3>🔬 <a href="roles/researcher">Researcher</a></h3>
  <p>Defines research questions and methodologies, conducts studies and analyzes data.</p>
  
  <h3>✅ <a href="roles/tester">Tester</a></h3>
  <p>Designs and executes acceptance tests to validate functionality and ensure quality.</p>
  
  <h3>🎨 <a href="roles/uiux-expert">UIUX Expert</a></h3>
  <p>Translates UI/UX specifications into optimized designs and components.</p>
  
  <h3>🧑‍💼 <a href="roles/virtual-assistant">Virtual Assistant</a></h3>
  <p>Provides personal assistance for development-related tasks.</p>
</div>

## 📚 Documentation

- [📋 Templates](templates/)
- [✨ Ways of Working](wows/)
- [💬 Prompt Library](prompts/)
- [📝 Changelog](changelog/)

## 💎 Credits

We've organized BMAD-related agents and templates into their own dedicated folder as they have inspired us and proven extremely helpful in many cases. 

Check out [bmadcode's GitHub](https://github.com/bmadcode) and [YouTube channel](https://www.youtube.com/@BMadCode) for more insights into agentic development workflows.

<style>
.role-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 1rem;
  margin-bottom: 2rem;
}

.role-card {
  border: 1px solid #e1e4e8;
  border-radius: 6px;
  padding: 1rem;
  background-color: #f6f8fa;
  transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
}

.role-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.role-list {
  display: none;
}

@media (max-width: 768px) {
  .role-grid {
    display: none;
  }
  
  .role-list {
    display: block;
  }
}
</style>