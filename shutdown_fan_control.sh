#!/bin/bash

# A simple bash script that returns default Dell fan control on iDRAC based systems.
#
# Copyright (C) 2022  Milkysunshine
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#         
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.{{ project }}
#        




#-----USER DEFINED VARIABLES-----
# iDRAC
IDRAC_IP="192.168.0.20"
IDRAC_USER="root"
IDRAC_PASSWORD="calvin"
# Log file location
LOG_FILE=/var/log/fan_control.log
#-----END USER DEFINED VARIABLES-----


# Get system date & time.
DATE=$(date +%d-%m-%Y\ %H:%M:%S)
# Update Log
echo "Date $DATE --- Exiting Dell IPMI fan control service...">> $LOG_FILE
# Go back do Dell Control
/usr/bin/ipmitool -I lanplus -H $IDRAC_IP -U $IDRAC_USER -P $IDRAC_PASSWORD raw 0x30 0x30 0x01 0x01 >> $LOG_FILE
