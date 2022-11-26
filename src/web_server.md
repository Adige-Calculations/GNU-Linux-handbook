# Web server

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