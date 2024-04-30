# Make

```make``` is a build system, designed to automate tasks. It reads a ```Makefile``` which is structured as follows, remember that indentation matter. A ```Makefile``` follows this pattern: 

```sh
final_executable: main.c
	$(CC) main.c -o final_executable -Wall -Wextra -pedantic -std=c99
```

Where the first line says that ```final_executable``` is what we want to build, and ```main.c``` is required to be present to start 
the build procedure. The second line specifies the command to run in order to actually build ```final_executable``` out of ```main.c```.
Looking at the flags:

```sh
- ```$(CC)``` is a variable that make expands to cc by default.
- ```Wall``` stands for all warnings,
- ```Wextra``` and ```pedantic``` turns pon even more warning 
- ```std=c99``` sspecifies the standard
```

### Makefile

A dive in into the ```make``` utility is useful to understand the step to compile a library/program. An example of a ```Makefile``` follows:

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

There are lots of different makefile solutions but a simple config might look like the follows:

```makefile
SRCS = main.o mario_game.o sprites.o sfx.o
OBJS = $(SRCS:.cpp=.o)
EXE = mario_game

$(EXE): $(OBJS)
    $(CC) $(CFLAGS) -o $(EXE) $(OBJS)

.cpp.o:
    $(CC) $(CFLAGS) -c $< -o $@
```

## Overcoming Make weirdness

The .PHONY target is a special target that is used to specify a list of counterfait targets.
Phony targets do not represent actual files, but rather represent an action or command that 
needs to be executed regardless.

```makefile
.PHONY: clean

clean:
    rm -rf *.o
```

On the above example, ```clean``` is declared a phony target, and it will be always executed regardless if a file name ```clean``` exist.


## Running multiple commands at once

What if we want to run the tests, and if they pass, then deploy our code? 
You can combine commands in long chains. If one fails, the rest of them 
going to be skipped.

```sh
make test deploy
```

## Making Make less verbose

When you don't want a command to be printed, and just want Make to execute it, prepend it with @ :

```sh
hello:
 @echo “Hi, Bob!”
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