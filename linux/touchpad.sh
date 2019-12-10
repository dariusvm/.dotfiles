#!/bin/bash
VENDOR=$(cat /sys/class/dmi/id/sys_vendor)
if [ "$VENDOR" = "Dell Inc." ]; then
    xinput set-prop 11 276 1
    xinput set-prop 12 276 1
    xinput set-prop 13 276 1
    xinput set-prop 15 294 1
elif [ "$VENDOR" = "LENOVO" ]; then
    xinput set-prop 15 292 1
else
    echo "Unknown sys vendor ($VENDOR): skipping touchpad setup"
fi
