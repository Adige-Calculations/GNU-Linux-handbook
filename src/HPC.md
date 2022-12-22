# HPC

HPC systems are typically made up of a large number of processors (such as CPUs or GPUs) that work together 
to perform calculations in parallel. They may also have a lot of memory and fast interconnects to allow the 
processors to communicate and share data quickly.

# HPC users 
On a server side, once a new user is set up, create a
/home/\<**newUser**\>/.ssh/authorized_keys file

``` sh 
mkdir ~/.ssh
chmod 700 .ssh
```

The next command with generate a private and a public key:

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
AddUsers \<userName1> \<userName2> \<userName3> …
```
AddGroups sudo If your account has sudo privileges

And to make active this user via ssh run
``` sh
sudo systemctl restart sshd
```
Now it is possible to connect via ssh to this user.

## Add path to all the users

When there is the creations of user, it can happen that some
applications are not recognized as installed à Make all the users aware
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
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
