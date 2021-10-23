#                            __ _ _
#       _____ __  _ __ ___  / _(_) | ___
#      |_  / '_ \| '__/ _ \| |_| | |/ _ \
#     _ / /| |_) | | | (_) |  _| | |  __/
#    (_)___| .__/|_|  \___/|_| |_|_|\___|
#          |_|

#^#---- EVERY RESTART ----------------------------------------------------------
oneShotFile="/tmp/zsh_oneshot_$(id -un)"
if [ ! -f "$oneShotFile" ]; then
    touch "$oneShotFile"

fi
#$#

#^#---- EVERY TIME A NEW USER LOGS IN ------------------------------------------
firstLoginFile="${XDG_CACHE_HOME}/zsh_firstlogin"
mkdir -p "$(dirname "$firstLoginFile")"
if [ ! -f "$firstLoginFile" ]; then
    touch "$firstLoginFile"

#---- CLIPBOARD ----------------------------------------------------------------
mkdir -p $CLIPBOARD
touch ${CLIPBOARD}/0{0,1,2,3,4}
chmod 700 $CLIPBOARD
chmod 600 ${CLIPBOARD}/*
#

fi
#$#

# vim: ft=sh fdm=marker fmr=#^#,#$#
