# HPC


# HPC users 

On a server side, once a new user is set up, create a
/home/<**newUser**>/.ssh/authorized_keys file

``` sh 
mkdir ~/.ssh
chmod 700 .ssh
```

The next command with the option –y will read a private key and print
and a public key
``` sh 
ssh-keygen –y
chmod 600 .ssh/authorized_keys
chmod 400 <sshKeyName>.pem
```
Select the <sshKeyName>.pem and copy the output in the
/home/<**user**>/.ssh/authorized_keys

``` sh 
cat <sshKeyName>.pem /home/<user>/.ssh/authorized_keys
```

After that as a sudo user add a line at the end of /etc/ssh/sshd_config

``` sh 
addUsers <userName1> <userName2> <userName3> …
```
```sh
addGroups sudo
```

If your account has sudo privileges.

And to make active this user via ssh run:

``` sh
sudo systemctl restart sshd
```
Now it is possible to connect via ssh to this user.

## Add path to all the users

When there is the creations of user, it can happen that some
applications are not recognized as installed à Make all the users aware
of the installed executables working with the file /etc/profile which
will open the file /etc/profile.d/*

With the user (it is likely that root return this) that can use the
executable run:

```console
which <executableYouNeed>
```
Add this path into the /etc/profile.d/path.sh using

``` sh 
sudo vi /etc/profile.d/path.d à
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
