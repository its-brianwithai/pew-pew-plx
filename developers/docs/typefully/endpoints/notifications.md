# Notifications

## Get Latest Notifications

**Endpoint:** `GET /v1/notifications/`

### Options

| Name | Description | Values |
|------|-------------|--------|
| `kind` | Filter notifications based on whether they are inbox notifications (e.g. comments, replies) or activity events (e.g. "tweet published"). | `inbox`, `activity` |

### Response Example

```json
{
    "accounts": {
        "123": {
            "id": "int",
            "screen_name": "str",
            "profile_image_url": "str",
            "name": "str"
        }
    },
    "notifications": {
        "123": {
            "inbox": [
                {
                    "created_at": "str",
                    "kind": "inbox | activity",
                    "user": {
                        "screen_name": "str",
                        "profile_image_url": "str",
                        "name": "str"
                    },
                    "account": {
                        "id": "int",
                        "screen_name": "str",
                        "profile_image_url": "str",
                        "name": "str"
                    },
                    "author": {
                        "screen_name": "str",
                        "profile_image_url": "str",
                        "name": "str"
                    },
                    "url": "str",
                    "payload": {}
                }
            ],
            "activity": []
        }
    }
}
```

### Payload Types

```typescript
interface AutoPlugPublishedPayload {
    action: "auto_plug_published";
    draft_id: number;
    success: boolean;
    first_tweet_text: string;
    num_tweets: number;
    tweet_url: string;
    auto_plug_tweet_url: string;
    scheduled: boolean;
    auto_plug_text: string;
}

interface AutoRetweetPublishedPayload {
    action: "auto_retweet_published";
    draft_id: number;
    success: boolean;
    first_tweet_text: string;
    num_tweets: number;
    tweet_url: string;
    scheduled: boolean;
}

interface NewReplyPayload {
    action: "new_reply";
    draft_id: number;
    draft_share_id?: string;
    shared_draft?: boolean;
    reply_text: string;
    comment_text: string;
    comment_author: NotificationUser;
    comment_stack_id: string;
    reply_id: string;
}

interface NewCommentPayload {
    action: "new_comment";
    draft_id: number;
    draft_share_id?: string;
    tweet_id: string;
    comment_stack_id: string;
    quoted_text: string;
    comment_text: string;
}

interface DraftPublishedPayload {
    action: "draft_published" | "scheduled_draft_published";
    draft_id: number;
    success: boolean;
    tweet_url?: string;
    linkedin_url?: string;
    error?: string;
    platform: "twitter" | "linkedin";
    first_tweet_text?: string;
    num_tweets?: number;
    excerpt?: string;
    linkedin_account?: {
        profile_image_url: string;
        name: string;
        headline: string;
    };
}
```

## Mark Notifications Read

**Endpoint:** `POST /v1/notifications/mark-all-read/`

### Options

| Name | Description | Values |
|------|-------------|--------|
| `kind` | Mark read notifications based on whether they are inbox notifications (e.g. comments, replies) or activities (e.g. publishing events). | `inbox`, `activity` |
| `username` | The username of the account. If given, it will only mark read notifications for that specific account. | string | 