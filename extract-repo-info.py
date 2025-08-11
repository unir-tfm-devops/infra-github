import sys
import re

def extract_repo_info(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()
    
    repo_name = re.search(r'### Repository Name\n\n(.*?)\n', content, re.DOTALL)
    repo_description = re.search(r'### Repository Description\n\n(.*?)\n', content, re.DOTALL)
    repo_visibility = re.search(r'### Repository Visibility\n\n(.*?)\n', content, re.DOTALL)
    repo_template = re.search(r'### Repository Template\n\n(.*?)\n', content, re.DOTALL)
    repo_cloud_provider = re.search(r'### Cloud Provider\n\n(.*?)\n', content, re.DOTALL)
    
    extracted_info = {
        "Name": repo_name.group(1).strip() if repo_name else "Not found",
        "Description": repo_description.group(1).strip() if repo_description else "Not found",
        "Visibility": repo_visibility.group(1).strip() if repo_visibility else "Not found",
        "Template": repo_template.group(1).strip() if repo_template else "Not found",
        "Cloud": repo_cloud_provider.group(1).strip() if repo_cloud_provider else "Not found"
    }

    # Save extracted info to a file
    with open("extracted_info.txt", "w", encoding="utf-8") as output_file:
        for key, value in extracted_info.items():
            output_file.write(f"{key}: {value}\n")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python extract_repo_info.py <file_path>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    extract_repo_info(file_path)
