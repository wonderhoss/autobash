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

```bash
export AUTOBASH=~/.bash/autobash
source "${AUTOBASH}/main.sh"
```

# features
## git
Currently autocompletion for git includes the following capabilities.
### git checkout
* For the basic `git checkout`, autobash will complete known local branches.
* For `git checkout <branch> <path>`, autobash is able to complete files in the specified branch, even if they're not present in the current branch. *[bash4 only]*

### git rebase
* For a simple `git rebase`, autobash will offer known local branches.
* For `git rebase -i`, autobash will offer branches and also any commit sha on the current branch.
