# SSH

SSH (Secure Shell) is a network protocol that allows secure remote login and other secure network services over an unsecured network. It is commonly used to log into servers remotely, transfer files between systems, and execute commands on remote systems.

To use SSH, you will need an SSH client and an SSH server. Before
any connection take place, install the necessary packages on client:

```sh
sudo apt install openssh-server net-tools
```

## SSH config file

You can find the configuration options at ```sudo vim /etc/ssh/sshd_config```. An option that should always be consider looking is:

``` sh
port 22 
```

Then ensure the deamon is running with these configurations:

```sh
service ssh start
```

## SSH tunnelling

SSH tunneling (also known as SSH port forwarding) is a way to create a secure connection between a local computer and a remote server by tunneling through an intermediate server. It allows you to access resources on the remote server as if you were directly connected to it, even if the connection between your local system and the remote server is not directly accessible.

To set up an SSH tunnel, you will need to specify the local and remote port numbers that you want to use for the tunnel, as well as the intermediate server that you want to use as the tunnel. You can then use your SSH client to connect to the intermediate server and create the tunnel.

```sh
ssh -R 8002:<ipAddressMachine1>:8001 <userName>@<ipAddressMachine2>
```

In this particular example if we connect to the machine 1 between port 8002
and 8001 of machine 1.

## Key management

Creta an SSH key:

```sh
ssh-keygen -t ed25519 -C <your_email@example.com>
```

If you want to create a public key from a private key (this is usually
done if you create a new user and you want to connect to it with the
same key) run the following command with input the private key (.pem)

```sh
ssh-keygen -y -f sshKey-eu-west-2-HPC.pem > key.pub
```
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
