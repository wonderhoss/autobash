# Comment
complete_checkout () {
	if [[ $comp_git_branches =~ ${COMP_WORDS[COMP_CWORD-1]} ]]; then
                COMPREPLY=( $(compgen -f ${COMP_WORDS[${COMP_CWORD}]} ))
	else
		COMPREPLY=( $(compgen -W "${comp_git_branches}" -- $cur))

	fi
	return 0
}

complete_rebase () {
	if [[ $comp_git_branches =~ ${COMP_WORDS[COMP_CWORD-1]} ]]; then
                COMPREPLY=()
	elif [[ "-i" == ${COMP_WORDS[COMP_CWORD-1]} ]]; then
		curr_commits=$(git log --pretty=tformat:%h)
		COMPREPLY=( $(compgen -W "${curr_commits} ${comp_git_branches}" -- $cur))
	else
		COMPREPLY=( $(compgen -W "${comp_git_branches}" -- $cur))

	fi
}

_complete_git_branches ()
{
        COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	comp_git_branches=$(git branch 2>/dev/null | sed s/^[*]*[[:space:]]*//)
	if [[ "checkout" == ${COMP_WORDS[1]} ]]; then
		complete_checkout
	elif [[ "rebase" == ${COMP_WORDS[1]} ]]; then
		complete_rebase
	else
                COMPREPLY=( $(compgen -f ${COMP_WORDS[${COMP_CWORD}]} ))
	fi
        return 0
}
