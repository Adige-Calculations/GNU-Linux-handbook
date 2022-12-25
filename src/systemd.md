# Init system
For sake of simplicity, we will look only at Systemd.

## systemd
Systemd is a system/service manager and initialization tool.
Responsible for starting and managing system services, often for a user the interface with systemd
is the sevice management system via the ```systemctl``` utility.

### systemctl
Is a command-line utility that is used to control the system service manager (responsible 
for starting, stopping, and managing system services). systemctl can be used to start, stop, restart,
enable, or disable services, as well as to check the status of services and view log files.

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

It is commonly used in conjunction with other system management tools, such as systemd.


You may have noticed that the system services end with ```.service```
extension, these are nothing but files that are used to define a service
in systemd. ```systemctl``` is smart enough to understand that you’re looking
for a service and correctly display the status, however, you can add in
the .service extension as a good practice.

For example, you can view the contents of the service file like this:
```sh
systemctl cat postgresql.service
```

### Services (Deamon)
Usually, the service are deamons and they run at boot and keep running in background,
```systemd``` is the init system in mostly of the GNU/Linux distributions and it
contains the majority of the service your machine will need to run properly. To check
if a service is running:

```sh
service <serviceName> status 
```
You can instantiate a new service to start at boot, storing the executable in

```sh
/etc/init.d
```
And then:
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
