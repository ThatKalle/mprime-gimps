# mprime-gimps
Run [Mersenne](https://www.mersenne.org/) GIMPS Prime95 client -mprime- as a service/daemon on Debian Linux.

## Getting Started

Have a read over at [Mersenne](https://www.mersenne.org/gettingstarted/) for getting-started instructions.

### Installing

The installation is prepared to be as turn-key as possible to the best of my ability,<br>
```
sudo apt-get install git -y
git clone https://github.com/ThatKalle/mprime-gimps.git
cd mprime-gimps/
sudo chmod a+x setup.sh
sudo ./setup.sh
```
With the installation at the `Ready? (y/n)` prompt you'll have to configure mprime for you and your computer.<br>
There are 4 settings of basic interest. Keep the rest at **defaults**.

1. Your user ID or "ANONYMOUS":<br>
Give it the User ID you created over at [Mersenne](https://www.mersenne.org/).<br>
This is used to connect the computer to Your account.
2. Optional computer name:<br>
This is used to identify this instance of mprime, give it a descriptive name - desktop-01
3. Daytime/Nighttime stage 2 memory in MB (8):<br>
The default setting is to use 8MB of RAM, _this is good if the machine is running mprime on the side_, but should ideally be increased to increase performance.<br>
If desired.

## Running

``sudo /etc/init.d/mprime {start|stop|status|restart|force-reload}``<br>
``tail -f /var/log/mprime.log``<br>
``/usr/sbin/mprime/mprime -s``

### Environment

With the installation complete you'll have a few more folders, scripts, and one more user account on the machine.<br>
**User account:** mprime<br>
**Files/Folders:**<br>
/etc/init.d/mprime<br>
/usr/sbin/mprime/* <br>
/var/log/mprime.log<br>
/var/run/mprime.pid<br>
/etc/logrotate.d/mprime<br>

### Uninstalling

uninstall.sh has been created to remove what's installed, please note that it's dirty, ie, no pre-checks are done.<br>Use at own risk.<br>
```
sudo apt-get install git -y
git clone https://github.com/ThatKalle/mprime-gimps.git
cd mprime-gimps/
sudo chmod a+x uninstall.sh
sudo ./uninstall.sh
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* [Mersenne](https://www.mersenne.org/)
* [CrashM](http://www.mersenneforum.org/showthread.php?t=16827)


