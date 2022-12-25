# Networking

There are various tools and commands available in Linux for managing and configuring network settings and connections.
Some common tasks related to networking on Linux include:

<strong> Setting up network interfaces: </strong> 
Network interfaces are the physical or logical connections that allow a device to communicate with other devices on a network.
You can use the ```ifconfig``` or ```ip``` utility to view and configure network interfaces.

<strong> Managing network connections: </strong> 
You can use the ```nmcli``` or ```nm-applet``` command to manage and create network connections in Linux. 
These commands allow you to configure the network settings for various types of connections, such as Ethernet, WiFi, and VPN.

<strong> Viewing network statistics: </strong> 
You can use the ```ip``` or ```netstat``` command to view network statistics, such as the number of packets sent and received,
the number of errors, and the status of network connections.

<strong> Debugging network issues: </strong> 
If you encounter any issues with your network connections, you can use the ```ping```, ```traceroute```, and ```mtr``` commands 
to troubleshoot the problem. These commands allow you to test the connectivity and performance of a network connection.


## Private IP Address
192.168.0.0 is the beginning of the private IP address range that includes all IP addresses through 192.168.255.255.
This IP address is usually not used on a network, and a phone or computer wouldn't be assigned this address. However,
some networks that include 192.168.0.0 but do not start with this address could use it without problems for a device.

One common IP address assigned to home routers is 192.168.1.1 (An address like 192.168.0.0 becomes unusable for any 
other purpose after it's established as a network number. If an administrator assigns 192.168.0.0 to any device on 
the network as a static IP address, the network stops functioning until that device is taken offline.). This IP address 
is used because the router is on the 192.168.1.0 network. In the same way, routers on the 192.168.0.0 network are usually
assigned the local, private IP address of 192.168.0.1.

To find out your private IP address, run:

```sh
ip route get 1.1.1.1 | awk '{print $7}'
```

If you are interested into visualize the private IP addresses of your network run:

```sh
nmap -sP 192.168.1.0/24 
nmap -sT -O 192.168.1.0/24  # Return also the OS of the system 
```

## Public IP address

A public IP address is a unique numerical label assigned to every device connected to the Internet. It allows devices to
communicate with each other and with servers over the Internet. Your public IP address is the address that is assigned to 
your device by your Internet Service Provider (ISP) and is used to identify your device on the Internet. It is a unique 
identifier for your device, similar to your home address, and is used to route traffic to your device from other devices 
on the Internet.

You can find out your public IP address by using:
```ssh
curl ifconfig.co
```
Keep in mind that your public IP address can change over time, especially if you have a dynamic IP address assignment from
your ISP. If you have a dynamic IP address, it may change every time you connect to the Internet or after a certain period of 
time. If you have a static IP address, it will remain the same unless you change it manually or through your ISP.
