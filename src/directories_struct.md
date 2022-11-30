# Directory structure

| Root directory     | Description |
| ------------------ | ----------- |
| /bin/              | binary: binary essential to the OS       |
| /sbin              | system binary: binary accessible only from the sudo user |
| /usr               | user directory, all binary and files non essential to the OS |
| /usr/bin           | binary non-essential for the OS
| /usr/local         | binary compiled manually or installed without the system package manager |
| /boot              | contain the file needed to boot the system, like the kernel |
| /dev               | device files, you can interface with hardware or drivers as they are regular files |
| /opt               | optional |
| /tmp               | temporary files |
| /var               | variable, contains log and system generated file |
| /procs             | virtual folder create by the kernel to take trace of the running process |