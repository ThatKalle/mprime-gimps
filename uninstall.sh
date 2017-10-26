#!/bin/bash
set -uo pipefail
IFS=$'\n\t'

# Description:       Uninstall Mersenne mprime software as a daemon.

# Author: Kalle Lilja
#

# Stop Service
sudo /etc/init.d/mprimed stop
sudo killall mprime

# Remove Daemon
sudo rm /etc/init.d/mprimed
sudo rm -r /usr/sbin/mprime
sudo rm /var/log/mprime.log*
sudo rm /var/run/mprime.pid
sudo rm /etc/logrotate.d/mprimed
sudo rm /tmp/p95v293.linux64.tar.gz
sudo update-rc.d -f mprimed remove
sudo userdel mprime
