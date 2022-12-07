# GUI

Setting the system to be a multiuser as default:

```console
sudo systemctl set-default multi-user
```

## GNOME

Install the GUI:
```console 
sudo systemctl start gdm3 
```
Check the verison:
```
gnome-shell --version
```

Enable the GUI:
```console
sudo systemctl set-default graphical
```

To disable the GUI:

```console 
gnome-session-quit 
```
