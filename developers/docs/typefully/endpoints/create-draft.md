# Create Draft

Create a draft given some plain-text content.

**Endpoint:** `POST /v1/drafts/`

## Request

### Payload (JSON)

```json
{
    "content": "First tweet of a beautiful thread"
}
```

### Options

| Name | Required | Type | Description |
|------|----------|------|-------------|
| `content` | **Yes** | string | You can split into multiple tweets by adding 4 consecutive newlines between tweets in the content. |
| `threadify` | No | boolean | Content will be automatically split into multiple tweets. |
| `share` | No | boolean | If `true`, returned payload will include a `share_url`. |
| `schedule-date` | No | string or `"next-free-slot"` | Can either be an ISO formatted date (e.g.: `2022-06-13T11:13:31.662Z`) or `next-free-slot` |
| `auto_retweet_enabled` | No | boolean | If true, the post will have an AutoRT enabled, according to the one set on Typefully for the account. |
| `auto_plug_enabled` | No | boolean | If true, the post will have an AutoPlug enabled, according to the one set on Typefully for the account. | 