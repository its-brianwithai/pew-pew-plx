---
layout: default
title: Developer Role
description: Implements features according to technical specifications, following coding standards and best practices.
---

# 💻 Developer Role

Implements features according to technical specifications, following coding standards and best practices while maintaining test coverage and documentation.

```
developer/
├── artifacts/ (2)
├── prompts/ (31)
│   ├── activities/ (16)
│   └── agents/ (15)
├── rubrics/ (1)
├── scripts/ (2)
├── snippets/ (42)
│   └── flutter/ (14)
├── templates/ (5)
└── wows/ (35)
    ├── astro/ (1)
    ├── cli-tools/ (2)
    ├── flutter/ (1)
    ├── markdown/ (1)
    ├── mcp-servers/ (2)
    ├── next-js/ (1)
    ├── open-source/ (1)
    └── supabase/ (26)
        ├── database/ (6)
        └── flutter/ (20)
```

## Agent Prompts

The Developer role includes several specialized agent prompts designed to assist with different aspects of development:

{% assign agent_files = site.static_files | where_exp: "file", "file.path contains 'developer/prompts/agents'" %}

<ul>
{% for file in agent_files %}
  <li><a href="{{ site.github.repository_url }}/blob/main/{{ file.path | remove_first: '/' }}">{{ file.name | remove: '.md' | replace: 'you-are-', '' | capitalize }}</a></li>
{% endfor %}
</ul>

## Activity Prompts

Activity prompts guide developers through specific tasks:

{% assign activity_files = site.static_files | where_exp: "file", "file.path contains 'developer/prompts/activities'" %}

<ul>
{% for file in activity_files %}
  <li><a href="{{ site.github.repository_url }}/blob/main/{{ file.path | remove_first: '/' }}">{{ file.name | remove: '.md' | replace: 'plx-', '' | replace: '-', ' ' | capitalize }}</a></li>
{% endfor %}
</ul>

## Ways of Working (WOWs)

The Developer role includes extensive documentation about best practices and workflows:

{% assign wow_folders = site.static_files | where_exp: "file", "file.path contains 'developer/wows/'" | map: "path" | map: "dirname" | uniq %}

<ul>
{% for folder in wow_folders %}
  {% assign folder_name = folder | split: '/' | last %}
  <li>{{ folder_name | capitalize }}</li>
  <ul>
    {% assign folder_files = site.static_files | where_exp: "file", "file.path contains folder" %}
    {% for file in folder_files %}
      <li><a href="{{ site.github.repository_url }}/blob/main/{{ file.path | remove_first: '/' }}">{{ file.name | remove: '.md' | remove: '.mdc' | replace: 'wow-', '' | replace: '-', ' ' | capitalize }}</a></li>
    {% endfor %}
  </ul>
{% endfor %}
</ul>

## Templates

{% assign template_files = site.static_files | where_exp: "file", "file.path contains 'developer/templates'" %}

<ul>
{% for file in template_files %}
  <li><a href="{{ site.github.repository_url }}/blob/main/{{ file.path | remove_first: '/' }}">{{ file.name | remove: '.md' | replace: '-template', '' | replace: '-', ' ' | capitalize }}</a></li>
{% endfor %}
</ul>

## Code Snippets

The Developer role includes numerous code snippets for various purposes:

{% assign snippet_folders = site.static_files | where_exp: "file", "file.path contains 'developer/snippets/'" | map: "path" | map: "dirname" | uniq %}

<ul>
{% for folder in snippet_folders %}
  {% assign folder_name = folder | split: '/' | last %}
  {% if folder_name != "snippets" %}
  <li>{{ folder_name | capitalize }}</li>
  <ul>
    {% assign folder_files = site.static_files | where_exp: "file", "file.path contains folder" %}
    {% for file in folder_files %}
      <li><a href="{{ site.github.repository_url }}/blob/main/{{ file.path | remove_first: '/' }}">{{ file.name }}</a></li>
    {% endfor %}
  </ul>
  {% endif %}
{% endfor %}
</ul>