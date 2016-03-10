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
    echo "# ${PKG_NAME}: } stopping"
}

main_

