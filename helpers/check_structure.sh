# --------------------------------------------------
# Helper function to check repo structure
# --------------------------------------------------
function check_structure() {
  local repo_path="$1"

  if [[ ! -d "${repo_path}/functions" || ! -d "${repo_path}/aliases" || ! -d "${repo_path}/dependencies" ]]; then
    echo "Error: Required directory (functions|aliases|dependencies) not found in ${repo_path}"
    return 1
  fi

  return 0
}