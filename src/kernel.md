## Find the current kernel version

The ```uname``` utility print information about the machine and operating system is running:

```sh
uname -r      # -r stands for --kernel-release
```
## List all installed kernels
Use the rpm command or dpkg command on the terminal:

```sh
rpm -q kernel
```
## Remove all old kernels
Do not remove the kernel the system is currently running. These examples may result into unstable system if not executed with care. Do not remove the kernel the system is currently running.
Choose which kernel you want to uninstall from the list of those installed. Type the following command to remove the kernel package under RHEL / CentOS / Fedora Linux:

```sh
rpm -e kernel-2.6.12-1.el5
```
Please note that on newer system all obsolete kernels and headers should automatically be flagged as no more needed, and thus can be purged with the following single command:

```sh
sudo dnf autoremove
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
