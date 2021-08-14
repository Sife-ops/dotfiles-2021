sed -e '/OS/ s/Arch/Gentoo/' \
    -e '/Kernel/ s/arch/gentoo/' \
    <(neofetch --ascii_distro gentoo)
deploy-branch(){
    git branch -D deploy
    git checkout -b deploy
    git push -u --force origin deploy
    git checkout @{-1}
}
