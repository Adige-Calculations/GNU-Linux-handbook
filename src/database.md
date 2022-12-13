# Database

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

<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
