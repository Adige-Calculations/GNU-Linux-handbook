# Disk management

To list the file systems and the space present in your machine run:

df --human **Report file system disk space usage**

Disk usage;

du -h **Report directory disk space usage**

du -h –max-depth=1 \| sort -n

## Enlarge the disk volume 

If allocated a new disk

lsblk

sudo growpart /dev/nvme0n1 1

lsblk

sudo xfs_growfs -d /
