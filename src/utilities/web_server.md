## Web server

A web server is a computer program that serves web pages to clients on the web.
When a client, such as a web browser, makes a request to a web server for a web page,
the web server sends the requested page back to the client.

Web servers can be set up on a computer to host a website, and they are often used to
store and manage the files that make up a website, as well as to process requests from
clients and serve the appropriate files or data in response. Web servers can be configured
to handle different types of requests, such as serving static or dynamic pages.

# Python web server

Using the ```http.server``` module, running the following command in a terminal:

```sh
python -m http.server
```
This will start the HTTP server on your local machine and listen for incoming requests 
on port 8000.

# Nginx 

Install nginx, which is a web server that serve the http pages given the
http/https request

```sh
sudo dnf install nginx
```

This install a deamon, which is driven by systemd service management system; using ```systemctl``` the service
can be controlled in several different ways:

``` sh
sudo systemctl <systemctlAction> nginx
```

### Nginx settings

You can read how ```nginx``` is going to work reading inside ```/etc/nginx/nginx.conf```
Then prepare a config file to serve you site, using as a base a config file already present in ``` /etc/nginx/conf.d ```.
Adding a new .conf file and restarting the service, you should have your website served:

``` sh
sudo vi /etc/nginx/conf.d/<yourWebsiteConfigFile>.conf
sudo systemctl restart nginx
``` 
Remember to put .conf as extension of the file. As a good practice, websites are
stored in ```/var/www/html```

As an example of a config file, pointing to an html file to be served:

```sh
server {
    server_name    gnulinux-handbook.adigecalculations.com www.gnulinux-handbook.adigecalculations.com;
    root           /var/www/html/OpenFOAM-handbook/book;
    index          index.html;
    proxy_set_header Host      $host;
    proxy_set_header Host $http_host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

    listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/gnulinux-handbook.adigecalculations.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/gnulinux-handbook.adigecalculations.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
    if ($host = gnulinux-handbook.adigecalculations.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    listen         80;
    listen         [::]:80;
    server_name    gnulinux-handbook.adigecalculations.com www.gnulinux-handbook.adigecalculations.com;
    return 404; # managed by Certbot
}
```
Next, an example on how to insert reverse proxy to an internal working webserver listening at port 8000:

```sh
server {
    server_name    fc.adigecalculations.com www.fc.adigecalculations.com;
    location / {
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_pass http://localhost:8000;
     }

    listen [::]:443 ssl; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/fc.adigecalculations.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/fc.adigecalculations.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = fc.adigecalculations.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen 80;
    server_name    fc.adigecalculations.com www.fc.adigecalculations.com;

    listen [::]:80;
    return 404; # managed by Certbot
}
```

# Certificates  management

To use a HTTPS protocol the web-server must be able to send off certificates to proof that you
are the owner of the IP address. 

## Installing certificate autority client with Nginx feautures

The first step to using Let’s Encrypt to obtain an SSL certificate is to install the
```certbot``` software on your server. You can obtain the certbot-nginx package by typing:

``` sh
# Cent-OS package manager
sudo yum install certbot-nginx
```

### Set/Grub Nginx addresses

Using a client to communicat with ```Let's Encrypt``` (a certificate authority) called certbox, 
it is possible to  automatically configure SSL for Nginx. It does this by looking for the
```server_name``` directive that matches the domain you’re requesting a certificate for.

Find the existing server_name line in ```/etc/nginx/nginx.conf``` such as:

``` sh
server_name adigecalculations.com www.adigecalculations.com;
```
Verify the syntax of your configuration edits with:

``` sh
sudo nginx -t
```
If that runs with no errors, reload Nginx to load the new configuration:

``` sh
sudo systemctl reload nginx
```
Certbot will now be able to find the correct server block and update it.
Then a firewall update allows HTTPS traffic.

### Updating the Firewall

If you have a firewall enabled, make sure port 80 and 443 are open to incoming traffic.
If you are not running a firewall, you can skip ahead, otherwise you can open these ports
by typing:

``` sh 
sudo firewall-cmd --add-service=http
sudo firewall-cmd --add-service=https
sudo firewall-cmd --runtime-to-permanent
```

If an iptables firewall is running, the commands you need to run are highly dependent
on your current rule set. For an initial rule set, you can add HTTP and HTTPS access 
by typing:

```sh
sudo iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT -p tcp -m tcp --dport 443 -j ACCEPT
```

Now the system is ready to run Certbot and fetch our certificates.

## Obtaining a certificate

Certbot provides a variety of ways to obtain SSL certificates, through various plugins.
The Nginx plugin will take care of reconfiguring Nginx and reloading the config whenever
necessary:

``` sh 
sudo certbot --nginx -d example.com -d www.example.com
```

This runs certbot with the --nginx plugin, using -d to specify the names we’d like the certificate to be valid for.

Certbot will communicate with the Let’s Encrypt server, then run a challenge to verify that you control the
domain you’re requesting a certificate for. The configuration will be updated, and
Nginx will reload to pick up the new settings. certbot will wrap up with a message
telling you the process was successful and where your certificates are stored.
Your certificates are downloaded, installed, and loaded.

### Setting Up Auto Renewal
Let’s Encrypt’s certificates are only valid for ninety days. This is to encourage 
users to automate their certificate renewal process. We’ll need to set up a regularly
run command to check for expiring certificates and renew them automatically.

To run the renewal-check daily, we will use cron, a standard system service for running
periodic jobs. We tell cron what to do by opening and editing a file called a crontab.

```sh
sudo crontab -e
```
The default ```crontab``` config file will open. Paste in the following line:

```sh
15 3 * * * /usr/bin/certbot renew --quiet
```

The 15 3 * * * part of this line means “run the following command at 3:15 am, every day”.

The renew command for ```certbot``` will check all certificates installed on the system
and update any that are set to expire in less than thirty days. --quiet tells Certbot not
to output information or wait for user input.


All installed certificates will be automatically renewed and reloaded when they have thirty
days or less before they expire.

<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
