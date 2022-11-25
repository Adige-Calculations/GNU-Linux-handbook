# User management 

Add users

```console
sudo adduser \<**username**\> 
```
sudo adduser \<**username**\> sudo **Give new user administrator
privileges**

w **Show who is logged into the machine and what they are doing**

# Directories

/bin → binary: binary essential to the OS

/sbin → system binary: binary accessible only from the sudo user

/usr →

/usr/bin → binary non-essential for the OS

/usr/local → binary compiled manually or installed without the system
package manager

/boot → contain the file needed to boot the system, like the kernel

/dev → device files, you can interface with hardware or drivers as they
are regular files.

/opt → optional

/tmp → temporary files

/var → variable false, contains log and generate file

/procs → virtual folder create by the kernel to take trace of the
running process

# Bash scripting 

First line to initialize shell script is:

#!/bin/bash

## for cycle 

for region in $(foamListRegions solid);

do

\<**command**\>;

done

# Disk operation

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

# Know your hardware 

lscpu **Specs of your CPU**

uname -m **Return the architecture of the CPU**

# Graphical User Interface - GUI

sudo systemctl set-default multi-user

gnome-session-quit **Disable GUI**

sudo systemctl start gdm3 **Install Gnome GUI**

sudo systemctl set-default graphical **Enable GUI**

# Keyboard 

sudo loadkeys it **Change keyboard layout in Italian**

# Port & Processing managing 

ss - Utility to investigate sockets.  
ps - Information about running processes.  
nc - Netcat is a versatile utility for working with TCP or UDP data.

# ssh

The installation comprehends the client and server side, but before
start install the necessary packages

sudo apt install net-tools

If both machines are connected to the Internet on the same router
through Wi-Fi, then you will not need to create a static IP address.

![](media/image1.emf)

## ssh tunnelling

In this forwarding type, Specifies that connections to the given TCP
port on the remote host (server) are to be forwarded to the local side.
Your Ip address (local machine) will be the same as the server

ssh -R 8002:localhost:8001 \<**user**\>@\<**ipAddress**\>

In this particular example if i connect to the sever between port 8002
and 8001, it is like I am executing in the local machine.

## Key management

If you want to create a public key from a private key (this is usually
done if you create a new user and you want to connect to it with the
same key) run the following command with input the private key (.pem)

ssh-keygen -y -f sshKey-eu-west-2-HPC.pem \> key.pub

the copy and paste the result in the .ssh/authorized_keys file of the
new user from which you will use your ssh key to connect.

# HPC users 

On a server side, once a new user is set up, create a
/home/\<**newUser**\>/.ssh/authorized_keys file

mkdir \~/.ssh

chmod 700 .ssh

chmod 600 .ssh/authorized_keys

chmod 400 \<**sshKeyName**\>.pem

The next command with the option –y will read a private key and print
and a public key

ssh-keygen –y

Select the \<**sshKeyName**\>.pem and copy the output in the
/home/\<**user**\>/.ssh/authorized_keys

cat \<**sshKeyName**\>.pem \> /home/\<**user**\>/.ssh/authorized_keys

After that as a sudo user add a line at the end of /etc/ssh/sshd_config

AddUsers \<userName1> \<userName2> \<userName3> …

AddGroups sudo If your account has sudo privileges

And to make active this user via ssh run

sudo systemctl restart sshd

Now it is possible to connect via ssh to this user.

## Add path to all the users

When there is the creations of user, it can happen that some
applications are not recognized as installed à Make all the users aware
of the installed executables working with the file /etc/profile which
will open the file /etc/profile.d/\*

With the user (it is likely that root return this) that can use the
executable run:

which \<**executableYouNeed**\>

Add this path into the /etc/profile.d/path.sh using

sudo nano /etc/profile.d/path.d à

PATH_REQUIRED_DIRECTORIES=(… … \<**pathToTheExecutableYouNeed**\>)

source /etc/profile

## Kill the processes

The command kill comes in.

The flag -9 references the signal that we will send to the process, and
we pass in the process ID within that process group we want to kill.

The signals you can send are:

1 — HUP (hang up)

2 — INT (interrupt)

3 — QUIT (quit)

6 — ABRT (abort)

9 — KILL (non-catchable, non-ignorable kill)

14 — ALRM (alarm clock)

15 — TERM (software termination signal)

# Web

The web communication work thanks to a procol implementation: HTML.
Which stands for Hyper Text Tranfer Protocol.

## Http

