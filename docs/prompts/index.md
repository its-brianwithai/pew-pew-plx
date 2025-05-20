---
layout: default
title: Prompt Library
---

# 💬 Prompt Library

This page provides access to the prompt library, organized by role and type.

## Agent Prompts by Role

Agent prompts define AI personas with specific expertise and responsibilities.

{% assign agent_files = site.static_files | where_exp: "file", "file.path contains '/prompts/agents/' and file.extname == '.md'" %}

{% assign roles = agent_files | map: "path" | map: "dirname" | map: "dirname" | map: "dirname" | uniq %}

{% for role_path in roles %}
  {% assign role_name = role_path | split: '/' | last %}
  <h3>{{ role_name | capitalize }}</h3>
  <ul>
    {% assign role_agents = agent_files | where_exp: "file", "file.path contains role_path" %}
    {% for agent in role_agents %}
      <li><a href="{{ site.github.repository_url }}/blob/main/{{ agent.path | remove_first: '/' }}">{{ agent.name | remove: '.md' | replace: 'you-are-', '' | replace: '-', ' ' | capitalize }}</a></li>
    {% endfor %}
  </ul>
{% endfor %}

## Activity Prompts by Role

Activity prompts guide agents through specific, well-defined tasks.

{% assign activity_files = site.static_files | where_exp: "file", "file.path contains '/prompts/activities/' and file.extname == '.md'" %}

{% assign roles = activity_files | map: "path" | map: "dirname" | map: "dirname" | map: "dirname" | uniq %}

{% for role_path in roles %}
  {% assign role_name = role_path | split: '/' | last %}
  <h3>{{ role_name | capitalize }}</h3>
  <ul>
    {% assign role_activities = activity_files | where_exp: "file", "file.path contains role_path" %}
    {% for activity in role_activities %}
      <li><a href="{{ site.github.repository_url }}/blob/main/{{ activity.path | remove_first: '/' }}">{{ activity.name | remove: '.md' | replace: 'plx-', '' | replace: '-', ' ' | capitalize }}</a></li>
    {% endfor %}
  </ul>
{% endfor %}