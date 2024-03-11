# HPC

HPC systems are typically made up of a large number of processors (such as CPUs or GPUs) that work together 
to perform calculations in parallel. They may also have a lot of memory and fast interconnects to allow the 
processors to communicate and share data quickly.

## HPC users connection
On a server side, once a new user is set up, create a
```/home/<newUser>/.ssh/authorized_keys``` file.

``` sh 
mkdir ~/.ssh
chmod 700 .ssh
```

The next command will generate a pair key, namely private (never to be shared) and a public key:

```sh
ssh-keygen –y
chmod 600 .ssh/authorized_keys
chmod 400 <sshKeyName>.pem
```

Select the <sshKeyName>.pem and copy the output in the
/home/<user>/.ssh/authorized_keys

```sh
cat <sshKeyName>.pem > /home/<user>/.ssh/authorized_keys
```

After that as a sudo user add a line at the end of /etc/ssh/sshd_config

```sh
addUsers <userName1> <userName2> <userName3> …
addGroups sudo  # If your account has sudo privileges
```

And to make reachable this user via the SSH protocol without rebooting the machine, restart the SSH service:

``` sh
sudo systemctl restart sshd
```

### Add path to all the users

When a new user is created, it can happen that some
applications are not recognized as installed, Make all the users aware
of the installed executables working with the file ```/etc/profile``` which
will open the files ```/etc/profile.d/*```

With the user (it is likely that root return this) that can use the
executable run:

```sh
which <executableYouNeed>
```
Add this path into the /etc/profile.d/path.sh using

```sh
sudo nano /etc/profile.d/path.d 
PATH_REQUIRED_DIRECTORIES=(… … <pathToTheExecutableYouNeed>)
source /etc/profile
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
