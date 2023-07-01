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

## Channel

Conda-Forge is a community driven Conda channel (packages repository) and set of tools to build and update packages.

## C++ develpment with Conda

An example of how to use Conda to get a C/C++ development environment.
------------------------------------------------------------------------------------------------

Package managers usually focus on delivering the libraries that we use in our project, but there are actually many more tools that we use in our development. 

They are needed at different time and for different purposes (non exclusively):

- to build (compile) our project,
- to run our project (our executable our library),
- to test our project,
- to benchmark our project,
- to generate the documentation for our project,
- to perform quality analysis of our project (e.g. code check and formatting).

Following are useful packages, all available on Conda-Forge, that we may need to work on our C/C++ project.

- A C, C++, and Fortran compiler, along with their standard libraries, and binary toolchain (linker, archiver…).
- Various build tools, such as CMake, Make, Ninja, and Bazel.
- CCache and SCCache compiler caches.
- Header only libraries, such as Xtensor, or dynamic libraries such as TBB, multiple BLAS and LAPACK implementations, OpenMP, GMP, Zlib, Boost, and Fmtlib.
- The Conan C/C++ package manager, if you need an additional source of libraries, or if you are working to make yours compatible with it.
- Testing frameworks, such as GoogleTest and Catch.
- Benchmark framework such as Google Benchmark.
- Doxygen, possibly with Sphinx and Breathe if you prefer that toolset.
- The Clangd C/C++ language server for your editor.
- Clang-Tidy and CppCheck to verify code; Clang-Format to format it.
- Pre-Commit to run check automatically. Notice that this is a Python package, but because Conda is a general purpose package manager, it will autmatically get a compatible Python interpreter without additional input.
- Many more utilities, such as Git, Hub, Wget.
- Scripting langages, including Python, Perl, Bash if you have custom scripts.
- Language binding libraries, such as Cython, Pybind, Rcpp, and LibCxxWrap.
- The Singularity containerization solution.


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
