#!/bin/bash
mkdir /usr/share/grasshopper/ 2> /dev/null
cp * /usr/share/grasshopper
touch /usr/bin/grasshopper
cp grasshopper /usr/bin/grasshopper
chmod 777 /usr/bin/grasshopper
chmod -R 777 /usr/share/grasshopper
cp grasshopper.8.gz /usr/share/man/man8/
rm /usr/share/grasshopper/install.sh
echo "Thanks bro"
