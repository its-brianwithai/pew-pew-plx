---
name: entity-template
description: Use this template to document database entities, models, or tables within this project.
---
# Template Command

When this command is used, use the following template. Acknowledge your understanding and then await the user's request.

---

````````````
# 🗄️ Entity: [Table/Model Name]
> 💡 *[What this entity represents in the system]*

[Brief description of purpose and role]

## Fields
| Name | Type | Nullable | Default | Notes |
|:-----|:-----|:---------|:--------|:------|
| [field_name] | [type] | [yes/no] | [default] | [PK/FK/unique] |

## Relationships
- [[entity]] [1..*] [[entity]] — [relationship purpose]

## Constraints & Indexes
- Primary Key: [field(s)]
- Foreign Keys: [field] → [[entity]].[field]
- Unique: [field(s)]
- Indexes: [field(s)] — [purpose]

## Access Rules
- Read: [who can read and when]
- Write: [who can create/update/delete and when]

## Sample Data
```json
{
  "[field]": "[value]",
  "[field]": "[value]"
}
```
````````````
