#!/bin/sh

log_()
{
    echo "log: $@"
    "$@"
    echo ""
}

demo_()
{
    set -x
    log_ date -u
    log_ cat /etc/os-release
    log_ cat /proc/version
    log_ /sbin/ifconfig -a | grep addr
    log_ cat /proc/uptime
    log_ df -h
    log_ date
}

main_()
{
    echo "#{ starting: ${PKG_NAME}"
    dir="/home/developer/apps/${PKG_NAME}/"
    file="${dir}/runme.sh"
    if [ -x "$file" ] ; then
        log_ "$file"
    else 
        dir="/opt/usr/media/Others/apps/${PKG_NAME}/"
        file="${dir}/runme.sh"
        if [ -x "$file" ] ; then
            log_ "$file"
        else
            demo_ "$@"
        fi
    fi
    echo "#} stopping: ${PKG_NAME}"
}

main_ "$@"
