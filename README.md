# PURPOSE
To automate administative tasks, operational auditing, and hacking.

# INSTRUCTION
1. maintain currnet file structure - these files always need to be in the same directory.
2. Configure your `commands.cfg` and `servers.cfg` file appropriately. 
### EXAMPLE COMMANDS.CFG FILE
```
hostname && uptime
```
### EXAMPLE SERVERS.CFG FILE
```
10.0.0.254, john
myawesomeserver, admin
```
3. Run the file with `ruby graSSHopper.rb`
4. Run through the ssh-keygen setup
5. You're golden ponyboy

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