## 🔒 Firebase Security Rules
> 💡 *Security rules that define access control for Firebase services (Firestore, Storage, etc.).*

[Describe security rule changes or state "No changes to security rules" if none]

### Firestore Rules

``````
<example>
#### Collection: [collection_name]
```
<firebase-rules>
match /collection/{document} {
  // Read access
  allow read: if request.auth != null && request.auth.uid == resource.data.userId;
  
  // Write access
  allow create: if request.auth != null;
  allow update: if request.auth != null && request.auth.uid == resource.data.userId;
  
  // Delete access
  allow delete: if request.auth != null && request.auth.uid == resource.data.userId;
}
</firebase-rules>
```
</example>
``````

### Storage Rules

``````
<example>
#### Path: [storage_path]
```
<firebase-rules>
match /users/{userId}/files/{fileName} {
  allow read: if request.auth != null && request.auth.uid == userId;
  allow write: if request.auth != null && request.auth.uid == userId;
}
</firebase-rules>
```
</example>
``````

### Custom Functions

[Describe any custom security functions if needed]

```
<example>
[Custom function description and implementation]
</example>
```
