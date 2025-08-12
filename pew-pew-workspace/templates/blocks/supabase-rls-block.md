## 🔐 Supabase Row Level Security
> 💡 *Row Level Security (RLS) policies that control data access at the database level.*

[Describe RLS policy changes or state "No changes to RLS policies" if none]

``````
<example>
### Policy: [Policy Name]
- **Table**: [table_name]
- **Operation**: [SELECT, INSERT, UPDATE, DELETE]
- **For**: [authenticated users, specific roles, etc.]

```sql
<example>
CREATE POLICY "Users can view own records" 
ON users 
FOR SELECT 
USING (auth.uid() = id);
</example>
```

### Policy: [Another Policy Name]
- **Table**: [table_name]
- **Operation**: [INSERT, UPDATE]
- **For**: [authenticated users]

```sql
<example>
CREATE POLICY "Users can update own profile" 
ON profiles 
FOR UPDATE 
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);
</example>
```
</example>
``````
