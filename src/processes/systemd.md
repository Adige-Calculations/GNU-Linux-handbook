# Services and Init System

A service (or daemon), is an example of a process, but it has some additional properties:

- It runs in the background in the sense that it has no direct interaction with the user
- It is often started during bootup, or the first time the service is required, and after 
that it often stays running indefinitely, it is never finished.
- They are often used for events that might happen at any time and when they do, need handling
of some kind. An example is the internet daemon, which handles incoming network traffic.

The defacto standard GNU/Linux system for a system/service manager and initialization tool is 
named ```systemd```.

## systemd

```systemd``` is responsible for starting and managing services. Often for a user, the interface
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

## Instanciate services

Usually, system services run at boot and they keep running in background, to run the machine properly.
You can instantiate a new service to start at boot, storing the executable in:

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
  $("#footer").load("../footers/footer.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
