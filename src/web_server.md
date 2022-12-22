# Web server

## Apache

In debian system is called

```sh
apache
```

While in fedora systems it is called

```sh
httpd
```

## Express 

## Nginx 

Install nginx, which is a web server that serve the http pages given the
http/https request

sudo dnf install nginx

This install a deamon, which is drived by systemd using:

``` sh
systemctl status nginx
```
Or the following command
``` sh
systemctl start stop restart etc... nginx
```
You can read how nginx is going to work reading inside ```/etc/nginx/nginx.conf```

Then prepare you config to serve you site, using a config file to reach
your website file in:

``` sh
vi /etc/nginx/conf.d/<yourWebsiteConfigFile>.conf
``` 
Remember to put .conf as extension of the file. Further you need to
store the directory that must be hosted in /var/…/www

## Certificates 

## Using Let's Encrypt & Nginx

The first step to using Let’s Encrypt to obtain an SSL certificate is to install the
```certbot``` software on your server. You can obtain the certbot-nginx package by typing:

``` sh
sudo yum install certbot-nginx
```

The certbot Let’s Encrypt client is now installed and ready to use.

### Setting up Nginx

Then, start Nginx using systemctl:

``` sh
sudo systemctl start nginx
```

Certbot can automatically configure SSL for Nginx, but it needs to be able to find the
correct server block in your config. It does this by looking for a server_name directive
that matches the domain you’re requesting a certificate for. If you’re starting out with a
fresh Nginx install, you can update the default config file using vi or your favorite 
text editor:

``` sh
sudo vi /etc/nginx/nginx.conf
```
Find the existing server_name line: /etc/nginx/nginx.conf

``` sh
server_name <yourDomainName>;
```
Replace the <yourDomainName> with your domain name, such as:

``` sh
server_name example.com www.example.com;
```
Save the file and quit your editor. If you are using vi, enter :x, then y when prompted,
to save and quit. Verify the syntax of your configuration edits with:

``` sh
sudo nginx -t
```

If that runs with no errors, reload Nginx to load the new configuration:

``` sh
sudo systemctl reload nginx
```
Certbot will now be able to find the correct server block and update it.
Now we’ll update firewall to allow HTTPS traffic.

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

### Obtaining a Certificate
Certbot provides a variety of ways to obtain SSL certificates, through various plugins.
The Nginx plugin will take care of reconfiguring Nginx and reloading the config whenever
necessary:

``` sh 
sudo certbot --nginx -d example.com -d www.example.com
```

This runs certbot with the --nginx plugin, using -d to specify the names we’d like the certificate to be valid for.

If this is your first time running certbot, you will be prompted to enter an email 
address and agree to the terms of service. After doing so, certbot will communicate
with the Let’s Encrypt server, then run a challenge to verify that you control the
domain you’re requesting a certificate for. The configuration will be updated, and
Nginx will reload to pick up the new settings. certbot will wrap up with a message
telling you the process was successful and where your certificates are stored:
Your certificates are downloaded, installed, and loaded. Try reloading your website using https:// and notice your browser’s security indicator. It should represent that the site is properly secured, usually with a green lock icon.

Step 5 — Setting Up Auto Renewal
Let’s Encrypt’s certificates are only valid for ninety days. This is to encourage users to automate their certificate renewal process. We’ll need to set up a regularly run command to check for expiring certificates and renew them automatically.

To run the renewal check daily, we will use cron, a standard system service for running periodic jobs. We tell cron what to do by opening and editing a file called a crontab.

sudo crontab -e
Your text editor will open the default crontab which is an empty text file at this point. Paste in the following line, then save and close it:

crontab
. . .
15 3 * * * /usr/bin/certbot renew --quiet
The 15 3 * * * part of this line means “run the following command at 3:15 am, every day”. You may choose any time.

The renew command for Certbot will check all certificates installed on the system and update any that are set to expire in less than thirty days. --quiet tells Certbot not to output information or wait for user input.

cron will now run this command daily. All installed certificates will be automatically renewed and reloaded when they have thirty days or less before they expire.



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
