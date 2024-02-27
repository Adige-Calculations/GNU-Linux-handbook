# Disk management

## Disk free (df) 

Displaying all filesystems and their disk usage in human-readable form can be done through
the ```df``` utility:

```sh
df --human 
```
To check what type of file system you are using use the ```-T``` flag as follows:

```sh
df -T
```

## Disk usage (du)

Instead to estimate and summarize file and directory space usage, 
use the disk usage ```du``` utility as follows:

``` sh
du -hT 
```

A common usage of the ```du``` utility is to check the root directory usage as follows:

```sh
du -h --max-depth=1 / | sort -n
```

# Enlarge the disk volume

If allocated a new disk, run the following command to list all storage devices 
in a tree-like format:

```sh
lsblk
```

To enlarge a current disk perform the following commands:

```sh
sudo growpart /dev/nvme0n1 1
lsblk
```

### Extended the file system 

The commands to extend the file system differ depending on the file system type. For **XFS file system** usd

```sh
sudo xfs_growfs -d /
```

For **Ext4 file system** use the correspective:

```sh
sudo resize2fs /dev/<nvme0n1p...>
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
