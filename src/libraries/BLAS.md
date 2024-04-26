# Linear Algebra BLAS/LAPACK

LAPACK is written such that the majority of the computation is performed 
by calls to the Basic Linear Algebra Subprograms (BLAS) 

> Basic Linear Algebra Subprograms (BLAS) and Linear Algebra PACKage (LAPACK)

As a consequence, you need to install BLAS before LAPACK. Download the packages from 
the following websites.

- BLAS: http://www.netlib.org/blas/
- LAPACK: http://www.netlib.org/lapack/

Locate BLAS Library

## Check installation 

The first step is to determine where is the BLAS library on your system. Use 
the command ```locate libblas.so``` to find the library. If several results 
are reported, look for the version usually under ```/usr/lib/``` or 
```/usr/lib64``` or something similar to that path. For example, on my machine
the library is located at /usr/lib/libblas.so. That location is most likely a
symbolic link to another location in your filesystem. 

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
BLAS and LAPACK are then installed on your system.

> When dealing with C/C++ compilation, do not forget to point out your search
> directory for header files with option “-I”, and add your library path with 
> “-L” for libraries with “-l” if the search paths for the header files and 
> libraries are not included.

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