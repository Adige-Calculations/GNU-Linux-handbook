# Directory structure

The root directory (/) is the top-level directory in the file system hierarchy. It is the parent directory for all other directories on the system.
Here are some common directories found within the root directory:

| Root directory     | Description |
| ------------------ | ----------- |
| /bin               | binary: conatins binaries essential to the OS       |
| /etc               | etcetera: contains configuration files for the system and installed applications |
| /sbin              | system binary: binary accessible only from the sudo user |
| /usr               | user directory, contains files (binaries/libraries/shared files/manuals) non essential to the OS |
| /usr/local         | contains manually managed files, hence without using a package manager |
| /boot              | contains files needed for booting the system, such as the kernel and boot loader. |
| /dev               | device files, contains device files, which represent hardware devices on the system |
| /opt               | optional |
| /tmp               | temporary files, contains homonymous files |
| /var               | variable, contains log and system generated file |
| /lib               | library, contains essential library files.
| /procs             | virtual folder created by the kernel to take trace of the running process |

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
