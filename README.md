# Stuff for Making healthchecks.io Run Local

I set [healthchecks.io](https://github.com/healthchecks/healthchecks) up on running locally on one of my Raspberry Pi's for monitoring. 

It was fairly easy, but I needed to get some setup stuff done to get it working. This was all used on Ubuntu 16.04, the service stuff is for systemd.

My install was based on the instructions from the healtchecks.io [github repo](https://github.com/healthchecks/healthchecks) except that I did not use a virtualenv. I installed everything in /opt/healthchecks and that's how I made these files for. Adjust the install location as you need.

## systemd

 * systemd/hc-server.service
 * systemd/hc-sendalerts.service

These two files let me start the healthchecks server and alertsender as services with systemd.

 * Copy the files to /lib/systemd/system/
 * systemctl daemon-reload
 * systemctl enable hc-server.service
 * systemctl enable hc-sendalerts.service
 * systemctl start hc-server.service
 * systemctl start hc-sendalerts.service

## nginx

 *nginx/default

healthchecks doesn't seem to want to listen to anything but localhost (or atleast from what I found). The is just a simple reverse-proxy configuration file.

## maintenance

 * bin/hc-maint.sh 

healthchecks needs some periodic maintenance. This is a script that does everything except the email pruning since I am running locally. I just cron this to run every hour.
