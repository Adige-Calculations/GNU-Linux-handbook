# Package

<b> A package is a collection of files.</b> Then, a package manager takes care of its installation, with a 
well defined set of rules to place the files into the correct place within the system.

## Package manager

Using Debian based systems, the package manager is:

```sh
apt --version
```

To understand the specific files/changes made by ```apt```, you 
can use the ```dpkg``` command (debian packages only), which is the underlying package 
management tool that ```apt```  utilizes. The ```dpkg``` command allows you to query information 
about installed packages, including their files, configuration details, and more.

```sh
dpkg -L <package_name>
```

# Install software without the help of the package manager 

Once you have obtained a software without using the package manager (i.g. downloading a pre-build 
version of it or after having built it ), you have to decide where to store the artifacts 
(binaries and libraries).
A plausible option is to organize the files in the ```/opt``` directory and then provide a 
symbolic link into an executable path or library path such as ```/usr/local/...``` (directory 
location used to store manually built binaries[```/usr/local/bin```]/library[```/usr/local/lib```]). 

In the following snippet, the ```HDFView``` programme is placed and linkd in the 
above mentioned location.  

```sh
# HDFView is a directory structure containing binaries
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
