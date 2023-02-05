# Processes

A process that does not use a port is a program or task running on a computer that doesn't
communicate with other devices or services through a network port. This means that the process
is not sending or receiving data through the network and is not accessible from other devices.
Examples of such processes could be a local application or a script running on the same machine,
 performing tasks unrelated to network communication.

The main utilities to investigate processes are shown below:

```ss``` - Investigate sockets.  
```ps``` - Information all running processes.  
```nc``` - Working with TCP or UDP data.

## Scan ongoin processes

To report a snapshot of the current processes use:

``` sh
ps -ef
```
It scan all processes that are running on your system (Process that does and does not use a port)

## Manage processes sockets

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

Commonly used piping the grep command
```sh
... | grep <processDescriptionOrPort>
```

## Kill processes

The command kill comes in. To kill all processes which match their full
command instead of just the process name execute:

```sh
pkill -f "command_name"
```
The flag ```-9``` references the signal that we will send to the process, and
we pass in the process ID within that process group we want to kill.

The signals you can send are:

- 1 — HUP (hang up)
- 2 — INT (interrupt)
- 3 — QUIT (quit)
- 6 — ABRT (abort)
- 9 — KILL (non-catchable, non-ignorable kill)
- 14 — ALRM (alarm clock)
- 15 — TERM (software termination signal)


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
