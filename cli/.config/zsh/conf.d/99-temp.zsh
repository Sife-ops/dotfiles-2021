OS="Gentoo"
sed -e "/OS/ s/Arch Linux/${OS}/" \
    -e "/Kernel/ s/arch/${OS}/" \
    -e "/Packages/ s/pacman/${OS}/" \
    <(neofetch --ascii_distro gentoo)
    # <(neofetch --source /home/wyatt/.dotfiles/cli/.local/share/neofetch/templeos)

# deploy-branch(){
#     git branch -D deploy
#     git checkout -b deploy
#     git push -u --force origin deploy
#     git checkout @{-1}
# }

gcd(){
    git branch -D deploy
    git checkout -b deploy
}

gmt(){
    branch=$(git branch --show-current)
    newBranch="${branch}|${1}|Merge"
    git branch -D "${newBranch}"
    git checkout -b "${newBranch}"
    git merge "${1}"
}
