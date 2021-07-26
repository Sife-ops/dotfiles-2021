#            _ _
#       __ _| (_) __ _ ___ _ __ ___
#      / _` | | |/ _` / __| '__/ __|
#     | (_| | | | (_| \__ \ | | (__
#    (_)__,_|_|_|\__,_|___/_|  \___|

#^ Coreutils

case "$(uname)" in
    Linux) alias \
        cp="cp -iv" \
        diff="diff --color=auto" \
        grep="grep --color=auto" \
        less='less -i' \
        ll='ls -la --color=auto' \
        ls="ls -ahN --color=auto --group-directories-first" \
        mkdir="mkdir -pv" \
        mv="mv -iv" \
        rm="rm -vI" ;;
esac

#$

#^ Git

alias \
    cgs='clear && git status' \
    ga='git add' \
    gap='git add -p' \
    gau='git add -u' \
    gb='git branch -a' \
    gch='git checkout' \
    gcl='git checkout @{-1}' \
    gcm='git commit -m' \
    gdh='git diff HEAD | less' \
    gi="git status --porcelain | grep '^??' | cut -c4- >> .gitignore" \
    gl='git ls-tree -r master --name-only | less' \
    glu='git ls-files --others --exclude-standard | less' \
    glua='git ls-files --others | less' \
    gp='git push -u origin main' \
    grh='git reset --hard' \
    grl='git rev-list --pretty=oneline --abbrev-commit HEAD | less' \
    grm='git rm -r --cached' \
    gs='git status'

#$

#^ Systemd

alias \
    ju='journalctl -u' \
    jxe='journalctl -xe' \
    sd='sudo systemctl disable' \
    se='sudo systemctl enable' \
    sr='sudo systemctl restart' \
    ss='sudo systemctl start' \
    sst='sudo systemctl stop'

#$

#^ Tmux

alias \
	t="tmux -f ${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" \
	tmux="tmux -f ${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" \
    ta='tmux attach-session -t' \
    tbl='tmux list-buffers' \
    tbs='tmux set-buffer' \
    td='tmux attach-session -t default' \
    tg='tmux new-session -t' \
    tk='tmux kill-session -t' \
    tl='tmux list-sessions' \
    tn='tmux new-session -d -s' \
	tt="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/default.sh && \\
        tmux attach-session -t default"

#$

#^ Vim

command -v nvim >/dev/null \
    && alias vim="nvim" v="nvim" vimdiff="nvim -d" vd="nvim -d"  \
    || alias v="vim" vimdiff="vim -d" vd="vim -d"

#$

#^ Miscellaneous

alias \
    abook="abook -C ${XDG_CONFIG_HOME:-${HOME}/.config}/abook/abookrc \\
        --datafile ${XDG_DATA_HOME:-${HOME}/.local/share}/addressbook" \
    c='clear' \
    chx='chmod +x' \
    d='dragon-drag-and-drop' \
    dc='docker-compose' \
    f='lfcd' \
    fcl='fc-list : family style | less' \
    fvm='sudo fuser -vm' \
    gdb="gdb -nh -x ${XDG_CONFIG_HOME}/gdb/init" \
    irssi="irssi --config=${XDG_CONFIG_HOME:-${HOME}/.config}/irssi/config \\
        --home=${XDG_CONFIG_HOME:-${HOME}/.config}/irssi" \
    j='jobs -d' \
    k='kill' \
    ka="killall" \
    myip='dig +short myip.opendns.com @resolver1.opendns.com' \
    n='nnncd' \
    neomutt='cd ~/Downloads && neomutt' \
    nvmenable='source /usr/share/nvm/init-nvm.sh' \
    offlineimap="offlineimap -c \\
        ${XDG_CONFIG_HOME:-$HOME/.config}/offlineimap/offlineimaprc" \
    p="sudo pacman" \
    pg='pgrep' \
    pk='pkill' \
    r='rangercd' \
    sqlite3="sqlite3 -init ${XDG_CONFIG_HOME}/sqlite/sqliterc" \
    yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config" \
    vf='vifm' \
    z="zathura"

#$

#^ Package Management

[ -n "$NAME" ] && case $NAME in
    Arch*|Artix*)
        alias \
            install='sudo pacman -S' \
            search='pacman -Ss' \
            update='yay -Syu' ;;
    Debian*Raspbian*)
        alias \
            install='sudo apt install' \
            search='apt search' \
            update='sudo apt update && sudo apt upgrade' ;;
esac

#$

# vim: fdm=marker fmr=#^,#$
