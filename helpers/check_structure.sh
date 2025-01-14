# --------------------------------------------------
# Helper function to check repo structure
# --------------------------------------------------
function check_repo_structure() {
  local repo_path="$1"

  if [[ ! -f "${repo_path}/aliases.sh" || ! -f "${repo_path}/functions.sh" ]]; then
    echo "Error: Required files (aliases.sh, functions.sh) not found in ${repo_path}"
    return 1
  fi
  return 0
}