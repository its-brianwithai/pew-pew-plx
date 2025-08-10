---
name: entity-template
description: Use this template to document database entities, models, or tables within this project.
instructions: Make sure that when you implement this template, you don't include these instructions or any other front matter from this template in your work. Output should always and only be the markdown part outside of the front matter. Never include any tags like <example>, <commentary>, or similar tags - these serve only to increase clarity about implementation. Always use single [ ] brackets to indicate instructions the implementer should follow. When referencing other documents from this project, use wikilinks format [[filename]] to reference them. Do not include the file extension or path.
---
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