function init_cowcow() {
  echo "Welcome to cowcow - bash management and configuration!"
  read -rp "Enter the path to your Bash management repo (Git URL or local path): " repo

  # If it's a Git URL, clone it to a temporary directory.
  # If it's a local path, validate it directly.
  local tmp_dir
  if [[ "${repo}" =~ ^https?:// ]]; then
    # Clone
    tmp_dir="$(mktemp -d)"
    echo "Cloning ${repo} to ${tmp_dir}..."
    git clone "${repo}" "${tmp_dir}" || {
      echo "Error: Failed to clone the repo."
      exit 1
    }
  else
    # Assume local path
    tmp_dir="${repo}"
  fi

  # Validate repo structure
  if ! check_repo_structure "${tmp_dir}"; then
    echo "Repository structure check failed. Exiting."
    exit 1
  fi

  # If valid, source or copy aliases and functions
  echo "Repo structure validated. Pulling aliases and functions..."

  local aliases_file="${tmp_dir}/aliases.sh"
  local functions_file="${tmp_dir}/functions.sh"
  # Example approach: just source them at the bottom of your .bashrc:
  append_to_bash_config "source \"${aliases_file}\""
  append_to_bash_config "source \"${functions_file}\""

  echo "cowcow init completed successfully!"
  echo "Please reload your shell or run 'source ~/.zshrc' to apply changes."
}