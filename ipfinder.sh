#!/usr/bin/bash

# A short script to find IP addresses of targets.
# https://github.com/xbforce

if [ -z "$1" ]; then
        echo "[*] Simple IP Finder script"
        echo "[*] Usage: $0 <domain list>"
        exit 0
fi

exit_code=$!

echo "[*] It may take some seconds to show the output."

for addr in $(cat $1);do
        host $addr | grep "has address" | cut -d" " -f1,4 &
done

wait $exit_code
echo "Done"
