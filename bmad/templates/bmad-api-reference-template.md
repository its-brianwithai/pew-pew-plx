# {Project Name} API Reference

## External APIs Consumed

{Repeat this section for each external API the system interacts with.}

### {External Service Name} API

- **Purpose:** {Why does the system use this API?}
- **Base URL(s):**
  - Production: `{URL}`
  - Staging/Dev: `{URL}`
- **Authentication:** {Describe method - e.g., API Key in Header (Header Name: `X-API-Key`), OAuth 2.0 Client Credentials, Basic Auth. Reference `docs/environment-vars.md` for key names.}
- **Key Endpoints Used:**
  - **`{HTTP Method} {/path/to/endpoint}`:**
    - Description: {What does this endpoint do?}
    - Request Parameters: {Query params, path params}
    - Request Body Schema: {Provide JSON schema or link to `docs/data-models.md`}
    - Example Request: `{Code block}`
    - Success Response Schema (Code: `200 OK`): {JSON schema or link}
    - Error Response Schema(s) (Codes: `4xx`, `5xx`): {JSON schema or link}
    - Example Response: `{Code block}`
  - **`{HTTP Method} {/another/endpoint}`:** {...}
- **Rate Limits:** {If known}
- **Link to Official Docs:** {URL}

### {Another External Service Name} API

{...}

## Internal APIs Provided (If Applicable)

{If the system exposes its own APIs (e.g., in a microservices architecture or for a UI frontend). Repeat for each API.}

### {Internal API / Service Name} API

- **Purpose:** {What service does this API provide?}
- **Base URL(s):** {e.g., `/api/v1/...`}
- **Authentication/Authorization:** {Describe how access is controlled.}
- **Endpoints:**
  - **`{HTTP Method} {/path/to/endpoint}`:**
    - Description: {What does this endpoint do?}
    - Request Parameters: {...}
    - Request Body Schema: {...}
    - Success Response Schema (Code: `200 OK`): {...}
    - Error Response Schema(s) (Codes: `4xx`, `5xx`): {...}
  - **`{HTTP Method} {/another/endpoint}`:** {...}

## AWS Service SDK Usage (or other Cloud Providers)

{Detail interactions with cloud provider services via SDKs.}

### {AWS Service Name, e.g., S3}

- **Purpose:** {Why is this service used?}
- **SDK Package:** {e.g., `@aws-sdk/client-s3`}
- **Key Operations Used:** {e.g., `GetObjectCommand`, `PutObjectCommand`}
  - Operation 1: {Brief description of usage context}
  - Operation 2: {...}
- **Key Resource Identifiers:** {e.g., Bucket names, Table names - reference `docs/environment-vars.md`}

### {Another AWS Service Name, e.g., SES}

{...}

## 5. Change Log

| Change        | Date       | Version | Description   | Author         |
| ------------- | ---------- | ------- | ------------- | -------------- |
| Initial draft | YYYY-MM-DD | 0.1     | Initial draft | {Agent/Person} |
| ...           | ...        | ...     | ...           | ...            |
