function install_dependencies() {
  local dependencies_dir="$1"
  local shell_config="$2"

  # iterate over the csv file, installing with brew the named package, if version is specified, install that version
  while IFS=, read -r package version; do
    if [[ -n "$version" ]]; then
      brew install "$package@$version"
    else
      brew install "$package"
    fi
  done < "$dependencies_dir/dependencies.csv"
}
