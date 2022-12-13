# ssh

The installation comprehends the client and server side, but before
start install the necessary packages

sudo apt install net-tools

If both machines are connected to the Internet on the same router
through Wi-Fi, then you will not need to create a static IP address.

## ssh tunnelling

In this forwarding type, Specifies that connections to the given TCP
port on the remote host (server) are to be forwarded to the local side.
Your Ip address (local machine) will be the same as the server

ssh -R 8002:localhost:8001 <**userName**>@<**ipAddress**>

In this particular example if i connect to the sever between port 8002
and 8001, it is like I am executing in the local machine.

## Key management

If you want to create a public key from a private key (this is usually
done if you create a new user and you want to connect to it with the
same key) run the following command with input the private key (.pem)

ssh-keygen -y -f sshKey-eu-west-2-HPC.pem \> key.pub

the copy and paste the result in the .ssh/authorized_keys file of the
new user from which you will use your ssh key to connect.



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
