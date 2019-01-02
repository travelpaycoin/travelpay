Sample init scripts and service configuration for trpcd
==========================================================

Sample scripts and configuration files for systemd, Upstart and OpenRC
can be found in the contrib/init folder.

    contrib/init/trpcd.service:    systemd service unit configuration
    contrib/init/trpcd.openrc:     OpenRC compatible SysV style init script
    contrib/init/trpcd.openrcconf: OpenRC conf.d file
    contrib/init/trpcd.conf:       Upstart service configuration file
    contrib/init/trpcd.init:       CentOS compatible SysV style init script

1. Service User
---------------------------------

All three startup configurations assume the existence of a "trpc" user
and group.  They must be created before attempting to use these scripts.

2. Configuration
---------------------------------

At a bare minimum, trpcd requires that the rpcpassword setting be set
when running as a daemon.  If the configuration file does not exist or this
setting is not set, trpcd will shutdown promptly after startup.

This password does not have to be remembered or typed as it is mostly used
as a fixed token that trpcd and client programs read from the configuration
file, however it is recommended that a strong and secure password be used
as this password is security critical to securing the wallet should the
wallet be enabled.

If trpcd is run with "-daemon" flag, and no rpcpassword is set, it will
print a randomly generated suitable password to stderr.  You can also
generate one from the shell yourself like this:

bash -c 'tr -dc a-zA-Z0-9 < /dev/urandom | head -c32 && echo'

Once you have a password in hand, set rpcpassword= in /etc/trpc/Travelpaycoin.conf

For an example configuration file that describes the configuration settings,
see contrib/debian/examples/Travelpaycoin.conf.

3. Paths
---------------------------------

All three configurations assume several paths that might need to be adjusted.

Binary:              /usr/bin/trpcd
Configuration file:  /etc/trpc/Travelpaycoin.conf
Data directory:      /var/lib/trpcd
PID file:            /var/run/trpcd/trpcd.pid (OpenRC and Upstart)
                     /var/lib/trpcd/trpcd.pid (systemd)

The configuration file, PID directory (if applicable) and data directory
should all be owned by the trpc user and group.  It is advised for security
reasons to make the configuration file and data directory only readable by the
trpc user and group.  Access to trpc-cli and other trpcd rpc clients
can then be controlled by group membership.

4. Installing Service Configuration
-----------------------------------

4a) systemd

Installing this .service file consists on just copying it to
/usr/lib/systemd/system directory, followed by the command
"systemctl daemon-reload" in order to update running systemd configuration.

To test, run "systemctl start trpcd" and to enable for system startup run
"systemctl enable trpcd"

4b) OpenRC

Rename trpcd.openrc to trpcd and drop it in /etc/init.d.  Double
check ownership and permissions and make it executable.  Test it with
"/etc/init.d/trpcd start" and configure it to run on startup with
"rc-update add trpcd"

4c) Upstart (for Debian/Ubuntu based distributions)

Drop trpcd.conf in /etc/init.  Test by running "service trpcd start"
it will automatically start on reboot.

NOTE: This script is incompatible with CentOS 5 and Amazon Linux 2014 as they
use old versions of Upstart and do not supply the start-stop-daemon uitility.

4d) CentOS

Copy trpcd.init to /etc/init.d/trpcd. Test by running "service trpcd start".

Using this script, you can adjust the path and flags to the trpcd program by
setting the trpcd and FLAGS environment variables in the file
/etc/sysconfig/trpcd. You can also use the DAEMONOPTS environment variable here.

5. Auto-respawn
-----------------------------------

Auto respawning is currently only configured for Upstart and systemd.
Reasonable defaults have been chosen but YMMV.
