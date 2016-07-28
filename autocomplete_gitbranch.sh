_complete_git_branches ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        prv="${COMP_WORDS[COMP_CWORD-1]}"
        if [[ ${prv} == "checkout" ]] ; then
                comp_git_branches=`git branch 2>/dev/null | grep -v ^*`
                COMPREPLY=( $(compgen -W "${comp_git_branches}" -- $cur))
        else
                COMPREPLY=( $(compgen -f ${COMP_WORDS[${COMP_CWORD}]} ))
        fi
        return 0
}

