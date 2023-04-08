# MPI (Message Passage Interface)

Here it is presented an example on how to set yup a Fedora system with MPI compilers, using ```module```  (from the ```lmod``` package).

To use use the OpenMPI compilers (mpicc, mpic++, etc.) and consequently usingh  the ```mpirun``` utility,
you’ll need to install the openmpi package as well as set up the envionrment paths correctly (using ```module```).

To install:

```sudo dnf install openmpi openmpi-devel```

Then to set up the ```lmod``` correctly so that PATH is set, you have to source the environment modules program installed by default on Fedora:

```source /etc/profile.d/modules.sh```

Now you can load in the OpenMPI module

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
