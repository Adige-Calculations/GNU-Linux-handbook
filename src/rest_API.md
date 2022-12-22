# REST API

A REST API (Representational State Transfer API) is a type of API that follows a set of architectural principles for building web services. 
REST APIs use HTTP methods (such as GET, POST, PUT, DELETE) to define the operations that can be performed on resources. Each resource is 
identified by a unique URL, and the API defines the operations that can be performed on that resource and the data that can be exchanged.


An API can be considered REST when it respects the below constrains.


- Statelessness: REST APIs are stateless, which means that they do not store client state in the server. This allows the API to be more scalable, because it does not need to maintain a session state for each client. 
- Cacheability: REST APIs are designed to be cacheable, which means that they can be stored in a cache and reused to reduce network traffic and improve performance. 
- Layered system: REST APIs can be used by multiple clients and servers, and they can be layered on top of each other to create a distributed system. 

REST APIs are often used to build APIs for web-based applications, mobile apps, and other systems that need to access data or services over the Internet. They are popular because they are easy to use and understand, and they are widely supported by a variety of platforms and tools.

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
