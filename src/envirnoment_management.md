# Environment management

As environment configuration, it is intened the binary path, library path configuration, plus 
environment variable saved in the machine state.

## Binary/Library path modification

Execution path and library location path are essential address to permit the system to find
a programme or a shared library. To see where the machine is looking for a library:

```
echo $LD_LIBRARY_PATH
```

To add a custom path run for a new library location run:

```sh
export LD_LIBRARY_PATH="/path/to/new/lib_newlibrary:$LD_LIBRARY_PATH"
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
