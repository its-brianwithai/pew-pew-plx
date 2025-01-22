---
document_type: protocol
goal: create new brick following standardized format
gpt_action: follow these steps when creating a new brick
---

CONTEXT: The [[User]] wants to create a new Mason brick that follows the project's standardized brick format and organization rules.

1. GIVEN [[User]] REQUESTS brick creation
    1. THEN [[You]] GATHER requirements
        1. AND [[You]] GET brick name
        2. AND [[You]] GET brick purpose
        3. AND [[You]] GET required variables
    2. IF [[requirements]] ARE unclear
        1. THEN [[You]] ASK [[User]]
        2. AND [[You]] WAIT response

2. WHEN [[You]] STARTS brick setup
    1. THEN [[You]] CREATE brick structure
        1. AND [[You]] CREATE `__brick__` directory
        2. AND [[You]] CREATE `brick.yaml`
    2. AND [[You]] CONFIGURE `brick.yaml`
        1. AND [[You]] SET name
        2. AND [[You]] SET description
        3. AND [[You]] SET version
        4. AND [[You]] DEFINE variables
           ```yaml
           vars:
             projectKey:
               type: string
               description: The project key (e.g. Turbo -> TurboScaffold)
             featureName:
               type: string
               description: Name of the feature (e.g. auth -> features/auth/*)
               default: core
           ```

3. GIVEN [[structure]] IS ready
    1. THEN [[You]] ANALYZE original files
        1. AND [[You]] IDENTIFY variable usage
        2. AND [[You]] NOTE casing patterns
    2. AND [[You]] USE Mustache syntax
        1. AND [[You]] USE transformations based on original casing:
            - IF original is PascalCase: `{{varName.pascalCase()}}`
            - IF original is snake_case: `{{varName.snakeCase()}}`
            - IF original is param-case: `{{varName.paramCase()}}`
            - IF original is camelCase: `{{varName.camelCase()}}`
    3. AND [[You]] FOLLOW replacement rules
        1. AND [[You]] KEEP unrelated files unchanged
        2. AND [[You]] ONLY replace parts using defined variables
        3. AND [[You]] MAINTAIN original casing pattern

4. WHEN [[You]] IMPLEMENTS templates
    1. THEN [[You]] FOLLOW patterns
        1. AND [[You]] COPY original structure
        2. AND [[You]] REPLACE only variable parts
           ```dart
           // If original has:
           class TurboWidget {}
           
           // And projectKey is a variable, template becomes:
           class {{projectKey.pascalCase()}}Widget {}
           
           // If original has:
           final user_id = 'userId';
           
           // And userId is a variable, template becomes:
           final {{userId.snakeCase()}} = 'userId';
           ```
    2. IF [[template]] NEEDS testing
        1. THEN [[You]] CREATE test files
        2. AND [[You]] ADD example usage

5. GIVEN [[brick]] IS complete
    1. THEN [[You]] VERIFY structure
        1. AND [[You]] CHECK files match existing bricks
        2. AND [[You]] CHECK variables are consistent
        3. AND [[You]] CHECK templates maintain original patterns
    2. IF [[User]] ACCEPTS [[brick]]
        1. THEN [[You]] COMMIT changes
        2. AND [[You]] UPDATE documentation
