#!/bin/bash
#SBATCH --export=NONE               # do not export current env to the job
#SBATCH --job-name=run_metilene     # job name
#SBATCH --time=2-00:00:00           # max job run time dd-hh:mm:ss
#SBATCH --partition=bigmem          # use large (3TB) memory node       
#SBATCH --ntasks-per-node=1         # tasks (commands) per compute node
#SBATCH --cpus-per-task=80          # CPUs (threads) per command
#SBATCH --mem=2929G                 # total memory per node
#SBATCH --output=stdout.%x.%j       # save stdout to file
#SBATCH --error=stderr.%x.%j        # save stderr to file

threads=$SLURM_CPUS_PER_TASK

/scratch/user/cdanmaigona/Claudia.Bisulfite.seq/trim/bsbolt.bam/metilene/metilene_v0.2-8/metilene \
WGBS.CHH.map.merged.nc.sucrose.txt -a 'Col_' -b 'D89_' --mode 1 --mtc 2 --mincpgs 5 \
--maxdist 1000 -G 1000 --minMethDiff 0.25 --valley 0.7 \
--threads 70 > WGBS.CHH.map.merged.nc.sucrose.G.1000.txt

#/scratch/user/cdanmaigona/Claudia.Bisulfite.seq/trim/bsbolt.bam/metilene/metilene_v0.2-8/metilene \
#WGBS.CHG.map.merged.nc.sucrose.txt   -a 'Col_' -b 'D89_' --mode 1 --mtc 2 --mincpgs 5 --maxdist 1000 \
#--minMethDiff 0.25 --valley 0.7 \
#--threads $threads > WGBS.CHG.map.merged.nc.sucrose.DMR.txt

#/scratch/user/cdanmaigona/Claudia.Bisulfite.seq/trim/bsbolt.bam/metilene/metilene_v0.2-8/metilene \
#WGBS.CG.map.merged.nc.sucrose.txt \
#-a 'Col_' -b 'D89_' --mode 1 --mtc 2 --mincpgs 5 --maxdist 1000 --minMethDiff 0.25 --valley 0.7 \
#--threads $threads > WGBS.CG.map.merged.nc.sucrose.DMR.txt
