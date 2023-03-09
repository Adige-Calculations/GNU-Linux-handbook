# Sockets

A socket is a endpoint for network communication in a computer network. It represents a combination of an IP address and a port number that uniquely identifies a specific process or service on a networked device. A socket acts as a bidirectional communication channel between applications, allowing them to send and receive data over the network. Sockets are used in many networking protocols, such as TCP, UDP, and SCTP.

## Connect to a socket 

```sh
nc -vz <host> <port>  
```
## Check socket reachability

From client side, you can use the ```netcat``` (```nc```) utility. The syntax to
check a network socket is:

```sh
nc -vz <host> <port>  
```
Where -v flag strand for verbose and -z activate the port scanner mode, which only listen services are scanned (no data is sent) 
From a Windows client side, to see if a socket can be reached use:

```sh 
telnet <ipAddressServer> <portNumber>
```

### Manage sockets from client

The nc (or netcat) utility is used for just about anything under the sun involving
TCP, UDP, or UNIX-domain sockets. The syntax is:

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
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>