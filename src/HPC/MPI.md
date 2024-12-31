# MPI (Message Passage Interface)

MPI is a popular library for distributed-memory parallel programming
in SPMD (single program, multiple data) style.

MPI offers both point-to-point message passing and group communication
operations (broadcast, scatter/gather, etc).

Several implementations of MPI are available (OpenMPI, MPICH, InteMPI, etc...).

### Compilation:

Regular applications

```sh
gcc test.c -o test
```

MPI applications:

```sh
mpicc test.c -o test
```
### Execution:

Regular applications

```sh
./test
```

MPI applications (running with 16 processes):

```sh
mpiexec –n 16 ./test
```

## System setup

Here it is presented an example on how to set up a Fedora system with MPI compilers wrapper.
you’ll need to install the openmpi package, as well as set up the envionrment paths correctly
(the ```module``` utility becomes handy).

To install a packaged library:

```sudo dnf install openmpi openmpi-devel```

Now you can load in the OpenMPI module, prepared as indicated by the [lmod utility](https://gnulinux-handbook.adigecalculations.com/HPC/environment_management.html)


```module load mpi/openmpi-x86_64```

With the module now loaded the system environment is modified, so you can use the compiler tools and runner. Do note that you’ll have to source and load the OpenMPI module
for every shell you open unless you add it within ```$HOME/.bashrc```.


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
