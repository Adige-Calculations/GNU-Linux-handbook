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
