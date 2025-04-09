Please generate Raycast snippets from markdown files in the repository by running the generate_raycast_snippets.py script located in the developer/scripts directory.

## Instructions

The script will:
- Process all .md files in the specified directories
- Transform variables in format {{VARIABLE}} to Raycast-compatible argument format
- Generate a JSON file in the developer/outputs directory

Execute this command:
```bash
cd developer/scripts
python generate_raycast_snippets.py
```

After running, verify that raycast_snippets.json was created in developer/outputs directory. 
