#!/usr/bin/env bash

if netstat -nr -f inet | grep gpd0 > /dev/null; then
	echo "#[bg=colour70,fg=colour254] VPN "
else
	echo "#[bg=colour214,fg=colour254] VPN "
fi

