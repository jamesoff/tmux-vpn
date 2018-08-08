#!/usr/bin/env bash

# check for network connectivity
last_check=0

if [[ -r connectivity-check ]]; then
	last_check=$( stat -f %m connectivity-check 2> /dev/null )
fi

age=$(( $( date +%s ) - last_check ))

if [[ $age -gt 30 ]]; then
	touch connectivity-check
	if ping -c 1 -t 2 www.amazon.com > /dev/null 2> /dev/null; then
		echo ""
	else
		echo "#[bg=colour1,fg=colour255] NET "
	fi
fi