A “Protocol” is a definition of behaviour between entities, in this case
client and server.

“Protocol Transfer” stands for defining the rules of communication with
the purpose of transferring data.

“Hyper Text Tranfer Protocol” define a protocol to transfer hyper text

An http connection is stateless, which means there is no record of
previous interaction, if you want to keep the login state you need to
include your login data at every request (on the Header) from a client
point of view.

# Rest-API

An API can be considered REST when it respects the below constrains.

### Rest constrains

Using http connection permit to define 2 steps of creating a REST API

|     |     |
|-----|-----|

# Web server set up

## Apache

In debian system is called

apache

While in fedora systems it is called

httpd

## Express 

## Nginx 

Install nginx, which is a web server that serve the http pages given the
http/https request

sudo dnf install nginx

This install a deamon, which is drived by systemd using:

systemctl status nginx

Or the following command

systemctl start stop restart etc... nginx

You can read how nginx is going to work reading inside the:

/etc/nginx/nginx.conf

Then prepare you config to serve you site, using a config file to reach
your website file in:

/etc/nginx/conf.d/\<**configFile**\>.conf

Remember to put .conf as extension of the file. Further you need to
store the directory that must be hosted in /var/…/www

## Certificates 

The first step is to generate your self-signed certificate. To do this,
log into your server and issue the following command:

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout
/etc/ssl/private/nginx-selfsigned.key -out
/etc/ssl/certs/nginx-selfsigned.crt

You will be asked a few questions (such as country name, state,
locality, etc.). The most important answer is the Common Name. For this
question, answer with the server’s IP Address
<https://www.techrepublic.com/article/how-to-enable-ssl-on-nginx/>

# sytsemd

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

## Services \| deamon

Usually, the service are deamons and they run at boot and in background,
systemd is the init system in mostly of the linux distribution and it
contains the majority of the service your machine will need to run
properly.

service \<**serviceName**\> status **check if a service is running**

You can instantiate new service that starts at boot storing the exec in

/etc/init.d

And then

chkconfig –add \<exec>

chkconfig \<exec> on

# Cross compilation for ARM 64 bit 

Installation of the necessary packages and tools for cross compiling for
ARM. These include the standard tools needed for compiling native:

sudo apt install gcc make gcc-aarch64-linux-gnu
binutils-aarch64-linux-gnu

# Bluetooth peripherical installation

To connect a Bluetooth device, do:

sudo bluetoothctl

Then

scan on

Take note of the device you would like to pair

scan off

pair \<**deviceCode**\>

exit

# Processes 

To report a snapshot of the current processes use

ps -ef

This can tell you what processes are running on your system even if they
do not use a port

# Networking 

To see the port and understand if they are listening, it is possible to
run this command when a programme is running is running.

sudo ss -lptn

Commonly used piping the grep command

\| grep \<**processDescription**\>

From a Windows client side, to see if your machine can reach those
machines through those port type:

telnet \<**ipAddressServer**\> \<**portNumber**\>

While from a Linux client side you can use the “nc” command. The nc (or
netcat) utility is used for just about anything under the sun involving
TCP, UDP, or UNIX-domain sockets. The syntax is:

nc -vz \<**host**\> \<**port**\>  
nc -vz 192.168.2.254 80  
nc -vz www.cyberciti.biz 443

**Dynamic library dependencies**

To understand the shared library that an executable requires you can
run:

ldd nw \<**executable**\>

Which will print all shared object dependencies

# Licence server implementation

Almost evert floating licence, if does not have a proprietary licence
manger will use lmgrd and the utils that comes with it

./lmgrd -c \<**license_file**\>.lic -l \<**license**\>.log

Remember to open the port you specify in the licence.

# Linux utilities 

A list of a useful software for UNIX like environment

## ltdr

This will return a better man page.

## curl 

Transfers data from or to a server. Supports most protocols, including
HTTP, FTP, and POP3. For example to test a rest-api:

curl https://pokeapi.co/api/v2/pokemon/ \> pokemon_return_rest_api.json

## Git

Git is a programme which permit to share project and contribute in open
source manner. The usual work frame is to download (clone in git
language) the code, apport modification and upload the code (push in git
language). The following image show how Git works in a schematic way:

<img src="media/image4.png" style="width:1.77154in;height:1.67826in" alt="Diagram Description automatically generated" />

If you already have a git server, configure the git client running:

git config --global user.email "\<**yourEmail**\>"

or

git config --global user.name "\<**yourName**\>"

### Get a repository from server 

