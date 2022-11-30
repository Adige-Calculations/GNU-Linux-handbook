# Shell scripting

First line to initialize shell script is:

```bash
#!/bin/bash
```

## for cycle 

```bash
#!/bin/bash

for region in $(foamListRegions solid);
do
    <command>;
done
```