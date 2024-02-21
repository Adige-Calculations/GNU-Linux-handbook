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

There are 4 basic and of common usage HTTP verbs for having interactions over a network that supports 
a REST system (architectural style for providing standards between machines):

- GET — retrieve a specific resource (by id) or a collection of resources
- POST — create a new resource
- PUT — update a specific resource (by id)
- DELETE — remove a specific resource by id

For each HTTP verb, there are expected status codes a server should return upon success:

- GET — return 200 (OK)
- POST — return 201 (CREATED)
- PUT — return 200 (OK)
- DELETE — return 204 (NO CONTENT) 
 
If operations fail, the return status code should be specific to the problem that was encountered.

Other less common verbs are :

> REST APIs act on top of the HTTP protocol hence the possile actions that is possible to communicate are:

- GET: The GET method requests a representation of the specified resource. Requests using GET should only retrieve data.
- HEAD: The HEAD method asks for a response identical to a GET request, but without the response body.
- POST: The POST method submits an entity to the specified resource, often causing a change in state or side effects on the server.
- PUT: The PUT method replaces all current representations of the target resource with the request payload.
- DELETE: The DELETE method deletes the specified resource.
- CONNECT: The CONNECT method establishes a tunnel to the server identified by the target resource.
- OPTIONS: The OPTIONS method describes the communication options for the target resource.
- TRACE: The TRACE method performs a message loop-back test along the path to the target resource.
- PATCH: The PATCH method applies partial modifications to a resource.

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
