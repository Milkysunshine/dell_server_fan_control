# dell_server_fan_control
Simple linux bash scripts to get the highest CPU temperature from lm-sensors, and set the fan speed according to user settings via ipmitool.

Disclaimer: I am not responsible for what this does to your hardware. It is entirely your responsibility to monitor what is going on with your hardware. Use at your own risk.

I made this to run on my proxmox server, which runs Debian. YMMV. My used Poweredge R730xd came with a bad motherboard. After replacing with a used motherboard from eBay, I found that board would not increase the fan speed when cpu temps were hight. It could hit thermal throttle with no increase in fan speed. 

Instead of setting the fans to a constant speed (creating too much noise, and increasing power draw for no reason), I wrote this script that figures out what percentage the fans should be based on CPU temps and user settings. 

I've seen other scripts out there, and while they do work, many send unnecessary commands, have limited ranges for fan speed, don't have hystoresis, or were simply not designed to control a system's fan speeds entirely.

With the main fan control script, simply set the MIN_TEMP to where the fan speed should be 0%. Set MAX_TEMP where the fan should be 100% and FAN_MIN to the bare minimum fan speed if you would like them not to go below a certain PWM percentage. Set the hysteresis options, other described variables and follow below.

If you set the FAN_MIN to 15, and set MIN_TEMP to 40, fan speeds will stay at 15 until the calculated fan speed exceeds 15%. This means you won't see an increase in fan speeds until somewhere above 4x or 5x degrees depending on all 3 variables. You may have to play around with values to find the ranges you are looking for.

Installation:

Ensure IPMI is enabled in iDRAC settings.

run " apt update; apt install lm-sensors ipmitool "

Copy fan control scripts to /root/ and make executable (chmod +x) If you change the location, the paths must be edited in dell_ipmi_fan_control.service

Edit variables in both .sh files.

Copy dell_ipmi_fan_control.service file to /etc/systemd/system/

run " systemctl enable dell_ipmi_fan_control.service "
run " systemctl start dell_ipmi_fan_control.service "

if you make changes to the scripts or service file, run " systemctl daemon-reload ", then systemctl restart dell_ipmi_fan_control.service "
