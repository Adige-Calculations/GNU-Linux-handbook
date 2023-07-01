# Utilities

A list of a useful software for UNIX like environment. For more complex tools follow the 
continuation of this chapter.

## tldr

Abbreviation for "Too Long; Didn't Read"; it will return a better man page.
It return a coincise manual page, with suggestion and brief explanation of the utility you are
searching for.

```sh
ltdr <utilityName>
```

## curl 

Which stands for "Client for URL (Uniform Resource Locator)". It transfers data from 
or to a server. Supports most protocols, including HTTP, FTP, and POP3. For example 
to test a REST-API you can run:

```sh 
curl https://pokeapi.co/api/v2/pokemon/ \> pokemon_return_rest_api.json
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
