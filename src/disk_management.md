# Disk management

To list the file systems and the space present in your machine run:

```console
df --human **Report file system disk space usage**
```

Report directory disk space usage
``` console
du -h 
```
Check which root directory contains more data

```console
du -h –max-depth=1 \ | sort -n
```
## Enlarge the disk volume 

If allocated a new disk
``` console
lsblk
```
sudo growpart /dev/nvme0n1 1

lsblk

sudo xfs_growfs -d /

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
