# Dynamic library dependencies

A dynamic library, also known as a shared library, is a file that contains compiled code and 
data that can be used by multiple programs at the same time. Dynamic libraries are loaded at 
runtime, which means that they are not linked into a program at compile time like static libraries.

To understand the dynamic library that an executable requires you can run:

```sh
ldd </path/to/the/executable>
```

Which will print all shared object dependencies. Dynamic libraries are often used to provide common functionality 
that is needed by multiple programs, such as system functions, graphical user interface (GUI) libraries, and database
connectivity libraries. In Unix like system, dynamic libraries have the file extension .so (shared object), while in 
Windows they have the extension .dll (dynamic-link library).

## Advantages and Limitations of Shared library

Dynamic libraries have several advantages over static libraries:

- The executabel take up less space, because multiple programs can share the same copy of the library.
- They are easier to update, because you only have to update the library file itself instead of rebuilding all the programs that use it.
- They allow programs to use new functionality without being recompiled, as long as the interface to the library remains the same.

Dynamic libraries also have some disadvantages:

- They can cause runtime errors if the library file is not found or is incompatible with the program.
- They can be slower to load than static libraries, because they need to be loaded into memory at runtime.

# Check object files

To list symbol names in object files, you can use the 

```sh
nm file.o
```

to list function symbol and respective definition of object files.
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