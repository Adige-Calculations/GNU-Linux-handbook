# SLURM scheduler

Prepare a programme that can run on a distributed computin system.

```c
#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
int main() {
    int  step, node, hostlen;
    char hostname[256];
    hostlen = 255;

    MPI_Init(NULL, NULL);
    MPI_Comm_rank(MPI_COMM_WORLD, &node);
    MPI_Get_processor_name(hostname, &hostlen);

    for (step = 1; step < 5; step++) {
        printf("Hello World from Step %d on Node %d, (%s)\n", step, node, hostname);
        sleep(2);
    }

    MPI_Finalize();

    return 0;
}
```

Compile it with the following:

```sh
mpicc main.c -o mpi_exec
```

Then you can instruct the scheduler on how to run the programme, such as:

```sh
#!/bin/bash
#SBATCH --job-name=hello-world-job
#SBATCH --ntasks=6
#SBATCH --output=%x_%j.out

mpirun ./mpiexec
```

To start the Slurm scheduler alongside with the script that specifies the resources needed and the commands to be executed:

```sh
sbatch directives_slurm.sbatch
```

## General utilities

Instead to run directly a single job or a script on allocated compute nodes, use:

```sh
srun
```

This can be useful for quick tasks or testing purposes
As the name suggests, the following command allows you to cancel submitted jobs.
It can be used for jobs that are pending, running, or even to send signals to running jobs

```sh
scancel
```

The following command is for checking the status of your submitted jobs. It displays information like job ID, name, user, partition, state, and resource use:

```sh
squeue
```

Instead the next command provides details about the available compute nodes and partitions (queues) on the Slurm cluster. It's helpful for understanding the resources available and choosing the right nodes for your jobs

```sh
sinfo
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
