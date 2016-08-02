# Entrypoint script. Source from .bash_profile or similar

# shellcheck source=./git/autocomplete_gitbranch.sh
source "${AUTOBASH}/git/autocomplete_gitbranch.sh"

complete -o filenames -o bashdefault -F _complete_git_branches git
