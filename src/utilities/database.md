# Database

A database is a programme that create a collection of data that is organized in memody in a specific way. Databases are used to store,
retrieve, and manipulate data efficiently. As example a relational open-source database ```postgresql``` is described in its main functionalities:
and interfaces

## postgresql

A database is an executable service, hence it is an
application that must be installed and executed. Here it is shown how to do install and execute it in brief.: 

```sh
sudo dnf install postgresql-server
sudo service postgresql status
sudo service postgresql start
psql
```

However, depending on the GNU/Linux distribution you are in some other dependencies must take place:

### Installation

The installation and initialization of a postgresql server is a little
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

### Initial Configuration

The postgresql server is using two main configuration files:

```postgresql.conf```
```pg_hba.conf```

They can be located diffently depending on version or system configuration, hence find it with:

```sh
sudo find / -name postgresql.conf   
sudo find / -name pg_hba.conf
# Or you can
sudo -u postgres psql
SHOW hba_file;
```

The majority of the initial connection errors comes from a missed settings 
on these two files, since by deafult ```postgreql``` it accept only local connections.

Editing ```postgresql.conf``` you can accept all network connections, changing:
```listen_addresses = 'localhost'``` into ```listen_addresses = '\*'``` 

## Further configurations

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

Editing ```pg_hba.conf```, changing ```host all 127.0.0.1/32 ident``` to you are allowong
the world to connect with username/password.

```sh
host    all             all              0.0.0.0/0                       md5
host    all             all              ::/0                            md5
```

When you install your database server and at first you try to "make it
work", you should turn off firewall, and make the postgres
authentication permissive. This will  expose your
server, so do it only on a trusted network:

```sh
host all all 127.0.0.1/32 trust
```

As soon as you are able to connect, turn on the security systems one by
one while verifying the connection can be established.

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
terminal:

```sh
docker pull postgres
docker run --name mattia-db –p 5433:5432 -e POSTGRES_PASSWORD=my_Passwd -d postgres  
```
You can now connect to the database with the IP address (or localhost)
and the password you have setted up at port 5433

## Use the database in interactive mode:

To list all of your databases when you are on the psql interactive shell run:
```sh
\\l
```
To change database

```sh
\\c \<databaseName>
```

To insert table and some data on loggedin database type:

```sql
CREATE TABLE table_name (column_name int, columns_name char(20));  
INSERT INTO blues VALUES (1, 'light blue');

SELECT * FROM table_name;
```

It will return something like that:

```sh
colorid \| colorname  
---------+----------------------  
1 \| light blue  
(1 row)
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
  $("#footer").load("../../footers/footer.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
