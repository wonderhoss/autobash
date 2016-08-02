# Entrypoint script. Source from .bash_profile or similar

source "${AUTOBASH}/autocomplete_gitbranch.sh"

complete -o filenames -o bashdefault -F _complete_git_branches git
