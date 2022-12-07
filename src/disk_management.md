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
