# Disk management

An analysis of the disk present in your machine can be done through the ```df``` utility, which
report all file systems and their disk usage:

```sh
df --human 
```
Instead to estimate and summarize file and directory space usage, run the following:

``` sh
du --human 
```
A good example on how to used the ```df``` utility is to check which root directory contains more data:

```sh
du -h –max-depth=1 \ | sort -n
```
## Enlarge the disk volume 

If allocated a new disk, run the following command to list all storage devices in a tree-like format:

``` sh
lsblk
```
To enlarge a current disk perform the following commands:

``` sh
sudo growpart /dev/nvme0n1 1
lsblk
sudo xfs_growfs -d /
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
