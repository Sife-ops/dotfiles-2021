#              _
#      _______| |__   ___ _ ____   __
#     |_  / __| '_ \ / _ \ '_ \ \ / /
#    _ / /\__ \ | | |  __/ | | \ V /
#   (_)___|___/_| |_|\___|_| |_|\_/

#^#---- PATH -------------------------------------------------------------------
export PATH="${PATH}:${HOME}/.local/bin"
#$#

#^#---- DEFAULT PROGRAMS -------------------------------------------------------
command -v nvim >/dev/null 2>&1 \
	&& editor="nvim" \
	|| editor="vim"
export ALTEDITOR="code"
export EDITOR="$editor"
export FCEDIT="$editor"
export PAGER="less"
export VISUAL="$editor"
#$#

#^#---- OTHER ------------------------------------------------------------------
export HISTFILE="${HOME}/.local/share/history"
export HISTSIZE=1000000
export KEYTIMEOUT=1
export NVM_DIR="${HOME}/.nvm"
export SAVEHIST=900000
export ZDOTDIR="${HOME}/.config/zsh"
#$#

# vim: ft=sh fdm=marker fmr=#^#,#$#
