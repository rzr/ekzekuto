#!/bin/sh
set -x

log_()
{
    echo "log: $@"
    $@
    echo ""
}

main_()
{
    echo "# ${PKG_NAME}: { starting"
    log_ date
    log_ cat /proc/version
    log_ cat /proc/uptime
    log_ df -h
    log_ /sbin/ifconfig
    file="/opt/usr/media/Others/runme.sh"
    [ ! -x "$file" ] || log_ "$file"
    echo "# ${PKG_NAME}: } stopping"
}

main_