Once cloned the repository you are interest with on your local device:

git clone \<**repositoryUrl**\>

With an existing repository:

git pull

### Create a repository

Initialized empty Git repository locally,

git init -b main

git add . && git commit -m "initial commit"

… complete

### Navigate into the repository

Look at the local branches in your repository:

git branch

To see all other branches hiding in your repository and you can use the
-a flag:

git branch --all

If you just want to take a quick peek at an upstream branch, you can use
a 'detached HEAD' state. You can look around, make experimental changes
and commit them, and you can discard any commits you make in this state
without impacting any branches by switching back to a branch. With the
command:

git checkout \<**wholePathToTheBranch**\>

But if you want to work on that branch, you'll need to create a local
tracking branch which is done automatically by:

git checkout \<**branchName**\>

Now, if you look at your local branches, this is what you'll see is the
branch you have chosen:

git branch

### Modify the repository 

Get the status of the local repository to see which file changed and
which not

git status

### Add code

Add some code and then do a commit into the base level of the
repository:

git add -A  Stages all changes

git add .  Stages new files and modifications, without deletions (on
the current directory and its subdirectories).

git add -u  stages modifications and deletions, without new files

Get again the status of the local repository

git status

### Merge 

If you are in main run:

git merge dev-branch

To merge the dev-branch modification into main

### Commit 

Now it is time to commit those modification

git commit -a

or juts commit everything with:

git commit -m “comment”

A commit file will appear where you need to make visible the changes you
want to commission.

### Push

Then push the directory to add the files on the online repository:

git push

if your branch is new, set a seed in the remote branch to upload the new
files:

git push --set-upstream origin \<branchName>

### Remove remote branch

Remove a remote branch

git push -d \<remote_name> \<branchname>

\<**remote_name**\> usually is **origin**

Remove a local branch:

git branch -d \<branchname>

## GitHub

Create a ssh key pair

ssh-keygen -t ed25519 -C <your_email@example.com>

# Databases

## postgresql

Remember that a database is an executable service, hence it is an
application that must be installed and executed.

Sudo dnf install postgresql-server

Sudo service postgresql status

Sudo service postgresql start

psql

### Installation

The installation and initialization of the postgresql server is a little
bit different in comparison to other packages and other Linux distros.
This document aims to summarize basic installation steps relevant to
recent Fedora Linux releases.

sudo dnf install postgresql-server postgresql-contrib

The postgresql server is not running and disabled by default. To set it
to start at boot, run:

sudo systemctl enable postgresql

The database needs to be populated with initial data after installation.
The database initialization could be done using following command. It
creates the configuration files postgresql.conf and pg_hba.conf

sudo postgresql-setup --initdb --unit postgresql

To start the postgresql server manually, run

sudo systemctl start postgresql

### User Creation and Database Creation

Now you need to create a user and database for the user. This needs to
be run from a postgres user account on your system.

sudo -u postgres psql

From here you can create a postgres user and database. Here, we will
assume your computer’s user account is called lenny. Note: you can also
run this from the shell as well with createuser lenny and createdb
--owner=lenny carl.

postgres=# CREATE USER lenny WITH PASSWORD 'leonard';  
postgres=# CREATE DATABASE my_project OWNER lenny;

It might be good idea to add password for the postgres user while you’re
at it:

postgres=# \\password postgres

Press Ctrl + D or \\q to leave the psql session running as user
postgres. Now you can access your new database from your user account
(lenny) and start using it.

psql my_project

### Initial Configuration

The postgresql server is using two main configuration files

/var/lib/pgsql/data/postgresql.conf

/var/lib/pgsql/data/pg_hba.conf

If you’re getting ident errors from your app you’ll probably need to
perform the accepted solution described at
https://serverfault.com/questions/406606/postgres-error-message-fatal-ident-authentication-failed-for-user?newreg=a4fdc3e21349449985cc65b82399c5b4

sudo gedit /var/lib/pgsql/data/pg_hba.conf

and edit host all 127.0.0.1/32 ident to host all 127.0.0.1/32 md5. This
should allow most applications to connect with username/password.

### Upgrade

As you can see from the error message in my example, it is not a fresh
installation, but an ugprade.

Nov 14 11:45:56 mlich-lenovo.usersys.redhat.com
postgresql-check-db-dir\[2108\]: An old version of the database format
was found.  
Nov 14 11:45:56 mlich-lenovo.usersys.redhat.com
postgresql-check-db-dir\[2108\]: Use "postgresql-setup upgrade" to
upgrade to version 9.3.

