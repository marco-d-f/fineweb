#!/bin/bash
#SBATCH --job-name=count-warc
#SBATCH --partition=cpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --output=logs/warc_count_%j.out
#SBATCH --error=logs/warc_count_%j.err

# Ensure execution occurs in the repo root directory
cd $SLURM_SUBMIT_DIR

source .venv/bin/activate

python slurm/count_warc.py
