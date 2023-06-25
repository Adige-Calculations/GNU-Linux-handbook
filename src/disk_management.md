# Disk management

Mounting a device refers to the process of associating a storage device or filesystem 
with a specific directory (mount point) in the file system hierarchy. 
By mounting a device, you make its contents accessible to the operating system and users.

Storage devices such as hard drives, solid-state drives, USB drives, network shares, 
and remote file systems are represented as device files. These device files are located 
in the ```/dev``` directory and have names like ```/dev/sda```, or ```/dev/nvme0n1```.

## Disk free (df) 

Displaying all filesystems and their disk usage in human-readable form can be done through
the ```df``` utility:

```sh
df --human 
```

## Disk usage (du)

Instead to estimate and summarize file and directory space usage, use the disk usage ```du```
utility as follows:

``` sh
du --human 
```

A common usage of the ```du``` utility is to check the root directory usage as follows:

```sh
du -h --max-depth=1 / | sort -n
```

# Enlarge the disk volume

If allocated a new disk, run the following command to list all storage devices in a tree-like 
format:

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
