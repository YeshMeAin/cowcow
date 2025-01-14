#!/usr/bin/env bash
#
# cowcow
# A utility to pull Bash config (functions, aliases and dependencies) from a remote repo

set -e

source helpers/init_cowcow.sh
source helpers/update_cowcow.sh
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
  functions)
    list_functions
    ;;
  *)
    help 
    ;;
esac
