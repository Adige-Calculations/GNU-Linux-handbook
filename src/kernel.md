# OS Kernel

The kernel takes care of recognizing hardware, networking perifericals
and setting up the CPU registers, memory and file system.
 
The kernel is loaded into memory during the boot process (GRUB direct
your CPU at the address at which the kernel is stored) and initializes
it.

After the kernel is loaded, it start the first process of the machine namely the init service, responsible 
for starting and managing other processes in the system.

To check what the kernel is loading after booting, follow a simlar command to parse the first of the 
process:

```sh
ps -ef > process_list && head -n 2 process_list
```

Which will return a similar result if you are using ```systemd``` as your init system.

```sh
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 11:46 ?        00:00:02 /usr/lib/systemd/systemd rhgb --switched-root --system --deserialize=35
```

## Find the current kernel version

The ```uname``` utility print information about the machine and operating system is running:

```sh
uname -r      # -r stands for --kernel-release
```

## List all installed kernels

Use the ```rpm``` command or ```dpkg``` command on the terminal:

```sh
rpm -q kernel
```

## Remove old kernels

Do not remove the kernel the system is currently running. These examples may result into unstable system if not executed with care. 
Choose which kernel you want to uninstall from the list of those installed. Type the following command to remove the kernel package 
under RHEL/CentOS/Fedora Linux:

```sh
rpm -e kernel-2.6.12-1.el5
```
Please note that on newer system all obsolete kernels and headers should automatically be flagged as no more needed, and thus can be 
purged with the following single command:

```sh
sudo dnf autoremove
```

## Change the default kernel

If you experience problems with the latest kernel you can rollback to a previous one (usually your system store more than 
one in the disks at ```/boot```). Telling ```grub``` to point into a different location in memory, i.g.

```sh
sudo grubby --info=ALL | grep -E "^kernel|^index"
```

From the output above select one index and the use it as follows:

```sh
sudo grubby --set-default-index=1
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
