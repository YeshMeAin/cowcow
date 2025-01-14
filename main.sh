#!/usr/bin/env bash
#
# cowcow
# A utility to pull Bash config (functions and aliases) from a remote repo
#

set -e

source helpers/init_cowcow.sh
source helpers/update_cowcow.sh
source helpers/list_aliases.sh
source helpers/list_functions.sh
source helpers/help.sh
# --------------------------------------------------
# Main argument handling
# --------------------------------------------------
case "$1" in
  init)
    init_cowcow
    ;;
  update)
    update_cowcow "$2"
    ;;
  aliases)
    list_aliases
    ;;
  functions)
    list_functions
    ;;
  *)
    help
    ;;
esac
