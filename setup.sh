#!/bin/bash
set -uo pipefail
IFS=$'\n\t'

# Description:       Deploy Mersenne mprime software as a daemon.
#                    New user account created: mprime
#                    New files:
#                    /etc/init.d/mprimed
#                    /usr/sbin/mprime/*
#                    /var/log/mprimed.log
#                    /etc/logrotate.d/mprimed
# Usage:             sudo /etc/init.d/mprimed {start|stop|restart|force-reload}
#                    tail -f /var/log/mprime.log
#                    tail -f /usr/sbin/mprime/prime.log
#                    /usr/sbin/mprime/mprime -s

# Author: Kalle Lilja
#

# Setup structure
sudo useradd -r mprime
sudo mkdir /usr/sbin/mprime

# Setup run script
sudo cp ./startmprime /usr/sbin/mprime/startmprime
sudo chmod a+x /usr/sbin/mprime/startmprime
sudo chown mprime:mprime /usr/sbin/mprime /usr/sbin/mprime/startmprime

# Setup logging
sudo touch /var/log/mprime.log
sudo chown mprime:mprime /var/log/mprime.log
# Logrotate
sudo touch /etc/logrotate.d/mprimed
echo -e '/var/log/mprime.log {\nrotate7\ndaily\nmissingok\nnotifempty\ncompress\ndelaycompress\ncopytruncate\n}' | sudo tee -a /etc/logrotate.d/mprimed

# Setup init.d daemon
sudo cp ./mprimed /etc/init.d/mprimed
sudo chmod a+x /etc/init.d/mprimed
# Run Daemon on boot
sudo update-rc.d mprimed defaults

# Install MPrime
wget http://www.mersenne.org/ftp_root/gimps/p95v293.linux64.tar.gz -P /tmp
sudo -u mprime tar -xvzf /tmp/p95v293.linux64.tar.gz -C /usr/sbin/mprime

echo "mprime requires manual intervention, proceed with setup. select: 5. Test/Quit when done."
read -p "Ready? (y/n) " RESP
if [ "$RESP" = "y" ]; then
    sudo -u mprime /usr/sbin/mprime/mprime -m
    sleep 1
    else
    echo "setup terminated, run 'sudo -u mprime /usr/sbin/mprime/mprime -m' to manually configure mprime."
    exit 1
fi

