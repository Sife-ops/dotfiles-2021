#                            __ _ _
#       _____ __  _ __ ___  / _(_) | ___
#      |_  / '_ \| '__/ _ \| |_| | |/ _ \
#     _ / /| |_) | | | (_) |  _| | |  __/
#    (_)___| .__/|_|  \___/|_| |_|_|\___|
#          |_|

#---- EVERY LOGIN --------------------------------------------------------------

#---- EVERY RESTART ------------------------------------------------------------
oneShotFile="/tmp/zsh_oneshot_$(id -un)"
if [ ! -f "$oneShotFile" ]; then
    touch "$oneShotFile"

##^#---- VCONSOLE ---------------------------------------------------------------

#case "$(uname)" in
#    Linux) sudo -n loadkeys "${XDG_CONFIG_HOME}/kmap/$(cat /etc/hostname)" 2>/dev/null
#esac

fi
##$#

#---- EVERY TIME A NEW USER LOGS IN --------------------------------------------
firstLoginFile="${XDG_CACHE_HOME}/zsh_firstlogin"
mkdir -p "$(dirname "$firstLoginFile")"
if [ ! -f "$firstLoginFile" ]; then
    touch "$firstLoginFile"

#^#---- CLIPBOARD --------------------------------------------------------------
mkdir -p $CLIPBOARD
touch ${CLIPBOARD}/0{0,1,2,3,4}
chmod 700 $CLIPBOARD
chmod 600 ${CLIPBOARD}/*
#$#

#^#---- MISCELLANEOUS ----------------------------------------------------------

# set non-retarded timeout length of 30 seconds for systemd

# sudo sed -i -E '/DefaultTimeout.*Sec/ s/(^#)(.*)(90)(.*)/\230\4/' \
#     /etc/systemd/system.conf

# enable pacman colors

grep 'ILoveCandy' /etc/pacman.conf ||
    sudo sed -i '/^# Misc options/a Color\nILoveCandy\nParallelDownloads = 16' /etc/pacman.conf

fi
##$#

# vim: ft=sh fdm=marker fmr=#^#,#$#
