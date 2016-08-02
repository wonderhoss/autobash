# autobash
A set of autocomplete functions for bash

## build status

| master | development |
| ------ | ----------- |
|[![Build Status](http://aron.thepisymbol.info:8080/buildStatus/icon?job=autobash)](http://aron.thepisymbol.info:8080/job/autobash/)|[![Build Status](http://aron.thepisymbol.info:8080/buildStatus/icon?job=autobash-dev)](http://aron.thepisymbol.info:8080/job/autobash-dev/)|

# requirements
Some features rely on bash version 4 functions not available earlier.

# usage
Clone repo to ~/.bash/autobash/ and add to .bash_profile:

```
source ~/.bash/autobash/autocomplete_gitbranch.sh
complete -o filenames -o bashdefault -F _complete_git_branches git
```
