_complete_ssh_hosts ()
{
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  comp_ssh_hosts=$(awk 'BEGIN{FS=",| "} !/^[[#]|^$/ { print $1 }' ~/.ssh/known_hosts;
                   awk '/^Host.*/ { if ($2 ~ !/^\*.*/) print $2}' ~/.ssh/config)
  if [[ "${COMP_WORDS[COMP_CWORD-1]}" == "@" ]]; then
    COMPREPLY=( @$(compgen -W "${comp_ssh_hosts}" -- "$cur"))
  elif [[ "-i" == "${COMP_WORDS[COMP_CWORD-1]}" ]]; then
    COMPREPLY=( $(compgen -f "${COMP_WORDS[${COMP_CWORD}]}" ))
  else
    COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- "$cur"))
  fi
  return 0
}
