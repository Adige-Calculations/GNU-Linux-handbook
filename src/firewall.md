# Firewall

First check which firewall program is installed in your system:

```sh
sudo which nft >/dev/null && echo nftables is enabled in this system || echo ufw is enabled in this system
```

## Open ports

If ufw (uncomplicated firewall) is the firewall program enabled in your machine, execute the following command to open a different port, replacing the PORT placeholder with the number of the port to be opened:

```sh
ufw status
ufw allow 8080/tcp
ufw status
sudo systemctl restart ufw.service
```

If nft is the firewall program enabled in your machine, modify the ```/etc/nftables.conf``` file and add the following line inside the chain inbound block, replacing the ```PORT``` placeholder with the number of the port to be opened:

```sh
...

  chain inbound {
      ...
      tcp dport PORT accept
  }
...
```