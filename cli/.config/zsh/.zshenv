#              _
#      _______| |__   ___ _ ____   __
#     |_  / __| '_ \ / _ \ '_ \ \ / /
#    _ / /\__ \ | | |  __/ | | \ V /
#   (_)___|___/_| |_|\___|_| |_|\_/

#^#---- PATH -------------------------------------------------------------------
export PATH="${PATH}:${HOME}/.local/bin"
#$#

#^#---- DEFAULT PROGRAMS -------------------------------------------------------
# export TERMEXEC="st -e"
# export TERMINAL="st"
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
# export INPUTRC="${XDG_CONFIG_HOME}/inputrc"
# export LESSHISTFILE="-"
# export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
# export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
# export WGETRC="${XDG_CONFIG_HOME}/wget/wgetrc"
export HISTFILE="${HOME}/.local/share/history"
export HISTSIZE=1000000
export KEYTIMEOUT=1
export NVM_DIR="${HOME}/.nvm"
export SAVEHIST=900000
export ZDOTDIR="${HOME}/.config/zsh"
#$#

# vim: ft=sh fdm=marker fmr=#^#,#$#
