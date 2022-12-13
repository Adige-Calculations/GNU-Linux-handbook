# Users management

Add users

```console
sudo adduser <username> 
```

Give new user administrator privileges
``` console
sudo adduser <username> sudo  ## wheel in RHEL based system
```
and then to elude the need to introduce the password each time you need to use super-user privileges, the command ```sudo visudo``` you can see and edit, the sudo configuration:

```console
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

Add inside this file:

```console 
yourUsername ALL=(All) NOPASSWD:ALL
```

## Monitoring users 

To show who is logged into the system and which process other users lauch:

```console
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
