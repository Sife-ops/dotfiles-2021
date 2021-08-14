deploy-branch(){
    git branch -D deploy
    git checkout -b deploy
    git push -u --force origin deploy
    git checkout @{-1}
}
