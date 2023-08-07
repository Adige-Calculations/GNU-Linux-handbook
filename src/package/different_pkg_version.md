# Different package version

Sometimes the need for a different package arise, the best way to deal with it is
with the ```spack``` package manager. ```spack``` is non-destructive: installing a new 
version does not break existing installations, so many configurations can coexist 
on the same system.

## spack

Designed for large supercomputing centers, where users share common installations of 
software with exotic architectures, using libraries that do not have a standard  
Application Binary Interface (ABI). To install the application:

```sh
source ~/spack/share/spack/setup-env.sh
spack info gcc
spack install gcc@12.1.0
```

Then to run the app follow:

```sh
source ~/spack/share/spack/setup-env.sh
spack load gcc@12.1.0
gcc --version
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
