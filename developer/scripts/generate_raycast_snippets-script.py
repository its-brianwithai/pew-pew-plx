import os
import json
import logging
from typing import List, Dict
import re

# Configuration
ROOT_FOLDER = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))  # Project root
OUTPUT_FOLDER = "developer/artifacts"  # The folder where the JSON file will be saved
ALLOWED_FOLDERS = ["prompts", "templates", "systems", "wows", "snippets"]  # Only process files in these folders or their subfolders
ALLOWED_FILE_TYPES = [".md", ".mdc", ".txt"]  # Only process files with these extensions
BASE_SNIPPET_FILENAME = "raycast_snippets.json"  # The base file that will be updated
TEMP_SNIPPET_FILENAME = "raycast_snippets_temp.json"  # Temporary file for atomic writing
MAX_SNIPPET_LENGTH = 65536  # Maximum allowed character length for a snippet

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
        # Check if any parent folder in the path is in ALLOWED_FOLDERS
        path_parts = root.split(os.sep)
        is_in_allowed_folder = any(folder in path_parts for folder in ALLOWED_FOLDERS)
        
        if is_in_allowed_folder:
            # Process files in allowed folders or their subfolders
            for file in files:
                file_ext = os.path.splitext(file)[1]
                if file_ext in ALLOWED_FILE_TYPES:
                    file_path = os.path.join(root, file)
                    matching_files.append(file_path)
                    logging.info(f"Found matching file: {file_path}")
                else:
                    logging.debug(f"Skipping file: {file} (invalid extension)")
        else:
            logging.debug(f"Skipping folder: {root}")
    
    return matching_files

def generate_snippets():
    """
    Generate Raycast snippets from matching files, merge with existing snippets from base file,
    and atomically update the base file with the merged result.
    """
    existing_snippets_data = {}  # Will hold existing snippets keyed by keyword
    new_snippets_list = []  # Will hold newly generated snippets
    processed_files = 0
    skipped_files = 0
    oversize_files = 0
    existing_snippets_count = 0
    file_exists = False
    
    try:
        # Define the paths for base and temporary files
        base_file_path = os.path.join(OUTPUT_FOLDER, BASE_SNIPPET_FILENAME)
        temp_file_path = os.path.join(OUTPUT_FOLDER, TEMP_SNIPPET_FILENAME)
        
        # Step 1: Attempt to load the base file
        try:
            logging.info(f"Attempting to load base file: {os.path.abspath(base_file_path)}")
            with open(base_file_path, 'r', encoding='utf-8') as f:
                loaded_data = json.load(f)
                
            # Convert the list of snippets to a dictionary keyed by keyword
            for snippet in loaded_data:
                if 'keyword' in snippet:
                    existing_snippets_data[snippet['keyword']] = snippet
            
            existing_snippets_count = len(existing_snippets_data)
            file_exists = True
            logging.info(f"Base file loaded successfully with {existing_snippets_count} snippets.")
            
        except FileNotFoundError:
            logging.warning(f"Base file not found at {os.path.abspath(base_file_path)}. Starting with empty snippet set.")
        except json.JSONDecodeError:
            logging.warning(f"Base file contains invalid JSON. Starting with empty snippet set.")
        except Exception as e:
            logging.error(f"Unexpected error loading base file: {str(e)}. Starting with empty snippet set.")
            
        # Step 2: Generate new snippets from source files
        logging.info(f"Starting search for source files in: {os.path.abspath(ROOT_FOLDER)}")
        logging.info(f"Looking for files in folders/subfolders named: {', '.join(ALLOWED_FOLDERS)}")
        logging.info(f"Processing files with extensions: {', '.join(ALLOWED_FILE_TYPES)}")
        
        matching_files = find_matching_files()
        
        if not matching_files:
            logging.warning("No matching source files found!")
            if not existing_snippets_data:
                logging.error("No existing snippets and no source files. Nothing to do.")
                return
            logging.info("Proceeding with existing snippets only.")
        
        # Store the existing keywords before merging for later comparison
        existing_keywords = set(existing_snippets_data.keys())
        
        # Process the source files to generate new snippets
        for file_path in matching_files:
            try:
                # Get filename without extension to use as name and keyword
                name = os.path.splitext(os.path.basename(file_path))[0]
                
                # Read the content of the file
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                
                # Check if content exceeds maximum length
                if len(content) >= MAX_SNIPPET_LENGTH:
                    logging.warning(f"Skipping file (exceeds size limit of {MAX_SNIPPET_LENGTH} characters): {file_path}")
                    oversize_files += 1
                    continue
                
                # Create snippet object with original content (no transformation)
                snippet = {
                    "name": name,
                    "text": content,
                    "keyword": name
                }
                
                new_snippets_list.append(snippet)
                processed_files += 1
                logging.info(f"Processed file: {file_path}")
                
            except Exception as e:
                logging.error(f"Error processing file {file_path}: {str(e)}")
                skipped_files += 1
        
        # Step 3: Merge new snippets with existing snippets
        logging.info(f"Merging {len(new_snippets_list)} new snippets with {existing_snippets_count} existing snippets.")
        
        # Get the set of keywords from new snippets for easier comparison
        new_keywords = {snippet['keyword'] for snippet in new_snippets_list}
        
        # Add all new snippets to the existing data
        for new_snippet in new_snippets_list:
            existing_snippets_data[new_snippet['keyword']] = new_snippet
        
        # Count how many existing snippets were preserved (not overwritten)
        preserved_snippets = len(existing_keywords - new_keywords)
        
        # Convert the merged dictionary back to a list
        final_snippet_list = list(existing_snippets_data.values())
        
        # Create output directory if it doesn't exist
        os.makedirs(OUTPUT_FOLDER, exist_ok=True)
        
        # Step 4: Write to temporary file
        try:
            with open(temp_file_path, 'w', encoding='utf-8') as f:
                json.dump(final_snippet_list, f, indent=2, ensure_ascii=False)
            logging.info(f"Temporary file written successfully: {os.path.abspath(temp_file_path)}")
            
            # Step 5: Atomically replace the base file
            try:
                os.replace(temp_file_path, base_file_path)
                logging.info(f"Base file successfully updated via atomic replace.")
            except OSError as e:
                logging.error(f"Failed to replace base file: {str(e)}")
                logging.error(f"Temporary file remains at: {os.path.abspath(temp_file_path)}")
        except Exception as e:
            logging.error(f"Error writing temporary file: {str(e)}")
        
        # Log summary
        updated_snippets = len(new_snippets_list)
        total_snippets = len(final_snippet_list)
        
        logging.info(f"\nSummary:")
        logging.info(f"- Existing snippets loaded: {existing_snippets_count}")
        logging.info(f"- Files processed: {processed_files}")
        logging.info(f"- Files skipped due to errors: {skipped_files}")
        logging.info(f"- Files skipped due to size (>= {MAX_SNIPPET_LENGTH} chars): {oversize_files}")
        logging.info(f"- New snippets generated: {updated_snippets}")
        if file_exists:
            logging.info(f"- Preserved existing snippets: {preserved_snippets}")
            logging.info(f"- Updated existing snippets: {len(existing_keywords.intersection(new_keywords))}")
        logging.info(f"- Total snippets in updated file: {total_snippets}")
        logging.info(f"- Output saved to: {os.path.abspath(base_file_path)}")
        
    except Exception as e:
        logging.error(f"Error generating snippets: {str(e)}")
        raise

if __name__ == "__main__":
    try:
        generate_snippets()
    except Exception as e:
        logging.error(f"Script failed: {str(e)}")
        exit(1) 
