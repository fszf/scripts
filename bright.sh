#!/bin/sh
# display brightness script
# author: lswest

usage="usage: $0 -c {up|down}"
command=
increment=1%

while getopts h o
do case "$o" in
    h) echo "$usage"; exit 0;;
    ?) echo "$usage"; exit 0;;
esac
done

shift $(($OPTIND - 1))
command=$1

if [ "$command" = "" ]; then
    echo "usage: $0 {up|down}"
    exit 0;
fi

display_brightness=0

if [ "$command" = "up" ]; then
    $(light -A $increment)
    display_brightness=$(light|cut --delimiter="." -f 1)
fi

if [ "$command" = "down" ]; then
    $(light -U $increment)
    display_brightness=$(light|cut --delimiter="." -f 1)
fi

icon_name=""

if [ "$icon_name" = "" ]; then
    if [ "$display_brightness" = "0" ]; then
        icon_name="notification-display-brightness-off"
    else
        if [ "$display_brightness" -lt "33" ]; then
            icon_name="notification-display-brightness-low"
        else
            if [ "$display_brightness" -lt "67" ]; then
                icon_name="notification-display-brightness-medium"
            else
                if [ "$display_brightness" -lt "100" ]; then
                     icon_name="notification-display-brightness-high"
                else
                     icon_name="notification-display-brightness-full"
                fi
            fi
        fi
    fi
fi
dunstify " " -i $icon_name -h int:value:$display_brightness -h string:synchronous:brightness
