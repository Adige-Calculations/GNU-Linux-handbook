# Port & Processes

ss - Utility to investigate sockets.  
ps - Information about running processes.  
nc - Netcat is a versatile utility for working with TCP or UDP data.

## Processes 

To report a snapshot of the current processes use
```sh
ps -ef
```
This can tell you what processes are running on your system even if they
do not use a port


### Turn off a process

The command kill comes in. The flag -9 references the signal that we will send to the process, and
we pass in the process ID within that process group we want to kill. The signals you can send are:

    1 — HUP (hang up)

    2 — INT (interrupt)

    3 — QUIT (quit)

    6 — ABRT (abort)

    9 — KILL (non-catchable, non-ignorable kill)

    14 — ALRM (alarm clock)

    15 — TERM (software termination signal)


## Networking 

To see the port and understand if they are listening, it is possible to
run this command when a programme is running is running.

```sh
sudo ss -lptn
```

Commonly used piping the grep command

```sh
... | grep <processDescription>
```

From a Windows client side, to see if your machine can reach those
machines through those port type:

```sh
telnet \<**ipAddressServer**\> \<**portNumber**\>
```
While from a Linux client side you can use the “nc” command. The nc (or
netcat) utility is used for just about anything under the sun involving
TCP, UDP, or UNIX-domain sockets. The syntax is:

```
nc -vz <host> <port>  
nc -vz 192.168.2.254 80  
nc -vz www.cyberciti.biz 443
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
