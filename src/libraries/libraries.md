# Library

A library is code enclosed in external files, which contains functionality to be included in a new codebase.
A library can be source code or precompiled. Regarding the C programming language, the source code can be a compilaion target
for a static or dynamic library

## .a   -   Static library

An archive```.a``` file contains a library of functions and headers that may be referenced by a C/C++ source file.
It may store only a few functions or may include an entire library of functions.
Archive files are typically created by the GNU ```ar``` utility.

## .so  -   Shared Object  |  dynamic library

A shared object ```.so``` file is a shared library used by programs. It contains common
programme functions and logic that multiple programs require access to, ```.so``` files 
allow programs to access common functions from one shared place in a computer's system memory,
rather than implementing their own versions of the functions.

Dynamic library files (```.so```) often reside in the following Linux directories:

- ```/lib```
- ```/usr/lib```
- ```/usr/local/lib```

> Dynamic libraries are loaded at runtime, which means that they are not linked
into a program at compile time like static libraries.

### System operation on library files

To view a list of the functions an ```.so``` file contains, use:

```sh
nm -D path/to/filename.so
```

To understand the dynamic library that an executable requires you can run:

```sh
ldd </path/to/executable>
```

Which will print all shared object dependencies.

## Advantages and limitations

Dynamic libraries have several advantages over static libraries:

- The executabel take up less space, because multiple programs can share the same copy of the library.
- They are easier to update, because you only have to update the library file itself instead of rebuilding all the programs that use it.
- They allow programs to use new functionality without being recompiled, as long as the interface to the library remains the same.

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
