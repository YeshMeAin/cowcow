# --------------------------------------------------
# Helper function to check repo structure
# --------------------------------------------------
function check_structure() {
  local repo_path="$1"

  if [[ ! -d "${repo_path}" ]]; then
    echo "Error: Directory not found in ${repo_path}"
    return 1
  fi

  if [[ ! -d "${repo_path}/dependencies" ]]; then
    echo "Error: Directory not found in ${repo_path}/dependencies"
    return 1
  elif [[ ! -f "${repo_path}/dependencies/dependencies.csv" ]]; then
    echo "Error: File not found in ${repo_path}/dependencies/dependencies.csv"
    return 1
  else
   local headers
    headers=$(head -n 1 "${repo_path}/dependencies/dependencies.csv")

    # Check for specific headers
    if [[ "$headers" != *"package"* || "$headers" != *"version"* ]]; then
      echo "Error: Required headers (package, version) not found in ${repo_path}/dependencies/dependencies.csv"
      return 1
    fi
  fi

  if [[ ! -d "${repo_path}/functions" || ! -d "${repo_path}/aliases" ]]; then
    echo "Error: Required directory (functions|aliases|dependencies) not found in ${repo_path}"
    return 1
  fi

  return 0
}