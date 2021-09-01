#              _
#      _______| |__   ___ _ ____   __
#     |_  / __| '_ \ / _ \ '_ \ \ / /
#    _ / /\__ \ | | |  __/ | | \ V /
#   (_)___|___/_| |_|\___|_| |_|\_/

#^#---- XDG --------------------------------------------------------------------
# export XDG_CONFIG_HOME="${HOME}/.config"
# export XDG_DATA_HOME="${HOME}/.local/share"
# export XDG_CACHE_HOME="${HOME}/.cache"
#$#

#^#---- PATH -------------------------------------------------------------------
# export PATH="${PATH}:${HOME}/.local/bin"
# export PATH="${PATH}:${XDG_DATA_HOME}/npm/bin"
# export PATH="${PATH}:${XDG_CONFIG_HOME}/emacs/bin"
#$#

#^#---- DEFAULT PROGRAMS -------------------------------------------------------
# command -v nvim >/dev/null 2>&1 \
# 	&& editor="nvim" \
# 	|| editor="vim"
# export ALTEDITOR="code"
# export BROWSER="${BROWSER:-lynx}"
# export EDITOR="$editor"
# export FCEDIT="$editor"
# export PAGER="less"
# export READER="zathura"
# export TERMEXEC="st -e"
# export TERMINAL="st"
# export VISUAL="$editor"
#$#

#^#---- OTHER ------------------------------------------------------------------
# export HISTFILE="${XDG_DATA_HOME}/history"
# export INPUTRC="${XDG_CONFIG_HOME}/inputrc"
# export LESSHISTFILE="-"
# export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
# export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
# export WGETRC="${XDG_CONFIG_HOME}/wget/wgetrc"
export HISTSIZE=1000000
export NVM_DIR="${HOME}/nvm"
export SAVEHIST=900000
export ZDOTDIR="${HOME}/.config/zsh"
#$#

# vim: ft=sh fdm=marker fmr=#^#,#$#
