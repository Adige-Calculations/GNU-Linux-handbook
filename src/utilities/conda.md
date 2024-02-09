# Conda

Conda is a general purpose package manager widely used in the scientific community.
Other than that, it serves as an envirnoment management tool to provide encapslutated environment 
where specific programmes, variables and libraries are defined.

To check the presence of Conda environment execute:

```sh
conda info --envs
```

Then to activate one of them with:

```sh 
conda activate <environment_name>
```

## C/C++ develpment with Conda

An example of how to use Conda to get a C/C++ development environment.
------------------------------------------------------------------------------------------------

Package managers usually focus on delivering the libraries that we use in our project, but there 
are actually many more, they can be useful at different time and for different purposes (non exclusively):

- to build (compile) our project,
- to run our project (our executable our library),
- to test our project,
- to benchmark our project,
- to generate the documentation for our project,
- to perform quality analysis of our project (e.g. code check and formatting).


### Example creation C dev environment

Create a file called ```environment.yaml``` as follows:

```yml
channels:
  - conda-forge
dependencies:
  - cxx-compiler
  - make
  - cmake
  - boost-cpp
```

Then create and activate the environemnt:

```sh
conda env create --name c_dev --file environment.yaml
conda activate c_dev 
```
If you would like to check what is installed in the environment:

```sh
conda list 
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
  $("#footer").load("../../footers/footer.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
