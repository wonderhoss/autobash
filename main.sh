# Entrypoint script. Source from .bash_profile or similar

if [[ "$0" == "${BASH_SOURCE[0]}" ]]; then
  echo "Error: This script needs to be sourced instead of executed."
  exit 1
fi

if [ -z "${AUTOBASH}" ]; then
  echo "Error: Please set \$AUTOBASH to point to the autobash directory before sourcing this file."
  return 1
fi

# shellcheck source=./git/autocomplete_gitbranch.sh
source "${AUTOBASH}/git/autocomplete_gitbranch.sh"

# shellcheck source=./ssh/autocomplete_ssh.sh
source "${AUTOBASH}/ssh/autocomplete_ssh.sh"

complete -o filenames -o bashdefault -F _complete_git_branches git
complete -F _complete_ssh_hosts ssh

if [[ ! $BASH_VERSION == 4* ]]; then
  echo "Notice: Some autobash functionality requires bash version 4."
  echo "Your bash is $BASH_VERSION and those functions will be disabled."
  echo "For more information see" 
  echo "https://gist.github.com/gargath/49ece1408aa66e99c1b26f35f812e586#file-autobash4-md"
fi