With version 9 you can use the upgrade tool. It is packaged as
postgresql-upgrade:

postgresql-setup upgrade  
  
Redirecting to /bin/systemctl stop postgresql.service  
Upgrading database: OK  
  
The configuration files was replaced by default configuration.  
The previous configuration and data are stored in folder
/var/lib/pgsql/data-old.  
  
See /var/lib/pgsql/pgupgrade.log for details.

The data are located at

/var/lib/pgsql/data

/var/lib/pgsql/data-old

The upgrade itself will backup your existing data and migrate your
database. Don’t forget to migrate your configuration (with meld, for
example: meld /var/lib/pgsql/data{,-old}/postgresql.conf).

You may need to switch postgresql to trust mode before updating. This
should be fixed already.

You can also upgrade by dumping your database and loading it again. For
more information, see the official documentation.

Firewall

PostgreSQL operates on port 5432 (or whatever else you set in your
postgresql.conf). In firewalld you can open it like this:

# make it last after reboot  
firewall-cmd --permanent --add-port=5432/tcp  
# change runtime configuration  
firewall-cmd --add-port=5432/tcp

In the case of iptables:

iptables -A INPUT -p tcp --dport 5432 -m state --state NEW,ESTABLISHED
-j ACCEPT

Bear in mind that you probably don’t want to open your database server
to the whole world.

### Configuration

As mentioned above, the postgresql server is using two main
configuration files

/var/lib/pgsql/data/postgresql.conf

/var/lib/pgsql/data/pg_hba.conf

systemd

Some configuration parameters are passed to daemon via command line
options. This behaviour may override settings in postgresql.conf. For
example, if you want to change the server’s port number to 5433, create
a file named /etc/systemd/system/postgresql.service containing:

.include /lib/systemd/system/postgresql.service  
\[Service\]  
Environment=PGPORT=5433

Note: changing PGPORT or PGDATA will typically require adjusting SELinux
configuration as well; see section selinux.

Please follow the systemd documentation 2 for more details.

postgresql.conf

If you want postgres to accept network connections, you should change

listen_addresses = 'localhost'

to

listen_addresses = '\*'

pg_hba.conf

Once your database is set up, you need to configure access to your
database server. This may be done by editing file
/var/lib/pgsql/data/pg_hba.conf. There are rules like this in the file:

# TYPE DATABASE USER ADDRESS METHOD  
host all all 127.0.0.1/32 md5  
host all all ::1/128 md5  
local all postgres peer

First field stands for connection type. It can have these values:

local — Unix-domain socket

host — plain or SSL-encrypted TCP/IP socket

hostssl — an SSL-encrypted TCP/IP socket

hostnossl — plain TCP/IP socket

Last column specifies which authentication method will be used.

md5 — client has to supply password processed with MD5 algorithm

ident — obtain user name of connecting client from operating system and
consult it with specified map

trust — anyone who is able to connect to PostgreSQL server may act as
any user without supplying password

peer — obtains user’s name from operating system and checks if it
matches database user name

When the database server is authenticating the client, it seeks for a
record with a matching connection type, client address, requested
database, and user name. As soon as it finds these credentials, it
performs the authentication. If the authentication fails, no more
subsequent records are taken into account. If no record matches, the
client’s access is denied.

The default settings are usually restricted to localhost.

When you install your database server and at first you try to "make it
work", you should turn off firewall, SELinux and make the postgres
authentication permissive. Bear in mind this will greatly expose your
server, so do it only on a trusted network — preferably with no network
at all:

host all all 127.0.0.1/32 trust

As soon as you are able to connect, turn on the security systems one by
one while verifying the connection can be established.

For more information see official documentation for pg_hba.conf file.

### Run on docker

Pull the image from docker hub, with the following command in the
terminal

docker pull postgres

docker run --name mattia-db –p 5433:5432 -e POSTGRES_PASSWORD=My_Passwd
-d postgres  
You can now connect to the database with the IP address (or localhost)
and the password you have setted up

### Use the database

To list all of your databases when you are on the psql interactive shell
for the databases run:

\\l

To change database

\\c \<databaseName>

To insert table and some data on loggedin database type:

CREATE TABLE \<nameTable> (\<nameColumns> int, \<nameColumns>
char(20));  
INSERT INTO blues VALUES (1, 'light blue');

SELECT \* FROM \<nameTable>;

It will return something like that:

colorid \| colorname  
---------+----------------------  
1 \| light blue  
(1 row)
