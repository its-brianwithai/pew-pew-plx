## 💾 Data Models
> 💡 *Data models that will be created, modified, or removed as part of this work.*

[Describe data model changes or state "No changes to data model" if none]

### New Models

``````
<example>
#### [Model Name]
```
<schema>
{
  id: string (primary key)
  field_name: type (constraints)
  another_field: type (nullable)
  created_at: timestamp
  updated_at: timestamp
}
</schema>
```
</example>
``````

### Modified Models

```
<example>
#### [Existing Model Name]
**Changes**:
- Add: `[field_name]: [type]` - [Purpose]
- Remove: `[old_field]` - [Reason for removal]
- Modify: `[field_name]` from `[old_type]` to `[new_type]`
</example>
```

### Relationships

```
<example>
- [Model A] has many [Model B]
- [Model C] belongs to [Model D]
- [Model E] has and belongs to many [Model F]
</example>
```
