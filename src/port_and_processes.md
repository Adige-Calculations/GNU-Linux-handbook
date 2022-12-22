
# Port & Processes

ss - Utility to investigate sockets.  
ps - Information about running processes.  
nc - Netcat is a versatile utility for working with TCP or UDP data.

## Processes 

To report a snapshot of the current processes use
``` sh
ps -ef
```
This can tell you what processes are running on your system even if they
do not use a port


### Manage the process

The command kill comes in. To kill all processes which match their full
command instead of just the process name execute:

```sh
pkill -f "command_name"
```
The flag ```-9``` references the signal that we will send to the process, and
we pass in the process ID within that process group we want to kill.

The signals you can send are:

1 — HUP (hang up)

2 — INT (interrupt)

3 — QUIT (quit)

6 — ABRT (abort)

9 — KILL (non-catchable, non-ignorable kill)

14 — ALRM (alarm clock)

15 — TERM (software termination signal)


## Networking 

To see processes state, ports and understand if they are listening, it is possible to
run the ```ss``` command when a programme is running in the background, since 
it is a utulity to investigate sockets:

```cosnole
sudo ss -lptn
```

Returning this table

```sh
State      Recv-Q Send-Q      Local Address:Port       Peer Address:Port
```

Commonly used piping the grep command
```sh
... | grep <processDescriptionOrPort>
```
From a Windows client side, to see if your machine can reach those
machines through those port type:

```sh 
telnet <ipAddressServer> <portNumber>
```

### Netcat

While from a Linux client side you can use the “nc” command. The nc (or
netcat) utility is used for just about anything under the sun involving
TCP, UDP, or UNIX-domain sockets. The syntax is:

```sh
# Listen on a specified port and print any data received:
nc -l port

# Connect to a certain port:
nc ip_address port

# Set a timeout:
nc -w timeout_in_seconds ipaddress port

# Keep the server up after the client detaches:
nc -k -l port

# Keep the client up even after EOF:
nc -q timeout ip_address

# Scan the open ports of a specified host:
nc -v -z ip_address port

# Act as proxy and forward data from a local TCP port to the given remote host:
nc -l local_port | nc hostname remote_port
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
