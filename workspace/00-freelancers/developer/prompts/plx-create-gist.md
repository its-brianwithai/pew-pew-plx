Please create GitHub gists from the following files using the GitHub CLI:

{{LIST_OF_FILES}}

Instructions:
1. For each file, create a separate public gist that maintains the exact same filename
2. Generate an SEO-optimized description (max 300 characters) that:
   - Clearly summarizes what the file/code is about
   - Includes relevant keywords related to the file's content
   - Describes the purpose, functionality, or key features
   - Makes the gist discoverable in searches
3. Use the GitHub CLI to create each gist with the proper filename and SEO description
4. In case the file is markdown and no initial markdown header is present, add a header as the filename in readable title format
5. After creation, provide me with a list of all gist URLs, in separate code blocks for easy copy-paste, in this format:

   ```
   - filename.js: https://gist.github.com/username/gist_id
   ```

   ```
   - another_file.py: https://gist.github.com/username/another_gist_id
   ```

Example command structure:
gh gist create [filepath] --desc "[SEO-optimized description]"

Assume GitHub CLI is already installed and authenticated, no need to check for it. If you encounter any issues, please explain them clearly.