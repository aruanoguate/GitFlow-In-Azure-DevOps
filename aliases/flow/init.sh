#!/bin/bash

# Imports
. $HOME/gitflow/modules/show.sh
. $HOME/gitflow/modules/try.sh
. $HOME/gitflow/modules/verify.sh

# Validations
verifyInGitRepo;
verifyNoUncommitedChanges;
verifyBranchNameIs "master";
verifyUpToDateBranch;

# Process
tryCreateBranch "develop" "master";
git checkout develop;
git push --set-upstream origin develop;
showSuccess "The repository was initialized";