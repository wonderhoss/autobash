# autobash
A set of autocomplete functions for bash

# requirements
Some features rely on bash version 4 functions not available earlier.

# usage
Clone repo to ~/.bash/autobash/ and add to .bash_profile:

```
source ~/.bash/autobash/autocomplete_gitbranch.sh
complete -o filenames -o bashdefault -F _complete_git_branches git
```
