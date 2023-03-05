# Users management

At first the users must be known in a system, you can check the users listing the content of ```/etc/passwd```:

```sh
getent passwd | awk -F: '{ print $1}'
```
User accounts are used not only for actual, human users, but also to run system services and sometimes as owners of system files. This is done because the separation between human users' resources (processes, files, etc.) and the separation between system services' resources requires the same mechanisms under the hood.

## Add a user

To add a user to the system execute the following command:

```sh
sudo adduser <username> 
```

To give new user administrator privileges:

``` sh
sudo adduser <username> sudo    ## in debian based systems
sudo adduser <username> wheel   ## in RHEL based system
```
and then to elude the need to introduce the password each time you need to use super-user privileges, the command ```sudo visudo``` you can see and edit, the sudo configuration:

```sh
...

# User privilege specification
root    ALL=(ALL:ALL) ALL

# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL

# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL

# Group without password
%nopwd  ALL=NOPASSWD: ALL
```

Concatenate inside this file the following statememt:

```sh 
yourUsername ALL=(All) NOPASSWD:ALL
```

## Users system login

Show who is logged into the machine and what they are doing
```sh
w
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