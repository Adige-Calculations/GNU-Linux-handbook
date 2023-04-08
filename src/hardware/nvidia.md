# NVIDIA

Check your Nvidia device:

```sh
lspci | grep -i nvidia
```

## Check if CUDA is installed

Run which nvcc to find if the Nvidia CUDA Compiler (NVCC) is installed properly.

```sh
which nvcc
```

You should see something like /usr/bin/nvcc. If that appears, your NVCC is installed in the standard directory.


You can check 
```sh
nvcc --version
```

to get the CUDA compiler version, which matches the toolkit version:

```sh
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2021 NVIDIA Corporation
Built on Thu_Nov_18_09:45:30_PST_2021
Cuda compilation tools, release 11.5, V11.5.119
Build cuda_11.5.r11.5/compiler.30672275_0
```

This means that we have CUDA version 11.5.119 installed.


