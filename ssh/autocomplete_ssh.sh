_complete_ssh_hosts ()
{
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  comp_ssh_hosts=$(awk 'BEGIN{FS=",| "} !/^[[#]|^$/ { print $1 }' ~/.ssh/known_hosts;
                   awk '/^Host.*/ { if ($2 ~ !/^\*.*/) print $2}' ~/.ssh/config)
  COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- "$cur"))
  return 0
}
