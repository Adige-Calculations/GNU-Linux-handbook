# Different package version

Sometimes the need for a different package version arise. The best way to 
deal with is with the usage of the package manager ```spack```. 
```spack``` is non-destructive, that's imply that installing a new version 
does not break existing installations, so many configurations can coexist 
on the same system.

## Spack installation

Designed for HPCs, where users share common installations of 
software with exotic architectures, using libraries that do not 
have a standard Application Binary Interface (ABI). To install it follwows:

```sh
git clone https://github.com/spack/spack.git
source ~/spack/share/spack/setup-env.sh        # Shell support for bash/zsh
```

Sourcing will place ```spack``` command in your ```PATH```, set up your 
```MODULEPATH``` to use Spack's packages, and add other useful shell integration 
for certain commands, environments, and modules. To install an application 
(i.g. ```gcc```):

```sh
spack info gcc
spack install gcc@12.1.0 # We are installing a specific version
```

Then load and run the binary as follow:

```sh
spack load gcc@12.1.0  # Loading the module
gcc --version
```

> If you don’t specify the version of a package, Spack will install the 
> default version of that package.


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
