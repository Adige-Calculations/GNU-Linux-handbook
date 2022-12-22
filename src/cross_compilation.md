# Cross compilation

Cross compilation is the process of building a program on one platform (the host) to be run on another platform (the target).
Cross compilation can be useful in a number of situations, such as when the target platform does not have the necessary tools
or resources to build the program, or when the host platform is more powerful and can build the program faster.


To perform cross compilation, you will need a cross-compiler, which is a toolchain that includes a compiler, linker, and other
tools that are specific to the target platform. You will also need to set up the build system to use the cross-compiler and 
specify the target platform. The installation of the necessary packages and tools for cross compiling from an x64 GNU/Linux 
machine to an GNU/Linux ARM architecture, the following standard tools are:

```sh
sudo apt install gcc make gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu
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
