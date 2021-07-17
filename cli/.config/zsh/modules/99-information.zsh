echo '            _________  _   _
__  ___   _|__  / ___|| | | |
\ \/ / | | | / /\___ \| |_| |
 >  <| |_| |/ /_ ___) |  _  |
/_/\_\\__,  /____|____/|_| |_|
      |___/'

#^ Hostname
printf "Hostname:%71s\n" $(hostname)
#$

#^ Global IP
if [ -f "${XDG_CACHE_HOME}/xyzsh_ip" ]; then
    local global_ip=$(cat "${XDG_CACHE_HOME}/xyzsh_ip")
else
    local global_ip=$(dig +short myip.opendns.com @resolver1.opendns.com 2>/dev/null)
    [ "$global_ip" = "" ] ||
        printf "%s" "$global_ip" > "${XDG_CACHE_HOME}/xyzsh_ip"
fi
printf "Global IP:%70s\n" "${global_ip:-"missing dig"}"
#$

# cpu

# yada yada

# vim: fdm=marker fmr=#^,#$
