# File system

A file system is a programme that recognize the avaible memory of the disks in the machine. Organize, its
memory in allocable and dynamic blocks of bits and create a pattern to organize hirarcally the file allocation.
Different file systems differ from each other for the way they handle this organization, and the presence of 
functionality such as expansion in other disk, compression, backup capabilities or corruption check ability.   

---------------------------------------------------------------

Mounting a device refers to the process of making a storage device, accessible and usable by the
OS file system. A disk is mounted in a specific directory (mount point) in the file system hierarchy. 
By mounting a device, you make its contents accessible to the operating system and users.

Storage devices such as hard drives, solid-state drives, USB drives, network shares, 
and remote file systems are represented as device files. These device files are located 
in the ```/dev``` directory and have names like ```/dev/sda```, or ```/dev/nvme0n1```.

The device file acts as an interface between the operating system and the storage device, 
allowing the system to read from and write to the device.

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
