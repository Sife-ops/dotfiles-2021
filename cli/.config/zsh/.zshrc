#              _              
#      _______| |__  _ __ ___ 
#     |_  / __| '_ \| '__/ __|
#    _ / /\__ \ | | | | | (__ 
#   (_)___|___/_| |_|_|  \___|
                          
#---- INSTRUCTIONS -------------------------------------------------------------

# To enable modules, create links from modules/ to conf.d/ like this:
# $ cd ~/.config/zsh/conf.d
# $ ln -sf ../modules/options.zsh ./00-options.zsh

#^---- SETUP -------------------------------------------------------------------

# default values
zshplugins="/usr/share/zsh/plugins"
fzfplugins="/usr/share/fzf"

if [ -f /etc/os-release ]; then
    # Linux only!
    while IFS= read -r line; do
        eval "$line"
    done < /etc/os-release

    case $NAME in
        Ubuntu*|Debian*|Raspbian*)
            zshplugins="/usr/share"
            fzfplugins="/usr/share/doc/fzf/examples" ;;
    esac
else
    # BSD only!
    case $(uname) in
        OpenBSD)
            zshplugins="/usr/local/share"
            fzfplugins="/usr/local/share/fzf/zsh" ;;
        Darwin)
            zshplugins="/usr/local/opt"
            fzfplugins="/usr/local/opt/fzf/shell" ;;
    esac
fi

# source plugins
for file in $(find ${ZDOTDIR}/conf.d/*)
do
    source $file
done

# clean up
if [ -f /etc/os-release ]; then
    while IFS= read -r line; do
        eval "unset ${line%%=*}"
    done < /etc/os-release
fi

# vim: fdm=marker fmr=#^,#$
