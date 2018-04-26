![alt text](https://i.imgur.com/w79Na6o.png "graSSHopper")
# PURPOSE
To automate administative tasks, operational auditing, and hacking.

# INSTRUCTION
1. `cd graSSHopper-master`
2. `sudo bash install.sh`
3. Configure your `/usr/share/grasshopper/commands.cfg` and `/usr/share/grasshopper/servers.cfg` files appropriately 
### EXAMPLE COMMANDS.CFG FILE
```
df -h && uptime
```
### EXAMPLE SERVERS.CFG FILE
```
10.0.0.254, john, 22
myawesomeserver, admin, 22
```
4. Run the program with `grasshopper` or use `grasshopper -a` for crontab. 
5. Run through the ssh-keygen setup
6. You're golden ponyboy

# OTHER
- Plan to add quick way to edit commands.cfg and servers.cfg within the program.
- Contribute, break, fix or shame the project. It's cool man.

# LICENSE
```
                              ---graSSHopper---
                   (https://github.com/b3b0/graSSHopper)

Copyright (C) 2018 Dustin Davis (b3b0)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
```
