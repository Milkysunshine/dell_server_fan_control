# dell_server_fan_control
Simple scripts to get the highest CPU temperature from lm-sensors, and set the fan speed according to user settings via ipmitool.


Ensure IPMI is enabled in iDRAC settings.

apt install lm-sensors ipmitool

Copy fan control scripts to /root/ and make executable (chmod +x)

Edit variables in both .sh files.

Copy .service file to /etc/systemd/system/

run " systemctl enable dell_ipmi_fan_control.service "
run " systemctl start dell_ipmi_fan_control.service "

if you make changes to the scripts, run " systemctl daemon-reload ", then systemctl restart dell_ipmi_fan_control.service "
