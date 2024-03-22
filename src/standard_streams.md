# Standard streams

Strandard stream allows the machine to interact with the external periferals. Hence they are file that represents streams 
stored usually in the ```/dev``` (device) directory. They can handle input, output and error streams produced by the 
processes i.e.

- Standard input|STDIN - file handle that your process reads to get information from you i.e. keyboard or mouse input.
- Standard output|STDOUT - your process writes conventional output to this file handle.
- Standard error|STDERR - your process writes diagnostic output to this file handle.

<b> That's mostly by convention </b>. 

## Examples

```sh
executable   <inputfile.txt    2>errorfile.txt  |  grep nice_work
```

which will:

- create a process for ```executable```.
- open ```./inputfile.txt``` as your standard input (file handle 0).
- open ```./errorfile.txt``` as your standard error (file handle 2).
- create another process for ```grep```.
- attach the standard output of ```executable``` to the standard input of ```grep```.

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
