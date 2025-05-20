---
layout: default
title: Ways of Working (WOWs)
---

# ✨ Ways of Working (WOWs)

This page contains links to all the Ways of Working (WOWs) - best practices and guides across different roles.

## WOWs by Role

{% assign wow_files = site.static_files | where_exp: "file", "file.path contains '/wows/' and file.name contains 'wow-' and file.extname == '.md' or file.extname == '.mdc'" %}

{% assign roles = wow_files | map: "path" | map: "dirname" | map: "dirname" | uniq %}

{% for role_path in roles %}
  {% if role_path contains "wows" %}
    {% continue %}
  {% endif %}
  {% assign role_name = role_path | split: '/' | last %}
  <h3>{{ role_name | capitalize }}</h3>
  
  {% assign role_wows = wow_files | where_exp: "file", "file.path contains role_path" %}
  {% assign categories = role_wows | map: "path" | map: "dirname" | uniq %}
  
  {% for category_path in categories %}
    {% if category_path contains "best-practices" %}
      <h4>Best Practices</h4>
    {% else %}
      {% assign category_name = category_path | split: '/' | last %}
      {% if category_name != "wows" %}
        <h4>{{ category_name | capitalize }}</h4>
      {% endif %}
    {% endif %}
    
    <ul>
      {% assign category_wows = role_wows | where_exp: "file", "file.path contains category_path" %}
      {% for wow in category_wows %}
        <li><a href="{{ site.github.repository_url }}/blob/main/{{ wow.path | remove_first: '/' }}">{{ wow.name | remove: '.md' | remove: '.mdc' | remove: 'wow-' | replace: '-', ' ' | capitalize }}</a></li>
      {% endfor %}
    </ul>
  {% endfor %}
{% endfor %}