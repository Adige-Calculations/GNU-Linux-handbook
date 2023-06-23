# Menu icons

To add an icon into the menu, a ```.desktop``` file must be created usually at one of this location:

- /usr/share/applications/```new icon```.desktop
- /usr/local/share/applications/```new icon```.desktop

Here it is an example of how to set the menu icon for ParaView, an open source data visualization application

```toml
[Desktop Entry]
Version=1.0
Type=Application
Name=ParaView
Comment=Parallel visualization application
Exec=/opt/ParaView-5.11.0-MPI-Linux-Python3.9-x86_64/bin/paraview
Icon=/opt/ParaView-5.11.0-MPI-Linux-Python3.9-x86_64/share/paraview-5.11/web/glance/www/ParaView.svg
StartupWMClass=paraview
Categories=DataVisualization;
```
The icon will appear once the file is saved.

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
