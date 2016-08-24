_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=$(cat ~/.ssh/known_hosts | \
			sed s/[,\ ].*\$//| \
                        grep -v ^# | \
			grep -v "\[" | \
			sort -u ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
			grep -v \* |
                        cut -f 2 -d ' '
                )
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
