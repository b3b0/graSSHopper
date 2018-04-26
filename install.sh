#!/bin/bash
mkdir /usr/share/grasshopper/ 2> /dev/null
cp * /usr/share/grasshopper
touch /usr/bin/grasshopper
cp grasshopper /usr/bin/grasshopper
chmod 777 /usr/bin/grasshopper
chmod 777 /usr/share/grasshopper
rm /usr/share/grasshopper/install.sh
echo "Thanks bro"
