# Hardware scan

Specs of your CPU
```sh
lscpu 
```
Return the architecture of the CPU

```sh
uname -m 
```
## Bluetooth peripherical installation

To connect a Bluetooth device, do:
```
sudo bluetoothctl
```
Then: 

```sh
scan on
#Take note of the device you would like to pair
scan off
pair <deviceCode>
exit
```

## Keyboard settings

Change keyboard layout in Italian

```sh
sudo loadkeys it 
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
