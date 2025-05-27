---
# IMPORTANT: Update the fields below (name, description, version, author, tags, params) to match the specific workflow context and remove this comment.
name: "Example Web App Deployment"
description: "A reusable workflow to build, test, and deploy a standard web application to a specified environment."
version: "1.0.1"
author: "AI Workflow Architect Team <ai-workflow@example.com>"
tags: ["deployment", "web-app", "ci-cd"]
params:
  repositoryUrl:
    type: "string"
    description: "The URL of the Git repository to clone."
    default: "https://github.com/user/example-app.git"
  branchName:
    type: "string"
    description: "The branch to checkout and build."
    default: "main"
  deployEnvironment:
    type: "enum"
    description: "The target deployment environment."
    values: ["staging", "production"]
    default: "staging"
  runTests:
    type: "boolean"
    description: "Whether to run automated tests before deployment."
    default: true
---

# Windsurf Workflow: {{ name }}

Description: {{ description }}
Version: {{ version }}
Target Environment: {{params.deployEnvironment}}

# 🤖 AI Agent Context
> 💡 *Essential information for the AI agent to understand and execute this Windsurf workflow. Review all linked resources thoroughly before proceeding.*
---

## 📚 Relevant Project Files & Code
> 💡 *List any project files, scripts, or configuration files within the target repository (`{{params.repositoryUrl}}`) that are critical for this workflow's execution (e.g., package.json, Dockerfile, test scripts).*
---
*   `[e.g., package.json]` - (Relevance: Defines scripts for install, test, build)
*   `[e.g., Dockerfile]` - (Relevance: If containerization is part of the build/deploy process)
*   `[e.g., .github/workflows/main.yml]` - (Relevance: If this workflow is based on or interacts with existing CI/CD)
*   *Example: `scripts/deploy.sh` - (Relevance: Custom deployment script used in a step)*

## 🌐 Relevant Documentation & Links
> 💡 *List any external web pages, API documentation for deployment services, or internal wikis related to the deployment environments or tools used in this workflow.*
---
*   `[Link to Deployment Service Documentation (e.g., AWS S3, Vercel, Netlify)]` - (Relevance: For the deploy step)
*   `[Link to Internal Wiki page for {{params.deployEnvironment}} environment]` - (Relevance: Environment-specific configurations or access details)
*   *Example: `https://docs.npmjs.com/cli/test` - (Relevance: For understanding `npm test` behavior)*

## 💡 Other Key Information
> 💡 *Include any other critical context, specific instructions, or points the AI agent needs to be aware of. This could include required environment variables (like $DEPLOY_TOKEN), assumptions about the build environment, or specific error conditions to watch for.*
---
*   `[Context point 1: e.g., The $DEPLOY_TOKEN environment variable must be set with appropriate permissions for the target environment.]`
*   `[Context point 2: e.g., The build step assumes a Node.js version >= 18.x is available.]`
*   *Example: If tests fail, the workflow should not proceed to build or deploy.*
---

## Step: Setup Project

**Instruction:** Prepare the project workspace.

1.  Clone the repository specified by `{{params.repositoryUrl}}` and checkout the `{{params.branchName}}` branch:
    ```bash
    git clone {{params.repositoryUrl}} app_source
    cd app_source
    git checkout {{params.branchName}}
    ```
2.  Install project dependencies. This example assumes a Node.js project:
    ```bash
    npm install
    ```

*Cascade, please ensure these commands are executed sequentially in the project's root directory. Confirm successful completion of each command before proceeding.*

## Step: Run Automated Tests

**Instruction:** Execute the project's automated test suite.

```bash
npm test
```

*Cascade, if the `{{params.runTests}}` parameter is true, execute the tests. If tests fail, halt the workflow immediately and report the detailed error messages. If tests pass or if `{{params.runTests}}` is false, proceed to the next step.*

## Step: Build Application

**Instruction:** Build the application for the `{{params.deployEnvironment}}` target environment.

```bash
npm run build -- --env {{params.deployEnvironment}}
```

*Cascade, verify that the build process completes successfully and that the expected build artifacts are generated, typically in a `dist/` or `build/` directory. Report any build errors.*

## Step: Deploy to {{params.deployEnvironment }}

**Instruction:** Deploy the application artifacts from the build directory to the `{{params.deployEnvironment}}` environment.

```bash
# Example: Using a hypothetical deployment CLI. Ensure appropriate credentials are available.
deploy-cli --source dist/ --target {{params.deployEnvironment}} --token $DEPLOY_TOKEN
```

*Cascade, use the appropriate deployment credentials and procedures for the `{{params.deployEnvironment}}` environment. If deployment fails, provide the complete error logs from the deployment tool. Consider using a Windsurf Rule (e.g., `@rules:deployment-notifications`) to send a notification upon successful deployment or failure.*

## Step: Post-Deployment Verification

**Instruction:** Perform a basic health check on the deployed application.

1.  Attempt to access the main application URL (this may need to be a known URL or derived).
2.  Verify that the application returns a 200 OK HTTP status code.
3.  Optionally, check for specific content on the homepage to confirm successful deployment.

*Cascade, report the status of this verification. If the health check fails, suggest potential rollback procedures or notify the relevant team members.*

## Step: Cleanup

**Instruction:** Clean up any temporary files, directories, or resources created during the workflow execution.

```bash
# Example: Remove the cloned source directory to save space.
cd ..
rm -rf app_source
```

*Cascade, ensure this cleanup step is performed to maintain a clean environment. This step should generally run even if previous steps encountered issues, unless the intermediate state is critical for debugging a failure.*
