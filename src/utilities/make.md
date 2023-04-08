# Make

```make``` is a build system, designed to automate tasks. It reads a ```Makefile``` which is structured as follows, remember that indentation matter. A ```Makefile``` follows this pattern: 

```makefile
final_executable: main.c
	$(CC) main.c -o final_executable -Wall -Wextra -pedantic -std=c99
```

Where the first line says that ```final_executable``` is what we want to build, and that ```main.c``` is what is required to build it. The second line specifies the command to run in order to actually build ```final_executable``` out of ```main.c```.
Looking at the flags:

```sh
- ```$(CC)``` is a variable that make expands to cc by default.
- ```Wall``` stands for all warnings,
- ```Wextra``` and ```pedantic``` turns pon even more warning 
- ```std=c99``` sspecifies the standard
```

## Makefile

A dive in into the ```make``` utility is useful to understand the step to compile a library/programme. Another example is:

```makefile
final_executable: libmymath.so main.o
	g++ main.o -L . -l_mymath -o final_executable

lib_mymath.so: my_math.o
	g++ -shared -o libmymath.so my_math.o

my_math.o: mymath.cpp
	g++ -c my_math.cpp -o my_math.o

main.o: main.cpp
	g++ -c main.cpp -o main.o

clean:
	rm -r main.o my_math.o
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