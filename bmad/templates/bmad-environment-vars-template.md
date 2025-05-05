# {Project Name} Environment Variables

## Configuration Loading Mechanism

{Describe how environment variables are loaded into the application.}

- **Local Development:** {e.g., Using `.env` file with `dotenv` library.}
- **Deployment (e.g., AWS Lambda, Kubernetes):** {e.g., Set via Lambda function configuration, Kubernetes Secrets/ConfigMaps.}

## Required Variables

{List all environment variables used by the application.}

| Variable Name        | Description                                     | Example / Default Value               | Required? (Yes/No) | Sensitive? (Yes/No) |
| :------------------- | :---------------------------------------------- | :------------------------------------ | :----------------- | :------------------ |
| `NODE_ENV`           | Runtime environment                             | `development` / `production`          | Yes                | No                  |
| `PORT`               | Port the application listens on (if applicable) | `8080`                                | No                 | No                  |
| `DATABASE_URL`       | Connection string for the primary database      | `postgresql://user:pass@host:port/db` | Yes                | Yes                 |
| `EXTERNAL_API_KEY`   | API Key for {External Service Name}             | `sk_...`                              | Yes                | Yes                 |
| `S3_BUCKET_NAME`     | Name of the S3 bucket for {Purpose}             | `my-app-data-bucket-...`              | Yes                | No                  |
| `FEATURE_FLAG_X`     | Enables/disables experimental feature X         | `false`                               | No                 | No                  |
| `{ANOTHER_VARIABLE}` | {Description}                                   | {Example}                             | {Yes/No}           | {Yes/No}            |
| ...                  | ...                                             | ...                                   | ...                | ...                 |

## Notes

- **Secrets Management:** {Explain how sensitive variables (API Keys, passwords) should be handled, especially in production (e.g., "Use AWS Secrets Manager", "Inject via CI/CD pipeline").}
- **`.env.example`:** {Mention that an `.env.example` file should be maintained in the repository with placeholder values for developers.}
- **Validation:** {Is there code that validates the presence or format of these variables at startup?}

## Change Log

| Change        | Date       | Version | Description   | Author         |
| ------------- | ---------- | ------- | ------------- | -------------- |
| Initial draft | YYYY-MM-DD | 0.1     | Initial draft | {Agent/Person} |
| ...           | ...        | ...     | ...           | ...            |
