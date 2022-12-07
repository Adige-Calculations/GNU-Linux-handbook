# Init system 

For sake of simplicity, we will look only at Systemd.

## systemd

Systemd is a system manager and initialization tool. You can see a list
of all services using the command below

systemctl list-units --type=service

You may have noticed that the system services end with .service
extension, these are nothing but files that are used to define a service
in systemd . systemctl is smart enough to understand that you’re looking
for a service and correctly display the status, however, you can add in
the .service extension as a good practice.

You can view the contents of the service file like this,

systemctl cat postgresql

### Services (deamon)

Usually, the service are deamons and they run at boot and in background,
systemd is the init system in mostly of the linux distribution and it
contains the majority of the service your machine will need to run
properly. To check if a service is running:

```console
service <serviceName> status 
```
You can instantiate new service that starts at boot storing the exec in

/etc/init.d

And then

chkconfig –add \<exec>

chkconfig \<exec> on
