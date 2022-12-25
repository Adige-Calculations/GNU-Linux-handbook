# Database
A database is a collection of data that is organized in a specific way and stored electronically. Databases are used to store,
retrieve, and manipulate data efficiently.

## postgresql

Remember that a database is an executable service, hence it is an
application that must be installed and executed.

```sh
sudo dnf install postgresql-server
sudo service postgresql status
sudo service postgresql start
psql
```

### Installation

The installation and initialization of the postgresql server is a little
bit different in comparison to other packages and other Linux distros.
This document aims to summarize basic installation steps relevant to
recent RHEL based system.

```sh
sudo dnf install postgresql-server postgresql-contrib
```
The postgresql server is not running and disabled by default. To set it
to start at boot, run:

```sh
sudo systemctl enable postgresql
```
The database needs to be populated with initial data after installation.
The database initialization could be done using following command. It
creates the configuration files postgresql.conf and pg_hba.conf

```sh
sudo postgresql-setup --initdb --unit postgresql
```
To start the postgresql server manually, run
```sh
sudo systemctl start postgresql
```
### User Creation and Database Creation

Now you need to create a user and database for the user. This needs to
be run from a postgres user account on your system.
```sh
sudo -u postgres psql
```
From here you can create a postgres user and database. Here, we will
assume your computer’s user account is called lenny. Note: you can also
run this from the shell as well with createuser lenny and createdb
--owner=lenny carl.
```sh
# On the user "postgres"
CREATE USER adige WITH PASSWORD 'calculations';  
CREATE DATABASE my_project OWNER adige;
```
It might be good idea to add password for the postgres user while you’re
at it:

```sh
# On the user "postgres"
ALTER USER postgres WITH PASSWORD '<passwordYouPrefer>';
```
Press Ctrl + D or \\q to leave the psql session running as user
postgres. Now you can access your new database from your user account
and start using it.

```sh
psql my_project
```

### Initial Configuration

The postgresql server is using two main configuration files

```/var/lib/pgsql/data/postgresql.conf```
```/var/lib/pgsql/data/pg_hba.conf```

The majority of the initial connections error comes from a missed settings 
on these two file, since by deafult it accept only local connections and from
a pre-determined set of addresses. 


For example editing:
```sh
sudo vim /var/lib/pgsql/data/postgresql.conf
```
If you want postgres to accept network connections, you should change
```listen_addresses = 'localhost'``` to ```listen_addresses = '\*'```

For example editing: 
```sh
sudo vim /var/lib/pgsql/data/pg_hba.conf
```
with ```host all 127.0.0.1/32 ident``` to ```host all 127.0.0.1/32 md5```,
should allow most applications to connect with username/password.

## Other configurations
Once your database is set up, you need to configure access to your
database server. This may be done by editing file
```/var/lib/pgsql/data/pg_hba.conf```. There are rules like this in the file:

```sh  
host all all 127.0.0.1/32 md5  
host all all ::1/128 md5  
local all postgres peer
```
First field stands for connection type. It can have these values:


- local — Unix-domain socket
- host — plain or SSL-encrypted TCP/IP socket
- hostssl — an SSL-encrypted TCP/IP socket
- hostnossl — plain TCP/IP socket

Last column specifies which authentication method will be used.

- md5 — client has to supply password processed with MD5 algorithm
ident — obtain user name of connecting client from operating system and
consult it with specified map
- trust — anyone who is able to connect to PostgreSQL server may act as
any user without supplying password
- peer — obtains user’s name from operating system and checks if it
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

```sh
host all all 127.0.0.1/32 trust
```
As soon as you are able to connect, turn on the security systems one by
one while verifying the connection can be established.

For more information see official documentation for pg_hba.conf file.

## Postgres firewall permission
PostgreSQL operates on port 5432 (or whatever else you set in your
postgresql.conf). In firewalld you can open it like this:

``` sh
# make it last after reboot  
firewall-cmd --permanent --add-port=5432/tcp  
# change runtime configuration  
firewall-cmd --add-port=5432/tcp
```
In the case of iptables use, run this sequence to permit the connection from the
external world:

```sh
iptables -A INPUT -p tcp --dport 5432 -m state --state NEW,ESTABLISHED
-j ACCEPT
```

Bear in mind that you probably don’t want to open your database server
to the whole world.

## Run on docker

Pull the image from docker hub, with the following command in the
terminal

docker pull postgres

docker run --name mattia-db –p 5433:5432 -e POSTGRES_PASSWORD=My_Passwd
-d postgres  
You can now connect to the database with the IP address (or localhost)
and the password you have setted up

## Use the database

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
