# User management

To check the users listing read the content of ```/etc/passwd``` file:

```sh
getent passwd | awk -F: '{ print $1}'
```

User accounts are used not only for actual, human users, but also to run system 
services and sometimes as owners of system files. This is done because the separation 
between human users' resources (processes, files, etc.) and the separation between 
system services' resources requires the same mechanisms under the hood.

## Add a user

To add a user to the system execute the following command:

```sh
sudo adduser <username> 
```

To give administrator privileges:

``` sh
sudo adduser <username> sudo    ## in debian based systems
sudo adduser <username> wheel   ## in RHEL based system
```

then to elude the need to insert the password each time you need to use super-user 
privileges, excute the command ```sudo visudo``` and change its configuration file:

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

## User ownership specification

```sh
chown -R admin /opt/script
```

# Groups

To check how many groups are present:

```sh
groups
```

## Group management 

To add a user into one the above groups, execute:

```sh
sudo usermod -a -G <groupName> <username>
```

While to change the ownership of files/directories:

```sh
chgrp -R <groupName> <fileOrDirectory>
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