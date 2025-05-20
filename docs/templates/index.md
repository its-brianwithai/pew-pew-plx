---
layout: default
title: Templates
---

# 📋 Templates

This page contains links to all the standardized templates across different roles.

## Templates by Role

{% assign template_files = site.static_files | where_exp: "file", "file.path contains '/templates/' and file.extname == '.md'" %}

{% assign roles = template_files | map: "path" | map: "dirname" | map: "dirname" | uniq %}

{% for role_path in roles %}
  {% if role_path contains "templates" %}
    {% continue %}
  {% endif %}
  {% assign role_name = role_path | split: '/' | last %}
  <h3>{{ role_name | capitalize }}</h3>
  <ul>
    {% assign role_templates = template_files | where_exp: "file", "file.path contains role_path" %}
    {% for template in role_templates %}
      <li><a href="{{ site.github.repository_url }}/blob/main/{{ template.path | remove_first: '/' }}">{{ template.name | remove: '.md' | remove: '-template' | replace: '-', ' ' | capitalize }}</a></li>
    {% endfor %}
  </ul>
{% endfor %}