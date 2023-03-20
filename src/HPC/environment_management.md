# Environment management

Often in HPC environments, the system is clogged with applications and libraries that cannot be all included at the same time into an exec path
in a mantainable way. A way to include only the necessary portion to it is via the ```lmod``` utility:

## LMOD (Environmental module system)

LMOD provides a convenient way to dynamically change a user's environment through modulefiles.



A modulefile contains the necessary information to allow a user to run a particular application or provide access to a particular library.
This includes easily adding or removing directories to the PATH environment variable.

- Modulefiles for applications modify the user's path to make access easy.
- Modulefiles for Library packages provide environment variables that specify where the library and header files can be found.

### Usage 
 
Check which modules are loaded into the system:

```sh
module list
module overview
```

Check which module are available to the system:
```sh
module avail
```
For example, if the command is executed,

```sh
module show mpi
```

it will return what a modulefile is doing:

```sh
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   /usr/share/modulefiles/mpi/openmpi-x86_64:
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
conflict("mpi")
prepend_path("PATH","/usr/lib64/openmpi/bin")
prepend_path("LD_LIBRARY_PATH","/usr/lib64/openmpi/lib")
prepend_path("PKG_CONFIG_PATH","/usr/lib64/openmpi/lib/pkgconfig")
prepend_path("MANPATH",":/usr/share/man/openmpi-x86_64")
setenv("MPI_BIN","/usr/lib64/openmpi/bin")
setenv("MPI_SYSCONFIG","/etc/openmpi-x86_64")
setenv("MPI_FORTRAN_MOD_DIR","/usr/lib64/gfortran/modules/openmpi")
setenv("MPI_INCLUDE","/usr/include/openmpi-x86_64")
setenv("MPI_LIB","/usr/lib64/openmpi/lib")
setenv("MPI_MAN","/usr/share/man/openmpi-x86_64")
setenv("MPI_PYTHON3_SITEARCH","/usr/lib64/python3.10/site-packages/openmpi")
setenv("MPI_COMPILER","openmpi-x86_64")
setenv("MPI_SUFFIX","_openmpi")
setenv("MPI_HOME","/usr/lib64/openmpi")
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
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
