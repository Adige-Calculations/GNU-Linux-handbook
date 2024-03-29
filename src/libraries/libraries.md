# Libraries

A library is code enclosed in external binary files, which contains functionality to be included in a different programme. 
With a focus on the C programming language, the source code can be a compilaion target for: 

- Static library  
- Dynamic library
- Executable

## .a   -   Static Library

An archive ```.a``` file contains a library that may contain few functions or include an entire library of functions.
Archive files are typically created by the GNU ```ar``` utility. They are used as a compilation artifact and consequently 
embedded inside the target binary. The final binary that get produced from this libraries does not depend on the ```.a```
to work. 

## .so  -   Shared Object  |  Dynamic Library

A shared object ```.so``` file is a shared library used by programs. It contains common
programme functions and logic that multiple programs require access to, ```.so``` files 
allow programs to access common functions from one shared place in a computer's system memory,
rather than implementing their own versions of the functions. <b> They must be present in the system
and reachable from the linked ```ld```. </b>

> Dynamic libraries are loaded at runtime, which means that they are not linked into a program at compile time 
> like static libraries.

### What's inside a library files

To view a list of the functions an ```.so``` file contains, use:

```sh
nm objectfile.o
nm -D path/to/filename.so
```

To understand the dynamic libraries that an executable requires you can run:

```sh
ldd </path/to/executable>
```

Which will print all shared object dependencies.

## Where are the libraries?

Libraries manageg by package managerts are usually installed at ```LD_LIBRARY_PATH```. To see it:

```sh
echo $LD_LIBRARY_PATH
```

Often resulting into the following directories:

- ```/lib```
- ```/usr/lib```
- ```/usr/local/lib```

While to add locations execute:

```sh
export LD_LIBRARY_PATH="/path/to/your/nanaged/library/directory:$LD_LIBRARY_PATH"
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
  $("#footer").load("../footers/footer.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
