# Basic Linear Algebra Subprograms (BLAS) and Linear Algebra PACKage LAPACK

First, you have to install BLAS before LAPACK, because LAPACK needs it. Download the packages from the following websites.

BLAS, see http://www.netlib.org/blas/
LAPACK, see http://www.netlib.org/lapack/

At the writing time:

```sh
# BLAS source code location
wget http://www.netlib.org/blas/blas-3.11.0.tgz                   
```

## Compile BLAS library and manage the output
 
Switch to the BLAS folder and execute:

```sh
make
```
to compile all fortran files. After that rename the created library.

```sh
mv blas_LINUX.a libblas.a
```
After creating the library called ```libblas.a```, copy that file to your library folder
by executing the following command

```sh
sudo cp libblas.a /usr/local/lib/
```
The above directory can be replaced by any library path in your systems.

## Compile LAPACK library and manage the output

Then switch to the LAPACK directory and adjust the file “make.inc” if necessary.
After setting all parameters correctly, type the command

```sh
make
```
Now, you created a library e.g. called “lapack_MACOS.a”. Copy that file to your library folder 
by executing

```sh
sudo cp liblapack.a /usr/local/lib/
```

Congratulation, you’ve installed BLAS and LAPACK on your systems!

Note: when using C++, do not forget to point out your search directory for header files with 
option “-I”, and add your library path with “-L” for libraries with “-l” if the search paths
for the header files and libraries are not included.

