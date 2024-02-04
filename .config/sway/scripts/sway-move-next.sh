#!/bin/bash
if [ -z "$2" ]; then
	WMM="swaymsg"
else 
	case "$1" in
		"sway")
			WMM="swaymsg"
			;;

		"i3")
			WMM="i3-msg"
			;;
	esac 
fi

wsNext=$(( $( "$WMM" -t get_workspaces | jq '.[] | select(.focused).num' ) + $1))
"$WMM" move container to workspace number $wsNext
"$WMM" workspace number $wsNext
