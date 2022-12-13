# GUI

Setting the system to be a multiuser as default:

```console
sudo systemctl set-default multi-user
```

## GNOME

Install the GUI:
```console 
sudo systemctl start gdm3 
```
Check the verison:
```
gnome-shell --version
```

Enable the GUI:
```console
sudo systemctl set-default graphical
```

To disable the GUI:

```console 
gnome-session-quit 
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
