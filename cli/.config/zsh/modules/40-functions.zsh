  # __                  _   _
 # / _|_   _ _ __   ___| |_(_) ___  _ __  ___
# | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
# |  _| |_| | | | | (__| |_| | (_) | | | \__ \
# |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/

#^ Special

chpwd () { #^
    emulate -L zsh

    # Auto ls
    if which lsd 1>/dev/null 2>&1; then
        lsd -a
    else
        case "$(uname)" in
            Linux) ls -ahN --color=auto --group-directories-first ;;
            *) ls ;;
        esac
    fi

    # Use zshconfig.zsh
    [ -e "./zshconfig.zsh" ] && source "./zshconfig.zsh"

} #$

preexec () { #^

    # Use beam shape cursor on startup and for each new prompt.
    echo -ne '\e[5 q'

} #$

#$

#^ Widgets

_zsh_bookmarks="${XDG_DATA_HOME}/lf/marks"

_zsh_bookmark_add () { #^
    # Add bookmark
    emulate -L zsh

    local _tmp=$(mktemp)
    sed "1i :${PWD}" ~/.local/share/lf/marks > "$_tmp"
    $VISUAL "$_tmp"
    cp "$_tmp" ~/.local/share/lf/marks
    rm "$_tmp"
    unset _tmp
    zle .accept-line
}
zle -N _zsh_bookmark_add #$

_zsh_bookmarks () { #^
    # Navigate to bookmark.
    emulate -L zsh

    local _color1="\033[1;33m"
    local _color2="\033[1;34m"
    local _color3="\033[1;32m"
    local _color4="\033[1;37m"

    local _marks=""
    local _letters=""

    local _chosen

    while true; do
        local _matches=0

        clear
        printf "%bmark\tpath\n" "$_color1"
        while IFS=":" read _mark _path; do
            case "$_mark" in
                "$_letters"*)
                    _matches=$(( $_matches + 1 ))
                    _chosen="$_path"

                    printf "%b%s\t%b%s\n" \
                        "$_color2" "$_mark" "$_color3" "$_path"
                    ;;
            esac
        done < "$_zsh_bookmarks"

        if [ $_matches -gt 1 ]; then
            :
        elif [ $_matches -eq 1 ]; then
            _chosen=$(eval "echo $_chosen")

            clear
            if [ -d $(readlink -f "$_chosen") ]; then
                cd "$_chosen"
            else
                ${VISUAL:-nano} "$_chosen"
            fi
            break
        else
            clear
            break
        fi

        printf "%bMark: %s" "$_color4" "$_letters"
        read -k 1 _letter
        _letters="${_letters}${_letter}"

    done

    zle .accept-line
}
zle -N _zsh_bookmarks #$

_copybuffer () { #^
    # Copy the active line from the command line buffer onto the system
    # clipboard.
    emulate -L zsh
    printf "%s" "$BUFFER" | xclip -selection clipboard
}
zle -N _copybuffer #$

zle-keymap-select () { #^
    # Change cursor shape for different vi modes.
    if [[ ${KEYMAP} == vicmd ]] ||
        [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} = '' ]] ||
        [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select #$

zle-line-init () { #^
    # Initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init #$

#$

#^ Docker

dka(){ #^
    docker container kill $(docker ps -q)
    docker rm $(docker ps -a -f status=exited -q)
} #$

#$

#^ Git

gcd(){ #^
    git branch -D deploy
    git checkout -b deploy
} #$

gct(){ #^
    git branch -D test 2>/dev/null
    git checkout -b test
} #$

#$

#^ Misc.

# cheat () { #^
# # Wrapper for cht.sh.
# emulate -L zsh
# curl cht.sh/$1
# } #$

copydir () { #^
    # Copies the pathname of the current directory to the system or X Windows
    # clipboard.
    emulate -L zsh
    print -n $PWD | xclip -selection clipboard
} #$

copyfile () { #^
    # Copies the contents of a given file to the system or X Windows clipboard.
    emulate -L zsh
    cat $1 | xclip -selection clipboard
} #$

demonize () { #^
    # node convenience function
    while inotifywait --quiet "./$1"; do
        clear
        ${2:-node} "./$1"
    done
} #$

emacs () { #^
    # Emacs shortcut.
    emulate -L zsh
    if pgrep -x emacs ; then
        [ -n "$1" ] && emacsclient -nw "$1" \
                    || emacsclient -nw
    else
        [ -n "$1" ] && command emacs --daemon && emacsclient -nw "$1" \
                    || command emacs --daemon && emacsclient -nw
    fi
} #$

ex () { #^
    # Extracts archives.
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2|*.tbz2) tar xvjf "$1" ;;
            *.tar.xz) tar -xf "$1" ;;
            *.tar.gz|*.tgz) tar xvzf "$1" ;;
            *.lzma) unlzma "$1" ;;
            *.bz2) bunzip2 "$1" ;;
            *.rar) unrar x -ad "$1" ;;
            *.gz) gunzip "$1" ;;
            *.tar) tar xvf "$1" ;;
            *.zip) unzip "$1" ;;
            *.Z) uncompress "$1" ;;
            *.7z) 7z x "$1" ;;
            *.xz) unxz "$1" ;;
            *.exe) cabextract "$1" ;;
            *) printf "extract: '%s' - unknown archive method\\n" "$1" ;;
        esac
    else
        printf "File \"%s\" not found.\\n" "$1"
    fi
} #$

ggf () { #^
    # Wrapper for git.
    git commit -p && git push origin "$(git rev-parse --abbrev-ref HEAD)"
} #$

isfunction () { #^
    # test whether function is defined
    if type $1 | grep -q 'is a shell function' 2>/dev/null; then
        true
    else
        false
    fi
} #$

lfcd () { #^
    # Configure lf to cd on quit
    emulate -L zsh
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
                print -s "cd $dir"
            fi
        fi
    fi
} #$

pdf () { #^
    # pdftotext shortcut
    text="$(mktemp /tmp/pdftotext.XXX)"
    pdftotext "$1" "$text"
    less "$text"
} #$

rangercd () { #^
    temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
} #$

rsupdate () { #^
    # Wrapper for rsync.
    emulate -L zsh
    rsync -av --update \
        ${3:+--delete} \
        $(id -un)@$2:"$(readlink -f "$1")" \
        "$(dirname "$(readlink "$1")")/"
} #$

#$

# vim: ft=sh fdm=marker fmr=#^,#$
