import os
import json
import logging
import pathlib
from typing import List, Dict, Set, Any

# Configuration
SCRIPT_DIR = pathlib.Path(__file__).parent.resolve()
ROOT_FOLDER = SCRIPT_DIR.parent.parent.resolve()
RAYCAST_SNIPPETS_FILE = ROOT_FOLDER / "developer" / "artifacts" / "raycast_snippets.json"
OUTPUT_NEW_SNIPPETS_FOLDER = ROOT_FOLDER / "developer" / "artifacts" / "new-snippets"
LOGGING_LEVEL = logging.INFO
EXCLUDED_DIRS_NAMES: Set[str] = {
    ".git",
    ".idea",
    ".pew",
    ".DS_Store",
    "node_modules", # Common exclusion
    "__pycache__", # Python specific
    "venv",        # Common virtual env name
    ".venv",       # Common virtual env name
    "build",       # Common build output
    "dist",        # Common distribution output
    "target",      # Common for Java/Rust
    # The OUTPUT_NEW_SNIPPETS_FOLDER is handled by absolute path comparison in the scan
}

def setup_logging() -> None:
    logging.basicConfig(
        level=LOGGING_LEVEL,
        format="%(asctime)s - %(levelname)s - %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
    )

def load_raycast_snippets(file_path: pathlib.Path) -> List[Dict[str, Any]]:
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            snippets = json.load(f)
        if not isinstance(snippets, list):
            logging.error(f"Error: Expected a list of snippets in {file_path}, but got {type(snippets)}.")
            return []
        
        valid_snippets = []
        for snippet_entry in snippets:
            if not isinstance(snippet_entry, dict):
                logging.warning(f"Warning: Skipping non-dict snippet entry: {str(snippet_entry)[:100]}")
                continue
            keyword = snippet_entry.get("keyword")
            text_content = snippet_entry.get("text")
            if not isinstance(keyword, str) or not keyword:
                logging.warning(f"Warning: Skipping snippet entry with invalid or missing keyword: {str(snippet_entry)[:100]}")
                continue
            if not isinstance(text_content, str): # Allow empty string for text, but must be string type
                logging.warning(f"Warning: Skipping snippet entry for keyword '{keyword}' due to invalid text content type (expected str): {type(text_content)}")
                continue
            valid_snippets.append(snippet_entry)
        return valid_snippets
    except FileNotFoundError:
        logging.error(f"Error: Raycast snippets file not found at {file_path}")
        return []
    except json.JSONDecodeError as e:
        logging.error(f"Error: Could not decode JSON from {file_path}. Details: {e}")
        return []

def get_existing_markdown_filenames_from_repo(
    root_scan_path: pathlib.Path,
    excluded_dir_names_set: Set[str],
    abs_output_folder_to_exclude: pathlib.Path
) -> Set[str]:
    existing_files_stems: Set[str] = set()
    logging.info(f"Scanning for existing .md files in repository root: {root_scan_path}")
    logging.debug(f"Excluding directory names: {excluded_dir_names_set}")
    logging.debug(f"Explicitly excluding output folder from scan: {abs_output_folder_to_exclude}")

    for current_dir_str, dir_names_list, file_names_list in os.walk(root_scan_path, topdown=True):
        current_dir_path_obj = pathlib.Path(current_dir_str)

        if current_dir_path_obj.resolve() == abs_output_folder_to_exclude.resolve():
            logging.debug(f"Skipping scan of the output artifacts folder itself: {current_dir_path_obj}")
            dir_names_list[:] = [] 
            continue

        # Filter dir_names_list in place to prevent descending into excluded directories
        dir_names_list[:] = [d_name for d_name in dir_names_list if d_name not in excluded_dir_names_set]

        for f_name in file_names_list:
            if f_name.endswith(".md"):
                # Ensure we don't collect from a sub-folder of an excluded top-level dir
                # that might not have been pruned if the top-level excluded dir was symlinked etc.
                # This is a bit redundant if os.walk pruning is perfect but adds safety.
                is_in_excluded_path = False
                try:
                    # Check if any part of the path relative to root_scan_path is an excluded dir name
                    # This is a more robust check for nested exclusions if topdown pruning wasn't enough.
                    relative_to_scan_root = current_dir_path_obj.relative_to(root_scan_path)
                    for part in relative_to_scan_root.parts:
                        if part in excluded_dir_names_set:
                            is_in_excluded_path = True
                            break
                except ValueError: # Not relative, should not happen if os.walk starts from root_scan_path
                    pass

                if is_in_excluded_path:
                    logging.debug(f"Skipping {f_name} in {current_dir_path_obj} as it's within an excluded directory path.")
                    continue
                
                existing_files_stems.add(pathlib.Path(f_name).stem)
    
    logging.info(f"Found {len(existing_files_stems)} unique .md file stems across the repository (respecting exclusions).")
    return existing_files_stems

def create_missing_markdown_files(
    snippets: List[Dict[str, Any]],
    existing_markdown_names_set: Set[str],
    output_folder_path: pathlib.Path,
) -> int:
    created_files_count = 0
    if not snippets:
        logging.info("No valid snippets loaded to process for creating markdown files.")
        return 0

    try:
        output_folder_path.mkdir(parents=True, exist_ok=True)
    except OSError as e:
        logging.error(f"Error creating output directory {output_folder_path}: {e}")
        return 0

    for snippet_entry in snippets:
        keyword = snippet_entry["keyword"] # Already validated as string
        text_content = snippet_entry["text"] # Already validated as string

        sanitized_keyword = keyword.replace(os.path.sep, "_").replace("/", "_").replace("\\\\", "_")
        # Further sanitize common problematic chars for filenames, though snippet keywords should be clean.
        sanitized_keyword = "".join(c if c.isalnum() or c in ['-', '_'] else '_' for c in sanitized_keyword)


        if sanitized_keyword not in existing_markdown_names_set:
            new_file_path = output_folder_path / f"{sanitized_keyword}.md"
            try:
                with open(new_file_path, "w", encoding="utf-8") as f:
                    f.write(text_content)
                logging.info(f"Created missing markdown file: {new_file_path}")
                created_files_count += 1
            except OSError as e:
                logging.error(f"Error writing file {new_file_path}: {e}")
            except Exception as e:
                logging.error(f"An unexpected error occurred while writing file {new_file_path}: {e}")
        else:
            logging.debug(f"Skipping keyword '{keyword}' (sanitized: '{sanitized_keyword}') as its .md file already exists in the repository.")
    return created_files_count

def main() -> None:
    setup_logging()
    logging.info("Starting script to generate missing markdown files (repository-wide check)...")

    abs_output_new_snippets_folder = OUTPUT_NEW_SNIPPETS_FOLDER.resolve()

    raycast_snippets_data = load_raycast_snippets(RAYCAST_SNIPPETS_FILE)
    if not raycast_snippets_data:
        logging.info("No valid Raycast snippets loaded. Exiting.")
        return

    existing_markdown_filenames = get_existing_markdown_filenames_from_repo(
        ROOT_FOLDER,
        EXCLUDED_DIRS_NAMES,
        abs_output_new_snippets_folder
    )

    num_created = create_missing_markdown_files(
        raycast_snippets_data,
        existing_markdown_filenames,
        abs_output_new_snippets_folder,
    )

    if num_created > 0:
        logging.info(f"Successfully created {num_created} new markdown files in {abs_output_new_snippets_folder}.")
    else:
        logging.info("No new markdown files were created (all corresponding .md files were found in the repo or no valid snippets to process).")

    logging.info("Script finished.")

if __name__ == "__main__":
    main() 