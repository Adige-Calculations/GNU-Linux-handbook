# PETSc

To compile a programme that include the usage of the library:

```sh
PETSC_DIR=$HOME/software/petsc
PETSC_ARCH=linux-gnu-c-debug

# load appropriate modules  (e.g. openmpi)
mpicc -I${PETSC_DIR}/include -I${PETSC_DIR}/${PETSC_ARCH}/include \
      -L${PETSC_DIR}/${PETSC_ARCH}/lib \
      -o test_main \
      main.c
```

For VS Code user that uses the C/C++ extension for static analysis, few modification should 
take place to index files/programme correctly on ```./.vscode/c_cpp_properties```:

```json
{
    "configurations": [
        {
            "name": "PETSc",
            "includePath": [
                "${workspaceFolder}/**",
                "/home/user/Projects/petsc/linux-gnu-c-debug/include",
                "/home/user/Projects/petsc/include"
            ],
            "compilerPath": "/usr/lib64/openmpi/bin/mpicc",
            "intelliSenseMode": "linux-gcc-x86",
        }
    ],
}
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