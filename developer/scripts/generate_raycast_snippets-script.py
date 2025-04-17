import os
import json
import logging
from typing import List
import re  # Add import for regular expressions

# Configuration
ROOT_FOLDER = "../"  # The root folder to start searching from (the developer directory)
OUTPUT_FOLDER = "developer/artifacts"  # The folder where the JSON file will be saved (inside developer directory)
ALLOWED_FOLDERS = ["prompts", "templates", "systems"]  # Only process folders with these exact names
ALLOWED_FILE_TYPES = [".md"]  # Only process files with these extensions

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s: %(message)s',
    datefmt='%H:%M:%S'
)

def find_matching_files() -> List[str]:
    """
    Recursively find files in allowed folders with allowed extensions.
    Returns a list of file paths.
    """
    matching_files = []
    
    for root, dirs, files in os.walk(ROOT_FOLDER):
        # Check if the current directory's name is in ALLOWED_FOLDERS
        current_folder = os.path.basename(root)
        if current_folder not in ALLOWED_FOLDERS and root != ROOT_FOLDER:
            logging.info(f"Skipping folder: {root}")
            continue
            
        # Process files in allowed folders
        for file in files:
            file_ext = os.path.splitext(file)[1]
            if file_ext in ALLOWED_FILE_TYPES:
                matching_files.append(os.path.join(root, file))
            else:
                logging.info(f"Skipping file: {file} (invalid extension)")
    
    return matching_files

def transform_variables(content: str) -> str:
    """
    Transform variables in the format {{VARIABLE}} to {argument name="{{VARIABLE}}"}
    """
    # Use a single regex replacement to avoid nested replacements
    pattern = r'\{\{([^{}]+?)\}\}'
    
    # Function to handle each match
    def replace_func(match):
        var_name = match.group(1)
        return f"{{argument name=\"{{{{{var_name}}}}}\"}}"
    
    # Apply the replacement once (non-recursive)
    return re.sub(pattern, replace_func, content)

def generate_snippets():
    """
    Generate Raycast snippets from matching files and save to JSON.
    """
    snippets = []
    processed_files = 0
    skipped_files = 0
    
    try:
        logging.info(f"Starting search in: {os.path.abspath(ROOT_FOLDER)}")
        logging.info(f"Looking for folders named: {', '.join(ALLOWED_FOLDERS)}")
        logging.info(f"Processing files with extensions: {', '.join(ALLOWED_FILE_TYPES)}")
        
        matching_files = find_matching_files()
        
        if not matching_files:
            logging.warning("No matching files found!")
            return
        
        for file_path in matching_files:
            try:
                # Get filename without extension to use as name and keyword
                name = os.path.splitext(os.path.basename(file_path))[0]
                
                # Read the content of the file
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                
                # Transform variables in the content
                transformed_content = transform_variables(content)
                
                # Create snippet object
                snippet = {
                    "name": name,
                    "text": transformed_content,
                    "keyword": name
                }
                
                snippets.append(snippet)
                processed_files += 1
                logging.info(f"Processed file: {file_path}")
                
            except Exception as e:
                logging.error(f"Error processing file {file_path}: {str(e)}")
                skipped_files += 1
        
        # Create output directory if it doesn't exist
        os.makedirs(OUTPUT_FOLDER, exist_ok=True)
        
        # Write the JSON file
        output_file = os.path.join(OUTPUT_FOLDER, 'raycast_snippets.json')
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(snippets, f, indent=2, ensure_ascii=False)
        
        # Log summary
        logging.info(f"\nSummary:")
        logging.info(f"- Files processed: {processed_files}")
        logging.info(f"- Files skipped: {skipped_files}")
        logging.info(f"- Total snippets created: {len(snippets)}")
        logging.info(f"- Output saved to: {os.path.abspath(output_file)}")
        
    except Exception as e:
        logging.error(f"Error generating snippets: {str(e)}")
        raise

if __name__ == "__main__":
    try:
        generate_snippets()
    except Exception as e:
        logging.error(f"Script failed: {str(e)}")
        exit(1) 
