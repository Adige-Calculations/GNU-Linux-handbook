# Services & Init system
System will be covered, which is the init programme present in the majority
of the system out there.

## systemd
Systemd is a system/service manager and initialization tool.
Responsible for starting and managing system services. Often for a user, the interface
is the sevice management system via the ```systemctl``` utility.

### systemctl
Is a command-line utility used to control the system service manager (responsible 
for starting, stopping, and managing system services). systemctl can be used to start, stop, restart,
enable, or disable services, as well as view the status and log files of those.

Here are some examples of common systemctl commands:

```sh
systemctl start <service> 	# start a service
systemctl stop <service> 	# stop a service
systemctl restart <service> # restart a service
systemctl enable <service>  # enable a service to start automatically at boot
systemctl disable <service> # disable a service from starting automatically at boot
systemctl status <service>  # check the status of a service
systemctl list-units --type=service    # list all available services
systemctl cat <service>     #view the configuration file for a service
```

You may have noticed that the system services end with ```.service```
extension, these are nothing but files that are used to define a service
in systemd. ```systemctl``` is smart enough to understand that you’re looking
for a service and correctly display the status, however, you can add in
the .service extension as a good practice.

For example, you can view the contents of the service file like this:
```sh
systemctl cat postgresql.service
```

To restart systemd to be sure that all deamons are laoded:

```sh
systemctl deamon-reload
systemctl restart <service>.service
```

### Services (pr Deamons)

Usually, services run at boot and keep running in background,
```systemd``` is the init system in mostly of the GNU/Linux distributions and it
contains the majority of the service your machine will need to run properly.
You can instantiate a new service to start at boot, storing the executable in

```sh
/etc/init.d
```
And then running the following:
```sh
chkconfig –add <executable>
chkconfig <exec> on
```

<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
