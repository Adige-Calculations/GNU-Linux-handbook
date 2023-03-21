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
system ssh start
```

## SSH tunnelling

SSH tunneling (also known as SSH port forwarding) is a way to create a secure connection between a local computer and a remote server
by tunneling through an intermediate server. It allows you to access resources on the remote server as if you were directly connected 
to it, even if the connection between your local system and the remote server is not directly accessible.

To set up an SSH tunnel, you will need to specify the local and remote port numbers that you want to use for the tunnel, as well as the
intermediate server that you want to use as the tunnel. You can then use your SSH client to connect to the intermediate server and create the tunnel.

```sh
ssh -R 8001:<ipAddressMachine1>:8002 <userName>@<ipAddressMachine2>
```

In this particular example if we connect to the machine 1 at port 8001, we are connected to machine 2 via port 8002.

## Key management

Creta a brand new SSH keys pair:

```sh
ssh-keygen -t ed25519 -C <your_email@example.com>
```
This will genrate a key pair in ```~/.ssh```. However to make a public 
key out of the private one (usually to reuse the key for different user of machines):

```sh
ssh-keygen -y -f ~/path_to_key/<key> ~/path_to_key/<key>.pub
```

Then run the following commands to transfer the keypairs of the system you know
the credential:

```sh
ssh-copy-id -i ~/path_to_key/<key> user@hostaname
```
This will generate a ```.ssh/authorized_keys``` file with the credential filled for
the specified user. Permitting the usage of the key instead of the password.

## Automating connection

Save the credential for automating access into ```~/.ssh/config```, and write a similar content to the following:

```sh
Host machine1
    HostName 123.311.23.24
    User mattia

Host machine2
    HostName example.com
    User root

Host machine3
    HostName 64.233.160.0
    User mattia
    Port 56000

Host machine4
    HostName 123.31.23.23
    User ec2-user
    IdentityFile /path/to/special/privatekey/ssh-key.pem
```

Then you can directly connect using:

```sh
ssh machine1
# Or ssh machine2 3 or 4 depending where you would like to connect
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
