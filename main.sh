# Entrypoint script. Source from .bash_profile or similar

# shellcheck source=./autocomplete_gitbranch.sh
source "${AUTOBASH}/autocomplete_gitbranch.sh"

complete -o filenames -o bashdefault -F _complete_git_branches git
