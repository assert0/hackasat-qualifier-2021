#!/bin/bash


if [[ -z "${TIMEOUT}" ]]; then
	MY_TIMEOUT=35
else
	MY_TIMEOUT="${TIMEOUT}"
fi

# Remove this after debugging and pipe stderr to /dev/null
#exec 2>/dev/null

timeout -k1 ${MY_TIMEOUT} stdbuf -i0 -o0 -e0 python challenge.py
