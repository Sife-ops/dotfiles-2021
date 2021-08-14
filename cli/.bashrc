set -o vi

. /usr/share/fzf/completion.bash
. /usr/share/fzf/key-bindings.bash

ggf () { #^
    # Wrapper for git.
    git commit -p && git push origin "$(git rev-parse --abbrev-ref HEAD)"
} #$

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

. ./.config/zsh/modules/60-aliasrc.zsh

sed 's/Arch/Gentoo/' <(neofetch --ascii_distro gentoo)

eval "$(starship init bash)"
