# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# Produces "21 days", for example
uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
# date_formatted=$(date "+%a %F %H:%M")
date_formatted=$(date "+%a %d %b %Hh%M")

# Audio Volume
# 🔊 🔈 🔇 
pa_sink() {
	echo $( pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1 )
}
sink_vol() {
	echo $( pactl list sinks | grep '^[[:space:]]Volume:' | \
		head -n $(( $1 + 1 )) | tail -n 1 | \
		sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )
}
sink_is_mute() {
	echo $( pactl list sinks | \
		grep '^[[:space:]]Mute: ' | \
		head -n $(( $1 + 1 )) | tail -n 1 )
}
pa_vol_string() {
	SINK=$( pa_sink )
	VOLUME=$( sink_vol $SINK )

	description=$( pactl list sinks | grep '^[[:space:]]Description:' | \
		head -n $(( $SINK + 1 )) | tail -n 1 | \
		sed -e 's,Description: \(.*\),\1,' )

	name=$( pactl list sinks | grep '^[[:space:]]Name: ' | \
		head -n $(( $SINK + 1 )) | tail -n 1 )
	if [[ "$name" == *"blue"* ]]; then
		bluetooth_extra="$description "
	fi

	mute=$( sink_is_mute )
	if [[ "$mute" == *"yes"* ]]; then
		icon="🔇 "
	elif [[ "$mute" == *"no"* ]]; then 
		icon="LOUD "
	fi

	vol_string="$bluetooth_extra$icon$VOLUME%"
	echo "$vol_string"
}

# Rewriting audio volume module
# get default pulseaudio sink (ex bluez_.., alsa_..)
pa_sink2() {
	echo $( pacmd list-sinks | awk '/\*/ {getline; print $2}' | sed 's/[<>]//g' )
}
# WIP for determining bluetooth vs speakers (vs headphones (?))
# need to trim off 
pa_sink_name() {
	DESCRIPTION=$(pactl list sinks | sed -n -e "/\sName: $(pa_sink2)/,/^[\s]]*$/ p" | sed -n "/Description:/ p" | sed s'/Description:\s//')
	NAME=$(pactl list sinks | sed -n -e "/\sName: $(pa_sink2)/,/^[\s]]*$/ p" | sed -n -e '/Name:/ p' | awk '{print $2}')
	output=""
	if [[ "$NAME" == *"blue"* ]] ; then
		output="$DESRCIPTION"
	elif [[ "$NAME" == *"analog"* ]] ; then
		output="$DESRCIPTION"
	fi
	echo "$output"
}
# return the info for only the sink passed as arg 1 (or active sink)
pa_sink_vol2(){
	echo $(pactl list sinks | sed -n -e "/\sName: $(pa_sink2)/,/^[\s]]*$/ p" | sed -n -e "/Volume:/ p" | sed -n -e '/Base/ !p' | awk '{print $5}')
}
pa_is_mute_2(){
	echo $(pactl list sinks | sed -n -e "/\sName: $(pa_sink2)/,/^[\s]]*$/ p" | sed -n -e "/Mute:/ p" | awk '{print $2}' )
}
pa_mute_icon(){
	STATUS=$(pa_is_mute_2)
	if test "$STATUS" = "yes" ; then
		icon="🔇 "
	elif test "$STATUS" = "no" ; then
		icon="LOUD "
	else
		icon=" "
	fi
	echo $icon
}

pa_vol_string2() {
	echo $(pa_sink_name) $(pa_mute_icon) $(pa_sink_vol2)
}


# if grep -q "blue" <<< "$name" ; then
# if grep -q "yes" <<< "$mute" ; then

# "upower --enumerate | grep 'BAT'" gets the battery name (e.g.,
# "/org/freedesktop/UPower/devices/battery_BAT0") from all power devices.
# "upower --show-info" prints battery information from which we get
# the state (such as "charging" or "fully-charged") and the battery's
# charge percentage. With awk, we cut away the column containing
# identifiers. i3 and sway convert the newline between battery state and
# the charge percentage automatically to a space, producing a result like
# "charging 59%" or "fully-charged 100%".
# battery_info=$(upower --show-info $(upower --enumerate |\
# grep 'BAT') |\
# egrep "percentage" |\
# awk '{print $2}')

battery_percent=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "percentage" | awk '{print $2}')

battery_number=$(echo $battery_percent | awk '{print substr($0, 1, length($0)-1)}')

# █ ▇ ▆ ▅ ▄ ▃ ▂ ▁
set_battery_icon() {
	if [ "$battery_number" -gt 87 ]; then
		battery_icon="█"
	elif [ "$battery_number" -gt 75 ]; then
		battery_icon="▇"
	elif [ "$battery_number" -gt 62 ]; then
		battery_icon="▆"
	elif [ "$battery_number" -gt 50 ]; then
		battery_icon="▅"
	elif [ "$battery_number" -gt 37 ]; then
		battery_icon="▄"
	elif [ "$battery_number" -gt 25 ]; then
		battery_icon="▃"
	elif [ "$battery_number" -gt 12 ]; then
		battery_icon="▂"
	elif [ "$battery_number" -lt 12 ]; then
		battery_icon="▁"
	fi
}
set_battery_icon

# set_battery_status() {
# 	# Returns the battery status: "Full", "Discharging", or "Charging".
# 	STATUS=$(cat /sys/class/power_supply/BAT0/status)
#
# 	if [[ "$STATUS" == "*Charging*" ]]; then
# 		battery_icon=" ↑"
# 	fi
# }
# set_battery_status

# Network
network=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')
# interface_easyname grabs the "old" interface name before systemd renamed it
interface_easyname=$(dmesg | grep $network | grep renamed | awk 'NF>1{print $NF}')
ping=$(ping -c 1 www.google.es | tail -1| awk '{print $4}' | cut -d '/' -f 2 | cut -d '.' -f 1)

if ! [ $network ]
then
   network_active="⛔"
else
   network_active="⇆"
fi

echo " $network_active $ping ms | $( pa_vol_string2 ) |$battery_status $battery_icon $battery_percent | $date_formatted "
