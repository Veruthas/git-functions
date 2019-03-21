function git-rename {
    Param($oldBranch)
    Param($newBranch)
    git checkout $oldBranch
    git branch -m $newBranch
    git push origin :$oldBranch $newBranch
    git push origin -u $newBranch

}