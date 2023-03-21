# ENVIRONEMT VARIABLE and EXECUTION PATH

Execution path and library location path are essential address to permit the system to find
a programme or a shared library

```
echo $LD_LIBRARY_PATH
```

will return the paths where the system will search for shared objects.
To add a custom path run for a new library location run:

```sh
export LD_LIBRARY_PATH="/path/to/new/lib_newlibrary:$LD_LIBRARY_PATH"
```

#Static library 

## Create and use a static library

Create an ```add.cpp``` file with a function in it, such as:

```c++
double add(double a, double b) {
	return(a + b)
}
```

Then treat this file as a common source file:

```sh
g++ -c add.cpp -o add.o
```

The -c flag is indicating that you want to compile but not link the file to anything else.

### Wrap output as a static library.

It involves using ```ar``` (a Linux archive utility tool) to create the static library file (.a : archive file)

```sh
ar -cr lib_mymath.a add.o
```

The -cr flag is to indicate creating a new static library file.
> Notice the name of output is “libmymath.a”. It is a convention to name the file libXXX.a in Linux. When the library is used, the command line tool actually relies on this convention for the linker to work properly.

### Link the library

```sh
g++ main.cpp lib_mymath.a -o final_executable

# A more explicit and preferred  way to link a library is:
g++ main.o -L . -l_mymath
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
g++ -shared -o lib_mymath.so my_math.o
```

and either move the .so file into the library path, or enlarge the existing one:

```
export LD_LIBRARY_PATH="/home/mattia/repo/delete/:$LD_LIBRARY_PATH"
```

Create the executable:

```sh
g++ main.o -L . -l_mymath -o final_executable
```
## Makefile

An introduction at the ```make``` utility is usefull to understand the step to compile a library/porogramme:

```makefile 
final_executable: lib_mymath.so main.o
	g++ main.o -L . -l_mymath -o final_executable

lib_mymath.so: my_math.o
	g++ -shared -o lib_mymath.so my_math.o

my_math.o: my_math.cpp
	g++ -c my_math.cpp -o my_math.o

main.o: main.cpp
	g++ -c main.cpp -o main.o

clean:
	rm -r main.o my_math.o
```