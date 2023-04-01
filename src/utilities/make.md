# Make

```make``` is a build system, designed to automate tasks.

## Makefile

An introduction at the ```make``` utility is usefull to understand the step to compile a library/porogramme:

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
