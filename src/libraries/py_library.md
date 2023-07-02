# Python library

A python library can be source code (to be interpreted) or precompiled. To call a library, it is used the
```import XXX``` keyword. The ```python``` utility will look in several location for several files.

-  A file named ```XXX.py``` or ```XXX/__init__.py``` in the directory where ```python``` is run. 
-  A file named ```XXX.py``` or ```XXX/__init__.py``` in the ```PYTHONPATH``` environment variable, if it is set.
-  A file named ```XXX.py``` or ```XXX/__init__.py``` in an installation-dependent list of directories configured at the time Python is installed

The last one is where external library are stored usually, to check where the file actually is use the ```sys``` python module:

```sh
python 
>>> import dolfinx
>>> dolfinx.__file__
'/home/mattia/miniconda3/envs/fenicsx-env/lib/python3.10/site-packages/dolfinx/__init__.py'
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
