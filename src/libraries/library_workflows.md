# Libraries workflows

A mention to the GNU C Compiler (```gcc```) is worthwhile.
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
gcc -c add.cpp -o add.o
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
gcc main.cpp libmymath.a -o final_executable

# A more explicit and preferred  way to link a library is:
gcc main.cpp -L. -lmymath
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
gcc -c my_math.cpp -o my_math.o
```

Then create a shared object out of it 

```sh
gcc -shared -o libmymath.so my_math.o
```

and either move the .so file into the library path, or enlarge the existing one:

```
export LD_LIBRARY_PATH="/path/to/your/project/root:$LD_LIBRARY_PATH"
```

Create the executable:

```sh
gcc main.o -L. -lmymath -o final_executable
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
