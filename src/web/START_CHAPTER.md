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

## HTTP Verbs
There are 4 basic HTTP verbs we use in requests to interact with resources in a REST system
(architectural style for providing standards between computer systems on the web):

GET — retrieve a specific resource (by id) or a collection of resources
POST — create a new resource
PUT — update a specific resource (by id)
DELETE — remove a specific resource by id

For each HTTP verb, there are expected status codes a server should return upon success:

GET — return 200 (OK)
POST — return 201 (CREATED)
PUT — return 200 (OK)
DELETE — return 204 (NO CONTENT) If the operation fails, return the most specific status code possible corresponding to the problem that was encountered.

<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../footers/footer.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
