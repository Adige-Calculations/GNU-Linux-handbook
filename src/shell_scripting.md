# Shell scripting

The first line to initialize shell script tells at the system which shell 
environment has to be used. The following code snippet calls a ```bash``` interpreter.

```sh
#!/bin/bash

... # bash code
```

This code can be either sourced or execuded.

### source 

When we call ```source``` we means that the contents of 
the file are read and executed in the current shell environment. 
```source``` is designed to work with shell scripts (such as those written in bash)
and not directly with scripts written in other languages like Python.

### shell execution

While when we directly execute with the shell, we run a separate process with its own environment.

-------------------------------------------------------------

As example, the following call a python interpreter:

```sh
#! /usr/bin/python

... # pyhton code 
```

And it can only be executed, not sourced.

When you try to use the ```source``` utility on a shell script that has Python code, it will 
likely result in a syntax error because the Python interpreter does not understand the 
source command or the shell-specific syntax used in the script.

To summarize, execution runs a script or command as a separate process, while sourcing reads
and executes the contents of a file in the current shell session, allowing the changes to 
directly affect the current environment.

## Shell variables

Regarding a shell script written in bash, variables can be expressed as:

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

String quotes have different effect on how the text is interpreted.

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
  $("#footer").load("../footers/footer.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
