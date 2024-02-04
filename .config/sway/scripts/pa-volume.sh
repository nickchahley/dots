#!/bin/bash
get_pa_vol() {
	SINK=$( pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1 )
	VOLUME=$( pactl list sinks | grep '^[[:space:]]Volume:' | \
		head -n $(( $SINK + 1 )) | tail -n 1 | \
		sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )

	description=$( pactl list sinks | grep '^[[:space:]]Description:' | \
		head -n $(( $SINK + 1 )) | tail -n 1 | \
		sed -e 's,Description: \(.*\),\1,' )

	name=$( pactl list sinks | grep '^[[:space:]]Name: ' | \
		head -n $(( $SINK + 1 )) | tail -n 1 )
	if grep -q "blue" <<< "$name" ; then
		bluetooth_extra="$description"
	fi


	mute=$( pactl list sinks | grep '^[[:space:]]Mute: ' | \
		head -n $(( $SINK + 1 )) | tail -n 1 )
	if grep -q "yes" <<< "$mute" ; then
		icon="🔇"
	else 
		icon="LOUD"
	fi

	vol_string="$bluetooth_extra $icon $VOLUME%"
}
get_pa_vol
echo $vol_string

