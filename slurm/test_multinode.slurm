#!/bin/bash
#SBATCH --job-name=multinode-test
#SBATCH --partition=cpu
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=1
#SBATCH --output=logs/multinode_%j.out
#SBATCH --error=logs/multinode_%j.err

echo "=== 1. Node Hostnames ==="
srun hostname

echo -e "\n=== 2. SLURM Environment Variables per Node ==="
srun bash -c 'echo "--- Host: $(hostname) ---"; env | grep SLURM_ | sort'