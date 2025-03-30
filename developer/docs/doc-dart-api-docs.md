# Dart API Documentation

**Version:** 1.0.0

[API Schema](https://app.itsdart.com/api/v0/public/schema/) | [Terms of Service](https://app.itsdart.com/legal/terms-of-use)

## Overview

Dart is an application for task, document, and project management. This API allows you to create and access tasks, documents, comments, and more for you and your team.

**Base URL:** `https://app.itsdart.com/api/v0/public`

## Table of Contents

- [Authentication](#authentication)
- [Endpoints](#endpoints)
  - [Comments](#comments)
  - [Config](#config)
  - [Documents](#documents)
  - [Tasks](#tasks)
- [Webhooks](#webhooks)
- [Schemas](#schemas)

## Authentication

Authentication methods for the Dart API are OAuth2-based. Contact Dart Support at [support@itsdart.com](mailto:support@itsdart.com) for access credentials.

## Endpoints

### Comments

#### Create a Comment

Creates a new comment associated with a task.

```
POST /comments
```

**Request Body:**

```json
{
  "item": {
    "taskId": "string",
    "text": "string"
  }
}
```

**Parameters:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| item.taskId | string | The ID of the task that the comment is associated with | Yes |
| item.text | string | The full content of the comment, which can include markdown formatting | Yes |

**Response (200):**

Returns the created comment:

```json
{
  "id": "string",
  "permalink": "string",
  "taskId": "string",
  "author": "string",
  "text": "string"
}
```

### Config

#### Get Configuration

Get information about the user's space, including all possible values that can be provided to other endpoints.

```
GET /config
```

**Response (200):**

Returns the workspace configuration including available dartboards, folders, statuses, etc:

```json
{
  "today": "2023-01-01",
  "dartboards": ["Active", "Next", "Backlog"],
  "folders": ["Docs"],
  "types": ["Task"],
  "statuses": ["To-do", "Doing", "Done"],
  "assignees": [
    {
      "name": "string",
      "email": "string"
    }
  ],
  "tags": ["string"],
  "priorities": ["Critical", "High", "Medium", "Low"],
  "sizes": [1, 2, 3, 5, 8]
}
```

### Documents

#### Create a Document

Create a new document in the Dart workspace.

```
POST /docs
```

**Request Body:**

```json
{
  "item": {
    "title": "string",
    "folder": "string",
    "text": "string"
  }
}
```

**Parameters:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| item.title | string | The title of the document | Yes |
| item.folder | string | The folder to place the document in (e.g., "Docs") | No |
| item.text | string | The full content of the document, which can include markdown formatting | Yes |

**Response (200):**

Returns the created document:

```json
{
  "id": "string",
  "permalink": "string",
  "title": "string",
  "folder": "string",
  "text": "string"
}
```

#### Retrieve a Document

Retrieve an existing document by its ID.

```
GET /docs/{id}
```

**Path Parameters:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| id | string | The ID of the document to retrieve | Yes |

**Response (200):**

Returns the requested document:

```json
{
  "id": "string",
  "permalink": "string",
  "title": "string",
  "folder": "string",
  "text": "string"
}
```

#### Update a Document

Update an existing document.

```
PUT /docs/{id}
```

**Path Parameters:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| id | string | The ID of the document to update | Yes |

**Request Body:**

```json
{
  "item": {
    "id": "string",
    "title": "string",
    "folder": "string",
    "text": "string"
  }
}
```

**Parameters:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| item.id | string | The ID of the document | Yes |
| item.title | string | The updated title of the document | No |
| item.folder | string | The updated folder for the document | No |
| item.text | string | The updated content of the document | No |

**Response (200):**

Returns the updated document:

```json
{
  "id": "string",
  "permalink": "string",
  "title": "string",
  "folder": "string",
  "text": "string"
}
```

#### Delete a Document

Move an existing document to the trash.

```
DELETE /docs/{id}
```

**Path Parameters:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| id | string | The ID of the document to delete | Yes |

**Response (200):**

Returns the deleted document:

```json
{
  "id": "string",
  "permalink": "string",
  "title": "string",
  "folder": "string",
  "text": "string"
}
```

#### List Documents

List documents in the workspace with optional filtering.

```
GET /docs/list
```

**Query Parameters:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| duids | string | Filter by DUIDs | No |
| folder | string | Filter by folder title | No |
| folder_duid | string | Filter by folder DUID | No |
| in_trash | boolean | Filter by trash status | No |
| is_draft | boolean | Filter by draft status | No |
| limit | integer | Number of results per page | No |
| offset | integer | Initial index for pagination | No |
| s | string | Search by title, text, or folder title | No |
| title | string | Filter by title | No |
| text | string | Filter by text content | No |

**Response (200):**

Returns a paginated list of documents:

```json
{
  "count": 123,
  "next": "http://api.example.org/accounts/?offset=400&limit=100",
  "previous": "http://api.example.org/accounts/?offset=200&limit=100",
  "results": [
    {
      "id": "string",
      "permalink": "string",
      "title": "string",
      "folder": "string"
    }
  ]
}
```

### Tasks

#### Create a Task

Create a new task in the Dart workspace.

```
POST /tasks
```

**Request Body:**

```json
{
  "item": {
    "title": "string",
    "parentId": "string",
    "dartboard": "string",
    "status": "string",
    "description": "string",
    "assignees": ["string"],
    "assignee": "string",
    "tags": ["string"],
    "priority": "string",
    "startAt": "string",
    "dueAt": "string",
    "size": 0
  }
}
```

**Parameters:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| item.title | string | Short description of what needs to be done | Yes |
| item.parentId | string | ID of the parent task | No |
| item.dartboard | string | Title of the dartboard (project or task list) | No |
| item.status | string | Status from available options (e.g., "To-do") | No |
| item.description | string | Longer description with markdown support | No |
| item.assignees | array | Names/emails of assigned users (for multi-assignee workspaces) | No |
| item.assignee | string | Name/email of assigned user (for single-assignee workspaces) | No |
| item.tags | array | Tags applied to the task | No |
| item.priority | string | Priority level (Critical, High, Medium, Low) | No |
| item.startAt | string | Start date in ISO format (at 9:00am in user's timezone) | No |
| item.dueAt | string | Due date in ISO format (at 9:00am in user's timezone) | No |
| item.size | integer | Number representing amount of work needed | No |

**Response (200):**

Returns the created task:

```json
{
  "id": "string",
  "permalink": "string",
  "title": "string",
  "parentId": "string",
  "dartboard": "string",
  "type": "string",
  "status": "string",
  "description": "string",
  "assignees": ["string"],
  "assignee": "string",
  "tags": ["string"],
  "priority": "string",
  "startAt": "string",
  "dueAt": "string",
  "size": 0,
  "timeTracking": "string"
}
```

#### Retrieve a Task

Retrieve an existing task by its ID.

```
GET /tasks/{id}
```

**Path Parameters:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| id | string | The ID of the task to retrieve | Yes |

**Response (200):**

Returns the requested task:

```json
{
  "id": "string",
  "permalink": "string",
  "title": "string",
  "parentId": "string",
  "dartboard": "string",
  "type": "string",
  "status": "string",
  "description": "string",
  "assignees": ["string"],
  "assignee": "string",
  "tags": ["string"],
  "priority": "string",
  "startAt": "string",
  "dueAt": "string",
  "size": 0,
  "timeTracking": "string"
}
```

#### Update a Task

Update an existing task.

```
PUT /tasks/{id}
```

**Path Parameters:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| id | string | The ID of the task to update | Yes |

**Request Body:**

```json
{
  "item": {
    "id": "string",
    "title": "string",
    "parentId": "string",
    "dartboard": "string",
    "status": "string",
    "description": "string",
    "assignees": ["string"],
    "assignee": "string",
    "tags": ["string"],
    "priority": "string",
    "startAt": "string",
    "dueAt": "string",
    "size": 0
  }
}
```

**Parameters:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| item.id | string | The ID of the task | Yes |
| item.title | string | Updated title | No |
| item.parentId | string | Updated parent task ID | No |
| item.dartboard | string | Updated dartboard | No |
| item.status | string | Updated status | No |
| item.description | string | Updated description | No |
| item.assignees | array | Updated list of assignees | No |
| item.assignee | string | Updated assignee | No |
| item.tags | array | Updated tags | No |
| item.priority | string | Updated priority | No |
| item.startAt | string | Updated start date | No |
| item.dueAt | string | Updated due date | No |
| item.size | integer | Updated size | No |

**Response (200):**

Returns the updated task:

```json
{
  "id": "string",
  "permalink": "string",
  "title": "string",
  "parentId": "string",
  "dartboard": "string",
  "type": "string",
  "status": "string",
  "description": "string",
  "assignees": ["string"],
  "assignee": "string",
  "tags": ["string"],
  "priority": "string",
  "startAt": "string",
  "dueAt": "string",
  "size": 0,
  "timeTracking": "string"
}
```

#### Delete a Task

Move an existing task to the trash.

```
DELETE /tasks/{id}
```

**Path Parameters:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| id | string | The ID of the task to delete | Yes |

**Response (200):**

Returns the deleted task:

```json
{
  "id": "string",
  "permalink": "string",
  "title": "string",
  "parentId": "string",
  "dartboard": "string",
  "type": "string",
  "status": "string",
  "description": "string",
  "assignees": ["string"],
  "assignee": "string",
  "tags": ["string"],
  "priority": "string",
  "startAt": "string",
  "dueAt": "string",
  "size": 0,
  "timeTracking": "string"
}
```

#### List Tasks

List tasks in the workspace with optional filtering.

```
GET /tasks/list
```

**Query Parameters:**

| Name | Type | Description | Required |
|------|------|-------------|----------|
| assignee | string | Filter by assignee name or email | No |
| assignee_duid | string | Filter by assignee DUID | No |
| dartboard | string | Filter by dartboard title | No |
| dartboard_duid | string | Filter by dartboard DUID | No |
| description | string | Filter by description content | No |
| due_at_after | string | Filter by due date after (ISO format) | No |
| due_at_before | string | Filter by due date before (ISO format) | No |
| duids | string | Filter by DUIDs | No |
| in_trash | boolean | Filter by trash status | No |
| is_draft | boolean | Filter by draft status | No |
| kind | string | Filter by task kind | No |
| limit | integer | Number of results per page | No |
| offset | integer | Initial index for pagination | No |
| priority | string | Filter by priority | No |
| size | integer | Filter by task size | No |
| start_at_after | string | Filter by start date after (ISO format) | No |
| start_at_before | string | Filter by start date before (ISO format) | No |
| status | string | Filter by status | No |
| status_duid | string | Filter by status DUID | No |
| subscriber_duid | string | Filter by subscriber DUID | No |
| tag | string | Filter by tag | No |
| title | string | Filter by title | No |

**Response (200):**

Returns a paginated list of tasks:

```json
{
  "count": 123,
  "next": "http://api.example.org/accounts/?offset=400&limit=100",
  "previous": "http://api.example.org/accounts/?offset=200&limit=100",
  "results": [
    {
      "id": "string",
      "permalink": "string",
      "title": "string",
      "parentId": "string",
      "dartboard": "string",
      "type": "string",
      "status": "string",
      "assignees": ["string"],
      "assignee": "string",
      "tags": ["string"],
      "priority": "string",
      "startAt": "string",
      "dueAt": "string",
      "size": 0,
      "timeTracking": "string"
    }
  ]
}
```

## Webhooks

The Dart API provides webhooks for various events, allowing your application to receive real-time updates.

### Task Created Webhook

Triggered when a new task is created.

```
POST taskCreated
```

**Request Body:**

```json
{
  "type": "task.created",
  "data": {
    // Task object
  }
}
```

### Task Updated Webhook

Triggered when a task is updated.

```
POST taskUpdated
```

**Request Body:**

```json
{
  "type": "task.updated",
  "data": {
    "model": {
      // Updated Task object
    },
    "oldModel": {
      // Previous Task object
    }
  }
}
```

### Task Deleted Webhook

Triggered when a task is deleted.

```
POST taskDeleted
```

**Request Body:**

```json
{
  "type": "task.deleted",
  "data": {
    // Task object
  }
}
```

### Document Created Webhook

Triggered when a new document is created.

```
POST docCreated
```

**Request Body:**

```json
{
  "type": "doc.created",
  "data": {
    // Doc object
  }
}
```

### Document Updated Webhook

Triggered when a document is updated.

```
POST docUpdated
```

**Request Body:**

```json
{
  "type": "doc.updated",
  "data": {
    "model": {
      // Updated Doc object
    },
    "oldModel": {
      // Previous Doc object
    }
  }
}
```

### Document Deleted Webhook

Triggered when a document is deleted.

```
POST docDeleted
```

**Request Body:**

```json
{
  "type": "doc.deleted",
  "data": {
    // Doc object
  }
}
```

### Comment Created Webhook

Triggered when a new comment is created.

```
POST commentCreated
```

**Request Body:**

```json
{
  "type": "comment.created",
  "data": {
    // Comment object
  }
}
```

## Schemas

### Assignee

```json
{
  "name": "string",
  "email": "string"
}
```

### Comment

```json
{
  "id": "string",
  "permalink": "string",
  "taskId": "string",
  "author": "string",
  "text": "string"
}
```

### Doc

```json
{
  "id": "string",
  "permalink": "string",
  "title": "string",
  "folder": "string",
  "text": "string"
}
```

### Task

```json
{
  "id": "string",
  "permalink": "string",
  "title": "string",
  "parentId": "string",
  "dartboard": "string",
  "type": "string",
  "status": "string",
  "description": "string",
  "assignees": ["string"],
  "assignee": "string",
  "tags": ["string"],
  "priority": "string",
  "startAt": "string",
  "dueAt": "string",
  "size": 0,
  "timeTracking": "string"
}
```

### UserSpaceConfiguration

```json
{
  "today": "2023-01-01",
  "dartboards": ["string"],
  "folders": ["string"],
  "types": ["string"],
  "statuses": ["string"],
  "assignees": [
    {
      "name": "string",
      "email": "string"
    }
  ],
  "tags": ["string"],
  "priorities": ["string"],
  "sizes": [0]
}
```

### PaginatedConciseDocList

```json
{
  "count": 123,
  "next": "string",
  "previous": "string",
  "results": [
    {
      "id": "string",
      "permalink": "string",
      "title": "string",
      "folder": "string"
    }
  ]
}
```

### PaginatedConciseTaskList

```json
{
  "count": 123,
  "next": "string",
  "previous": "string",
  "results": [
    {
      "id": "string",
      "permalink": "string",
      "title": "string",
      "parentId": "string",
      "dartboard": "string",
      "type": "string",
      "status": "string",
      "assignees": ["string"],
      "assignee": "string",
      "tags": ["string"],
      "priority": "string",
      "startAt": "string",
      "dueAt": "string",
      "size": 0,
      "timeTracking": "string"
    }
  ]
}
```
