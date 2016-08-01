# autobash
A set of autocomplete functions for bash

# requirements
Some features rely on bash 4 only functions.

# usage
Clone repo to ~/.bash/autobash/ and add to .bash_profile:

```
source ~/.bash/autobash/autocomplete_gitbranch.sh
complete -o filenames -o bashdefault -F _complete_git_branches git
```
