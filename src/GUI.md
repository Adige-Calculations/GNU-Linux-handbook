# GUI

A graphical user interface (GUI) is a type of user interface that allows users to interact with a computer or device using visual elements such as icons, buttons, and windows. A GUI makes it easier for users to perform tasks by clicking on buttons or selecting options from menus, rather than having to type commands or navigate a command-line interface.

Setting the system to be a multiuser as default:

```sh
sudo systemctl set-default multi-user
```

## GNOME
Install the GUI:
```sh 
sudo systemctl start gdm3 
```
Check the verison:
```
gnome-shell --version
```

Enable the GUI:
```sh
sudo systemctl set-default graphical
```

To disable the GUI:

```sh 
gnome-session-quit 
```

## Display protocol

To check which display protocol you are running, run:

```sh
echo $XDG_SESSION_TYPE
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
