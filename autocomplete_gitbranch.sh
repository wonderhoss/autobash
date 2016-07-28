git_takes_branch ()
{
	if [[ "checkout" == ${COMP_WORDS[1]} ]]; then
		if [[ $comp_git_branches =~ ${COMP_WORDS[COMP_CWORD-1]} ]]; then
			return 1
		else
			return 0
		fi
	elsif [[ "rebase" == ${COMP_WORDS[1]} ]];
		return 0
	else
		return 1
	fi
}

_complete_git_branches ()
{
        COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	comp_git_branches=$(git branch 2>/dev/null | sed s/^[*]*[[:space:]]*//)
        if git_takes_branch; then
                COMPREPLY=( $(compgen -W "${comp_git_branches}" -- $cur))
        else
                COMPREPLY=( $(compgen -f "${COMP_WORDS[${COMP_CWORD}]}" ))
        fi
        return 0
}

