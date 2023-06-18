# Package manager

To understand the specific files and changes made by an APT package installation, 
you can use the ```dpkg``` command (debian packages only), which is the underlying package management tool that APT utilizes.
The ```dpkg``` command allows you to query information about installed packages, including their files, configuration details, and more.

```sh
dpkg -L <package_name>
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
