# Processes

A process is an instance of a particular executable program running.
A process can communicate with other devices or services through a network port, moreover it can create other 
processes which are known as "Child Processes".

The main utilities to investigate processes are shown below:

```ss``` - Investigate network sockets.  
```ps``` - Information all running processes.  
```nc``` - Working with TCP or UDP data.

## Scan ongoin processes

To report a snapshot of the current processes use:

``` sh
ps -ef
```

It scan all processes that are running on your system (processes use/don's use a network port)

## Manage process sockets

To see processes state, socket they are using and check if they are listening on it, use the ```ss```
command:

```cosnole
sudo ss -lptn
```

Which will returning this table header:

```sh
State      Recv-Q Send-Q      Local Address:Port       Peer Address:Port
```

- <b>Recv-Q </b>: This field represents the amount of data that is currently in the receiving queue (buffer) of the socket. It indicates the number of bytes that have been received by the socket but not yet read by the application.
- <b>Send-Q </b>: This field represents the amount of data that is currently in the sending queue (buffer) of the socket. It indicates the number of bytes that have been sent by the application but not yet acknowledged by the remote peer.
- <b>Local Address:Port </b>: This field represents the local network address and port number associated with the socket. The local address refers to the network interface on the local machine that the socket is bound to. The port number is a unique identifier that allows multiple connections to exist simultaneously on a single machine.
- <b>Peer Address:Port </b>: This field represents the network address and port number of the remote peer (the other end of the connection) that the socket is connected to. It identifies the destination or source of the connection.

Commonly used in conjuction with the ```grep``` command:

```sh
sudo ss -lptn | grep <processDescriptionOrPort>
```

## Stop processes

To kill/stop all processes which match their full command instead of writing the process name use the ```-f``` flag:

```sh
pkill -f "command_name"
```

Another interesting flag is ```-9```; it refer to the signal that we will send to the process, and
we pass in the process ID within that process group we want to kill.

The signals you can send are:

- 1 — HUP (hang up)
- 2 — INT (interrupt)
- 3 — QUIT (quit)
- 6 — ABRT (abort)
- 9 — KILL (non-catchable, non-ignorable kill)
- 14 — ALRM (alarm clock)
- 15 — TERM (software termination signal)

# Threads

Processes are binaries instructions that are dispatched from the ready state and scheduled in the CPU for execution.
The PCB(Process Control Block) holds the concept of process. The process takes more time to terminate and it is isolated 
means it does not share the memory with any other process. 

The process can have the following states:
- new
- ready
- running
- waiting
- terminated
- suspended 

Meanwhile, a thread is the segment of a process which means a process can have multiple threads and these multiple 
threads are contained within a process. A thread has three states:

- new
- runnable 
- blocked (this state do not use any cpu) 
- terminated

The thread takes less time to terminate as compared to the process but unlike the process, threads do not isolate memory. 


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
