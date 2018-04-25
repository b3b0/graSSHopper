#!/bin/bash
mkdir /usr/share/grasshopper/ 2> /dev/null
cp * /usr/share/grasshopper
touch /usr/bin/grasshopper
printf "#!/bin/bash\nruby /usr/share/grasshopper/graSSHopper.rb" > /usr/bin/grasshopper
chmod 777 /usr/bin/grasshopper
rm /usr/share/grasshopper/install.sh
echo "Thanks bro"
