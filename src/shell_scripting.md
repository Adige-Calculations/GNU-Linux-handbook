# Shell scripting

First line to initialize shell script is:

```bash
#!/bin/bash
```

## Variables

```sh
name="John"
echo $name  # see below
echo "$name"
echo "${name}!"
```

Generally quote your variables unless they contain wildcards to expand or command fragments.

``` sh
wildcard="*.txt"
option="iv"
cp -$options $wildcard /tmp
```

## String quotes
``` sh
name="John"
echo "Hi $name"  #=> Hi John
echo 'Hi $name'  #=> Hi $name
```

## Conditional execution

```sh
git commit && git push
git commit || echo "Commit failed"
```

## Functions

```sh
get_name() {
  echo "John"
}

echo "You are $(get_name)"
```
# Cycles

```bash
#!/bin/bash

for region in $(foamListRegions solid);
do
    <commands>;
done
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
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
