# Entrypoint script. Source from .bash_profile or similar

# shellcheck source=./git/autocomplete_gitbranch.sh
source "${AUTOBASH}/git/autocomplete_gitbranch.sh"

complete -o filenames -o bashdefault -F _complete_git_branches git

if [[ ! $BASH_VERSION == 4* ]]; then
  echo "Notice: Some autobash functionality requires bash version 4."
  echo "Your bash is $BASH_VERSION and those functions will be disabled."
  echo "For more information see" 
  echo "https://gist.github.com/gargath/49ece1408aa66e99c1b26f35f812e586#file-autobash4-md"
fi

