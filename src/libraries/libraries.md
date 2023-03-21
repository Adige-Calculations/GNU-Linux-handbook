# Library

## .a   -   Static library

An A file contains a library of functions and headers that may be referenced by a C/C++ source file.
It may store only a few functions or may include an entire library of functions, such as a 3D modeling engine.
A files are typically created by the GNU ar utility.

## .so  -   Shared library

An SO file is a shared library used by programs. It contains common programme functions and logic that multiple
programs require access to. SO files allow programs to access common functions from one shared place in a computer's
system memory, rather than implementing their own versions of the functions. This streamlines the programs' structure
as well as their interaction with users' operating systems.

SO files often reside in the following Linux directories:


- ```/lib```
- ```/usr/lib```
- ```/usr/local/lib```

C and C++ programs installed on the Linux and Android operating systems most commonly use SO files. Developers often 
build SO files using the "gcc" C/C++ compiler included in the GNU Compiler Collection (GCC).

Use the command:

```sh
nm -D path/to/filename.so.
```

to view a list of the functions an SO file contains.

##  .o   -  Object

An O file is a compiled C program object. Some C compilers create O files during the executable creation
process. O files themselves are typically not executable.

When compiling a C program, compilers first transform all the program's source code files into compiled
object files. The compiler then links the compiled object files into an executable file.

C and C++ compilers, often create, reference, and use O files during the program compilation process.

# Libraries workflows

A mention to the C compiler is worthwhile.

Working from ```~```, create a```~/add.c``` file with a function in it, such as:

```c
#include "add.h"

double add(double a, double b) {
	return(a + b)
}
```
With a similar headerfile ```~/add.h```

```h
double add(double x, double y)
```

and with a main source file ```main.c``` like

```c
#include <stdio.h>
#include "add.h"

double addition_result = add(double 1., double 2.)
std::cout << addition_result << std::endl;
```
## Create and use a static library

Then treat this library file (```~/add.c```) as a common source file:

```sh
g++ -c add.cpp -o add.o
```

The -c flag is indicating that you want to compile but not link the file to anything else.


### Wrap the output file as a static library.

In Linux/GNU systems, it involves using the ```ar``` application (an archive utility tool) to create the static library file (.a : archive file)
such as:

```sh
ar -cr libmymath.a add.o
```

The -cr flag is to indicate creating a new static library file.

> Notice the name of output is “libmymath.a”. It is a convention to name the file libXXX.a. When the library is used, the compiler  relies on this convention for the linker to work properly.

### Link the library

Compile the main c file into an object file as follwows and link it to the static library to create final executable with the library embedded into it:

```sh
g++ main.cpp libmymath.a -o final_executable

# A more explicit and preferred  way to link a library is:
g++ main.cpp -L. -lmymath
```

The flag (-L) is used to explicitly specify the library path while (-l) the library name, as convetion the lib prefix is expressed in this way.

### Delete the library for verification

We can verify that the library has been copied into the executable by deleting the library
and running:

```
rm lib_mymath.a 
./a.out
```

## Create and use a dynamic library

Similar to static library, create an object file:

```sh
g++ -c my_math.cpp -o my_math.o
```

Then create a shared object out of it 

```sh
g++ -shared -o libmymath.so my_math.o
```

and either move the .so file into the library path, or enlarge the existing one:

```
export LD_LIBRARY_PATH="/path/to/your/project/root:$LD_LIBRARY_PATH"
```

Create the executable:

```sh
g++ main.o -L. -lmymath -o final_executable
```

# Dynamic library

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

## Advantages and Limitations

Dynamic libraries have several advantages over static libraries:

- The executabel take up less space, because multiple programs can share the same copy of the library.
- They are easier to update, because you only have to update the library file itself instead of rebuilding all the programs that use it.
- They allow programs to use new functionality without being recompiled, as long as the interface to the library remains the same.

Dynamic libraries also have some disadvantages:

- They can cause runtime errors if the library file is not found or is incompatible with the program.
- They can be slower to load than static libraries, because they need to be loaded into memory at runtime.

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
