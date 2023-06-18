# Build software

Once you have built a software without using the package manager (or downloaded a pre-build version of it), 
you have to decide where to store the result of the building process (binaries and libraries).
A plausible option is to organize the files in the ```/opt``` directory and then provide a symbolic link 
into an executable path or library path such as ```/usr/local/...``` (directory location used to store 
manually build programmes). In the following snippet, the ```HDFView``` programme is placed and linkd in the 
above mentioned location.  

```sh
sudo mv HDFView /opt
sudo ln -s "/opt/HDFView/bin/HDFView" /usr/local/bin/HDFView
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
