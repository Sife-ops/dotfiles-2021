OS="TempleOS"
sed -e "/OS/ s/Arch Linux/${OS}/" \
    -e "/Kernel/ s/arch/${OS}/" \
    -e "/Packages/ s/pacman/${OS}/" \
    <(neofetch --source /home/wyatt/.dotfiles/cli/.local/share/neofetch/templeos)
    # <(neofetch --ascii_distro gentoo)

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
