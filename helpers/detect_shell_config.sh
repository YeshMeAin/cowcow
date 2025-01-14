function detect_shell_config() {
  case "$SHELL" in
    */bash)
      echo "$HOME/.bashrc"
      ;;
    */zsh)
      echo "$HOME/.zshrc"
      ;;
    *)
      echo "Unsupported shell. Exiting." >&2
      exit 1
      ;;
  esac
}