# Directory structure

The root directory (/) is the top-level directory in the file system hierarchy. It is the parent directory for all other directories on the system.
Here are some common directories found within the root directory:

| Root directory     | Description |
| ------------------ | ----------- |
| /bin               | binary: binary essential to the OS       |
| /etc               | etcetera: contains configuration files for the system and installed applications |
| /sbin              | system binary: binary accessible only from the sudo user |
| /usr               | user directory, all binary and files non essential to the OS |
| /usr/bin           | binary non-essential for the OS
| /usr/local         | binary compiled manually or installed without the system package manager |
| /boot              | contains files needed for booting the system, such as the kernel and boot loader. |
| /dev               | device files, contains device files, which represent hardware devices on the system |
| /opt               | optional |
| /tmp               | temporary files |
| /var               | variable, contains log and system generated file |
| /lib               | library, contains library files, which are shared code that can be used by multiple programs.
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
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
