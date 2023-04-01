# Port & Processes

The main utilities are shown below:

```ss``` - Utility to investigate sockets.  
```ps``` - Information about running processes.  
```nc``` - Netcat is a versatile utility for working with TCP or UDP data.

## Processes

To report a snapshot of the current processes in the system:

``` sh
ps -ef
```

This can tell you what processes are running on your system even if they
do not use a port

### Manage the process

To see processes state, ports and understand if they are listening, it is possible to
run the ```ss``` command when a programme is running in the background, since 
it is a utulity to investigate sockets:

```cosnole
sudo ss -lptn
```

Returning this table header:

```sh
State      Recv-Q Send-Q      Local Address:Port       Peer Address:Port
```

Commonly used in combination with grep to isolate the process or socket you are interested in:

```sh
... | grep <processDescriptionOrPort>
```

### Kill the process

The command kill comes in. To kill all processes which match their full
command instead of just the process name execute:

```sh
kill "PID_single_process" 
pkill -f "command_name"
```

The signals you can send (as flags) are listed below:

- 1 — HUP (hang up)
- 2 — INT (interrupt)
- 3 — QUIT (quit)
- 6 — ABRT (abort)
- 9 — KILL (non-catchable, non-ignorable kill)
- 14 — ALRM (alarm clock)
- 15 — TERM (software termination signal)

### Check sockets of a remote server from local machine

The ```nc``` (or netcat) utility is used to analyze TCP, UDP, or UNIX-domain sockets. The syntax to
check a remote server is:

```sh
nc -vz <host> <port>  
# Example 1
nc -vz 192.168.2.254 80  
# Example 2
nc -vz www.cyberciti.biz 443
```

### Furthem spocket management on local machine

Using ```nc```, the syntax is:

```sh
# Listen on a specified port and print any data received:
nc -l port

# Connect to a certain port:
nc ip_address port

# Keep the server up after the client detaches:
nc -k -l port

# Keep the client up even after EOF:
nc -q timeout ip_address

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
  $("#footer").load("../footers/footer.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
