# Environment management

Especially in HPC environments, the system is clogged with applications and libraries that cannot be all included at the same
time into an environment path in a mantainable way. A way to include only a necessary portion of paths is via the ```lmod``` utility:

## lmod (Environmental module system)

```lmod``` provides a convenient way to dynamically change a user's environment through modulefiles.

-----------------------------------------------------------------------------------

A modulefile contains the necessary information to allow a user to run a particular application or provide access to a particular library.
This includes easily adding or removing directories to the PATH environment variable.

- Modulefiles for applications modify the user's path to make access easy.
- Modulefiles for Library packages provide environment variables that specify where the library and header files can be found.

### Usage 
 
Check which modules are loaded into the system:

```sh
module list
```

Check which module are available to the system:
```sh
module avail
```
To get an overview of the environment modifications, run:

```sh
module show <module_name>
```

### Adding modulefile

To write a custom loadable environment you can add a ```modulefile```. These file must be present on MODULE_PATH following:

```sh
touch $MODULE_PATH/<modulefile_name>.lua
```

The content of the modulefile you state should look similar to:

```sh
help([[
For detailed instructions, go to:
   https://...

]])
whatis("Version: 5.0.1")
whatis("Keywords: System, Utility")
whatis("URL: http://content.allinea.com/downloads/userguide.pdf")
whatis("Description: Parallel, graphical, symbolic debugger")

setenv(       "DDTPATH",        "/opt/apps/ddt/5.0.1/bin")
prepend_path( "PATH",           "/opt/apps/ddt/5.0.1/bin")
prepend_path( "LD_LIBRARY_PATH","/opt/apps/ddt/5.0.1/lib")
```

Loadable with:

```sh
module load <modulefile_name>
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
