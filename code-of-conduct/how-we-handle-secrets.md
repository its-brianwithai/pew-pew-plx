---
document_type: code-of-conduct
goal: define how we handle secrets using Firebase Functions secrets manager
gpt_action: follow these steps when managing secrets in the project
---

# 🔐 Secret Management Process

1. GIVEN [[GPT Agent]] NEEDS secret management
   1. WHEN [[GPT Agent]] CREATES structure
      1. THEN [[GPT Agent]] WRITES template
         1. AND [[GPT Agent]] ADDS content:
         ```bash
         # API Configuration
         API_KEY=your-api-key-here
         LIST_ID=your-list-id-here  # Optional: Default list ID

         # Add other secrets below with descriptions
         # FORMAT: SECRET_NAME=default-or-example-value
         ```
      2. THEN [[GPT Agent]] UPDATES gitignore
         1. AND [[GPT Agent]] ADDS content:
         ```gitignore
         # Secrets
         .secrets
         ```

2. GIVEN [[GPT Agent]] HAS structure
   1. WHEN [[GPT Agent]] IMPLEMENTS update script
      1. THEN [[GPT Agent]] CREATES update_secrets.sh
         1. AND [[GPT Agent]] WRITES content:
         ```bash
         #!/bin/bash

         # Check if .secrets file exists
         if [ ! -f "../.secrets" ] && [ ! -f ".secrets" ]; then
             echo "Error: .secrets file not found!"
             echo "Please copy .secrets.template to .secrets and fill in your values"
             exit 1
         fi

         # Use the correct secrets file
         SECRETS_FILE=".secrets"
         if [ -f "../.secrets" ]; then
             SECRETS_FILE="../.secrets"
         fi

         # Create temporary directory for secret files
         TEMP_DIR=$(mktemp -d)
         trap 'rm -rf "$TEMP_DIR"' EXIT

         # Check if Firebase project ID is set
         if [ -z "${FIREBASE_PROJECT_ID}" ]; then
             echo "Error: FIREBASE_PROJECT_ID is not set"
             exit 1
         fi

         # Source the secrets file
         source "$SECRETS_FILE"

         # Function to update a secret
         update_secret() {
             local secret_name=$1
             local secret_value=$2
             
             if [ -z "$secret_value" ]; then
                 echo "Warning: $secret_name is empty, skipping..."
                 return
             fi

             # Create temporary file for secret value
             local temp_file="$TEMP_DIR/${secret_name}"
             echo -n "$secret_value" > "$temp_file"

             echo "Updating secret: $secret_name"
             if ! firebase functions:secrets:set "$secret_name" --data-file "$temp_file" --project ${FIREBASE_PROJECT_ID}; then
                 echo "Error: Failed to update secret $secret_name"
                 return 1
             fi
         }

         # Update each secret
         update_secret "API_KEY" "$API_KEY"
         update_secret "LIST_ID" "$LIST_ID"
         # Add new secrets here when they are added to .secrets.template

         echo "Secrets updated successfully!"
         ```

3. GIVEN [[GPT Agent]] HAS update script
   1. WHEN [[GPT Agent]] IMPLEMENTS clear script
      1. THEN [[GPT Agent]] CREATES clear_secrets.sh
         1. AND [[GPT Agent]] WRITES content:
         ```bash
         #!/bin/bash

         # Function to clear a secret
         clear_secret() {
             local secret_name=$1
             echo "Clearing secret: $secret_name"
             
             # Check if Firebase project ID is set
             if [ -z "${FIREBASE_PROJECT_ID}" ]; then
                 echo "Error: FIREBASE_PROJECT_ID is not set"
                 exit 1
             fi
             
             # Check if secret exists
             if ! firebase functions:secrets:get "$secret_name" --project ${FIREBASE_PROJECT_ID} &>/dev/null; then
                 echo "Warning: Secret $secret_name does not exist, skipping..."
                 return 0
             fi

             # Try to destroy the secret
             if ! firebase functions:secrets:destroy "$secret_name" --project ${FIREBASE_PROJECT_ID} --force; then
                 echo "Error: Failed to clear secret $secret_name"
                 return 1
             fi
         }

         # Check if we're in the functions directory
         if [ ! -d "scripts" ]; then
             echo "Error: Please run this script from the functions directory"
             exit 1
         fi

         # List of all secrets to clear
         SECRETS=(
             "API_KEY"
             "LIST_ID"
             # Add new secrets here when they are added to .secrets.template
         )

         # Ask for confirmation
         echo "This will clear the following secrets:"
         printf '%s\n' "${SECRETS[@]}"
         read -p "Are you sure you want to continue? (y/N) " -n 1 -r
         echo
         if [[ ! $REPLY =~ ^[Yy]$ ]]; then
             echo "Operation cancelled."
             exit 1
         fi

         # Clear each secret
         failed=0
         for secret in "${SECRETS[@]}"; do
             if ! clear_secret "$secret"; then
                 failed=$((failed + 1))
             fi
         done

         if [ $failed -eq 0 ]; then
             echo "All secrets cleared successfully!"
         else
             echo "Warning: Failed to clear $failed secret(s)"
             exit 1
         fi
         ```

