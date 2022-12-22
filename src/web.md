# Web

The web communication work thanks to a procol implementation: HTML.
Which stands for Hyper Text Tranfer Protocol.

## HTTP

A “Protocol” is a definition of behaviour between entities, in this case
client and server.

“Protocol Transfer” stands for defining the rules of communication with
the purpose of transferring data.

“Hyper Text Tranfer Protocol” define a protocol to transfer hyper text

An http connection is stateless, which means there is no record of
previous interaction, if you want to keep the login state you need to
include your login data at every request (on the Header) from a client
point of view.
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
