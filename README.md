![alt text](https://i.imgur.com/w79Na6o.png "graSSHopper")

# RELEASES
## VERSION 1.1
### It's recommended that you remove previous versions of graSSHopper before installing the latest
- Debian/Ubuntu/Mint: [DEB](https://github.com/b3b0/graSSHopper/releases/download/v1.1-1/grasshopper-1.1-1.noarch.deb)
- Fedora/CentOS/RedHat: [RPM](https://github.com/b3b0/graSSHopper/releases/download/v1.1-1/grasshopper-1.1-1.noarch.rpm)
- Mac OSX/*BSD/All other distros: [Source](https://github.com/b3b0/graSSHopper/archive/v1.1-1.zip)

# PURPOSE
To automate administative tasks, operational auditing, and hacking.

# DEPENDENCIES
- Unix-based OS
- Ruby
- Python
- SSH client
- sudo

# INSTRUCTIONS
1. If using source, `cd graSSHopper-master`
2. Also if using source, `sudo bash install.sh`
3. Configure your `/usr/share/grasshopper/commands.cfg` and `/usr/share/grasshopper/servers.cfg` files appropriately with `grasshopper -c` and `grasshopper -s`
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
5. Get extra help with `grasshopper -h` or `man grasshopper`
7. Run through the ssh-keygen setup
7. You're golden ponyboy
# USAGE
```
$ grasshopper -h

GRASSHOPPER                                                                                       

NAME
    grasshopper - run commands against multiple servers.

SYNOPSIS
    grasshopper [OPTION]

DESCRIPTION
    Run commands against multiple serves with user input or as a crontab job.

USAGE:
    - h: Display this menu
    - a: automatic, runs commands in commands.cfg against servers in servers.cfg
    - c: Edit commands.cfg
    - s: Edit servers.cfg

```
# THE FUTURE
Planned features and improvements:
- Multiple profiles of configurations
- Email integration
- Output cleanup
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
