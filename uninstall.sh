#!/bin/bash
set -uo pipefail
IFS=$'\n\t'

# Description:       Uninstall Mersenne mprime software.

# Author: Kalle Lilja
#

# Stop service
sudo /etc/init.d/mprimed stop
sudo killall mprime

# Remove daemon
sudo rm /etc/init.d/mprimed
sudo rm /var/run/mprime.pid
sudo rm -r /usr/sbin/mprime
sudo update-rc.d -f mprimed remove
# Remove logging
sudo rm /var/log/mprime.log*
sudo rm /etc/logrotate.d/mprimed
# Remove tmp setup
sudo rm /tmp/p95v293.linux64.tar.gz
# Remove user
sudo userdel mprime
