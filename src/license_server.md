# Licence server

Almost every floating licence manager, will use the ```lmgrd``` program.
To start the licence manager, you need to feed to it the licence file and
for throubleshooting pourpose, it is advices to output the software outcome on
a log file.

```console
./lmgrd -c <license_file>.lic -l <license>.log
```
Remember to open the port you specify in the licence. An example of licence might look like:

```
SERVER host-machine-name 0aa******fec 1055 
VENDOR ansyslmd PORT=53932

...
...
```
The first line of the licence indicate at lmgrd to listen on port 1055 and 53932.

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
