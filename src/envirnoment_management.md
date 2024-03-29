# Environment management

As environment configuration, it is intened the binary path, library path configuration, plus 
environment variable saved in the machine state.

## Binary path modification 

The execution path is essential to permit the system to find the executables in the disks. 

```sh
echo $PATH
```

To modify it run:

```sh
export PATH="/home/$USER/new/bin/location:$PATH"
```

## Library path modification

As per the execution path, the library location path can be identified and modified at occurrence. 
To see where the machine is looking for a library:

```sh
echo $LD_LIBRARY_PATH
```

while for the execution path check:

```sh
echo $PATH
```

To add a custom path run for a new library location run:

```sh
export LD_LIBRARY_PATH="/path/to/newlibrary:$LD_LIBRARY_PATH"
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
