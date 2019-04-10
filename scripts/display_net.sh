#!/usr/bin/env bash

connectivity_file="$HOME/.connectivity-check"

# check for network connectivity
last_check=0

if [[ -r $connectivity_file ]]; then
	last_check=$( stat -f %m "$connectivity_file" 2> /dev/null )
fi

age=$(( $( date +%s ) - last_check ))

if [[ $age -gt 30 ]]; then
	network_name=$( /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --getinfo | grep -E '\bSSID:' | cut -d: -f2- | sed -E -e 's/^ (.+)/\1/' )
	if http https://www.google.co.uk > /dev/null 2> /dev/null; then
		if [[ $network_name == "iPhoan X Smax" || $network_name == "iPhoan X" ]]; then
			echo "#[bg=colour70,fg=colour255] ﰒ  " > "$connectivity_file"
		else
			echo "" > "$connectivity_file"
		fi
	else
		echo "#[bg=colour1,fg=colour255]   " > "$connectivity_file"
	fi
fi

cat "$connectivity_file"
