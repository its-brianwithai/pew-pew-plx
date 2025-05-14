---
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