#!/usr/bin/env bash

# Check if we're on the corp wifi
network_name=$( /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport --getinfo | grep -E '\bSSID:' | cut -d: -f2- | sed -E -e 's/^ (.+)/\1/' )

if [[ $network_name == "extended-stay" ]]; then
	echo "#[bg=color0,fg=color75] WiFi "
else
	if netstat -nr -f inet | grep gpd0 > /dev/null; then
		echo "#[bg=colour70,fg=colour255] VPN "
	elif netstat -nr -f inet | grep tun4 > /dev/null; then
		echo "#[bg=colour53,fg=colour255] VPN "
	else
		echo "#[bg=colour214,fg=colour240] VPN "
	fi
fi
