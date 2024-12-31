# SLURM Installation

First install munge

## Munge

```sh
# Verified user
sudo useradd --system --no-create-home --shell /usr/sbin/nologin --user-group munge
grep munge /etc/passwd
grep munge /etc/group

# Get tarball of munge
tar xJf munge-0.5.16.tar.xz
cd munge-0.5.16
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --runstatedir=/run
make
make check
sudo chown munge:munge /usr/sbin/mungekey
sudo chown -R munge:munge /etc/munge /var/lib/munge /var/log/munge /run/munge
sudo -u munge /usr/sbin/mungekey --verbose
sudo systemctl start munge.service
sudo systemctl enable munge.service
sudo /etc/init.d/munge start
```

# SLURM

```sh
wget https://download.schedmd.com/slurm/slurm-24.11.0.tar.bz2
tar -xaf slurm*tar.bz2 
sudo apt-get install build-essential fakeroot devscripts equivs
cd slurm-24.11.0
sudo mk-build-deps -i debian/control
sudo  debuild -b -uc -us # Build the packages
cd ..
dpkg -i on_necessary_packages

# Write the config
micro /etc/slurm/slurm.conf
sudo mkdir -p /var/spool/slurmctld

sudo systemctl start slurmctld                                                     
sudo systemctl start slurmd 
```

The packages will be in the parent directory after debuild completes.


### Test

Given this script:

```sh
#!/bin/bash
#SBATCH --job-name=my_job
#SBATCH --output=output_%j.log
#SBATCH --error=error_%j.log
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G

echo "Date start                = $(date)"
echo "Initiating Host           = $(hostname)"
echo "Working Directory         = $(pwd)"
echo ""
echo "Number of Nodes Allocated = ${SLURM_JOB_NUM_NODES}"
echo "Number of Tasks Allocated = ${SLURM_NTASKS}"
echo ""

echo "Hello from host"

RETURN=${?}

echo ""
echo "Exit code                 = ${RETURN}"
echo "Date end                  = $(date)"
echo ""
```

run the below command:

```sh
chmod +x script.sh
sbatch script.sh
```