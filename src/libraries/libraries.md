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