# 🔄 Usage Flow

1. GIVEN [[Developer]] NEEDS secrets
   1. WHEN [[Developer]] SETS UP secrets
      1. THEN [[Developer]] COPIES template
         1. AND [[Developer]] RUNS `cp .secrets.template .secrets`
      2. THEN [[Developer]] EDITS values
         1. AND [[Developer]] RUNS `nano .secrets`
      3. THEN [[Developer]] UPDATES Firebase
         1. AND [[Developer]] RUNS `./scripts/update_secrets.sh`
         2. IF [[update]] FAILS
            1. THEN [[Developer]] CHECKS permissions
            2. AND [[Developer]] VERIFIES project ID

2. GIVEN [[Developer]] HAS secrets
   1. WHEN [[Developer]] ACCESSES secrets
      1. THEN [[Developer]] USES environment variables
         1. AND [[Developer]] WRITES code:
         ```typescript
         const apiKey = process.env.API_KEY;
         const listId = process.env.LIST_ID;
         ```

3. GIVEN [[Developer]] NEEDS cleanup
   1. WHEN [[Developer]] CLEARS secrets
      1. THEN [[Developer]] RUNS clear script
         1. AND [[Developer]] EXECUTES `./scripts/clear_secrets.sh`
      2. THEN [[Developer]] CONFIRMS deletion
         1. AND [[Developer]] RESPONDS to prompt
      3. IF [[deletion]] FAILS
         1. THEN [[Developer]] CHECKS logs
         2. AND [[Developer]] RETRIES operation

# ✅ Verification Checklist

1. GIVEN [[GPT Agent]] STARTS verification
   1. WHEN [[GPT Agent]] VERIFIES setup
      1. THEN [[GPT Agent]] CHECKS template
         1. AND [[GPT Agent]] CONFIRMS template exists
         2. AND [[GPT Agent]] VALIDATES secret documentation
      2. THEN [[GPT Agent]] CHECKS gitignore
         1. AND [[GPT Agent]] CONFIRMS secrets excluded
      3. THEN [[GPT Agent]] CHECKS scripts
         1. AND [[GPT Agent]] CONFIRMS executable permissions
         2. AND [[GPT Agent]] VALIDATES directory location
      4. THEN [[GPT Agent]] CHECKS firebase
         1. AND [[GPT Agent]] CONFIRMS project configuration
         2. IF [[configuration]] IS invalid
            1. THEN [[GPT Agent]] REPORTS issues
            2. AND [[GPT Agent]] SUGGESTS fixes

2. GIVEN [[GPT Agent]] COMPLETES setup
   1. WHEN [[GPT Agent]] VERIFIES scripts
      1. THEN [[GPT Agent]] CHECKS update_secrets.sh
         1. AND [[GPT Agent]] HANDLES missing files
         2. AND [[GPT Agent]] CREATES temp files securely
         3. AND [[GPT Agent]] CLEANS temp files
         4. AND [[GPT Agent]] REPORTS errors clearly
      2. THEN [[GPT Agent]] CHECKS clear_secrets.sh
         1. AND [[GPT Agent]] CONFIRMS deletion
         2. AND [[GPT Agent]] VERIFIES secret existence
         3. AND [[GPT Agent]] HANDLES errors gracefully
         4. AND [[GPT Agent]] REPORTS results clearly
      3. IF [[script]] FAILS
         1. THEN [[GPT Agent]] LOGS error
         2. AND [[GPT Agent]] SUGGESTS fixes 