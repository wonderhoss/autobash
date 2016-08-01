# Comment
complete_checkout () {
	if [[ $comp_git_branches =~ ${COMP_WORDS[COMP_CWORD-1]} ]]; then
		if [[ $BASH_VERSION == 4* ]]; then
			local target_branch=${COMP_WORDS[COMP_CWORD-1]}
			if [[ $cur =~ .*/.* ]]; then
				path="${cur%/*}/"
	 			local dirs=$(git ls-tree -d --name-only $target_branch $path | sed s/\$/\\//)
				local git_ls=$(git ls-tree --name-only $target_branch $path)
			else
		 		local dirs=$(git ls-tree -d --name-only $target_branch | sed s/\$/\\//)
				local git_ls=$(git ls-tree --name-only $target_branch)
			fi
			local comp_list=$dirs
			for item in $git_ls
			do
				if [[ ! $dirs =~ "$item/" ]]; then
					comp_list="$comp_list $item"
				fi
			done
			COMPREPLY=( $(compgen -W "${comp_list}" -- $cur))
			[[ $COMPREPLY = */ ]] && compopt -o nospace
		else
	                COMPREPLY=( $(compgen -f ${COMP_WORDS[${COMP_CWORD}]} ))
		fi
	else
		COMPREPLY=( $(compgen -W "${comp_git_branches}" -- $cur))
	fi
	return 0
}

complete_rebase () {
	if [[ $comp_git_branches =~ ${COMP_WORDS[COMP_CWORD-1]} ]]; then
                COMPREPLY=()
	elif [[ "-i" == ${COMP_WORDS[COMP_CWORD-1]} ]]; then
		local curr_commits=$(git log --pretty=tformat:%h)
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
