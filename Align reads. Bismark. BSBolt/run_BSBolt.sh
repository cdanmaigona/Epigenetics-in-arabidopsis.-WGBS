#!/bin/bash
#SBATCH --job-name=BsBolt           # job name
#SBATCH --time=24:00:00             # max job run time dd-hh:mm:ss
#SBATCH --ntasks-per-node=1         # tasks (commands) per compute node
#SBATCH --cpus-per-task=48          # CPUs (threads) per command
#SBATCH --mem=360G                  # total memory per node
#SBATCH --output=stdout.%x.%j       # save stdout to file
#SBATCH --error=stderr.%x.%j        # save stderr to file

module purge
module load GCC/11.2.0  OpenMPI/4.1.1 BSBolt/1.5.0

########## INPUTS ##########
#genome_dir='/scratch/user/cdanmaigona/Claudia.Bisulfite.seq/TAIR10'
genome_dir='/scratch/user/cdanmaigona/Claudia.Bisulfite.seq/trim/TAIR10.DB'
pe1_1='B7-BiSulfate_S4_L001_R1_001_val_1.fq.gz'
pe1_2='B7-BiSulfate_S4_L001_R2_001_val_2.fq.gz'
pe2_1='B7-BiSulfate-Sucrose_S8_L002_R1_001_val_1.fq.gz'
pe2_2='B7-BiSulfate-Sucrose_S8_L002_R2_001_val_2.fq.gz'
pe3_1='C10-4-BiSulfate_S3_L001_R1_001_val_1.fq.gz'
pe3_2='C10-4-BiSulfate_S3_L001_R2_001_val_2.fq.gz'
pe4_1='C10-4-BiSulfate-Sucrose_S7_L002_R1_001_val_1.fq.gz'
pe4_2='C10-4-BiSulfate-Sucrose_S7_L002_R2_001_val_2.fq.gz'
pe5_1='Col-0-BiSulfate_S1_L001_R1_001_val_1.fq.gz'
pe5_2='Col-0-BiSulfate_S1_L001_R2_001_val_2.fq.gz'
pe6_1='Col-0-BiSulfate-Sucrose_S5_L002_R1_001_val_1.fq.gz'
pe6_2='Col-0-BiSulfate-Sucrose_S5_L002_R2_001_val_2.fq.gz'
pe7_1='D89-BiSulfate_S2_L001_R1_001_val_1.fq.gz'
pe7_2='D89-BiSulfate_S2_L001_R2_001_val_2.fq.gz'
pe8_1='D89-BiSulfate-Sucrose_S6_L002_R1_001_val_1.fq.gz'
pe8_2='D89-BiSulfate-Sucrose_S6_L002_R2_001_val_2.fq.gz'

######## PARAMETERS ########
threads=$SLURM_CPUS_PER_TASK

########## OUTPUTS #########

################################### COMMANDS ###################################
python3 -m bsbolt Align -DB TAIR10.DB/ -F1 $pe1_1 -F2 $pe1_2 -UN -O bsbolt.TAIR10.updated.bam/B7-BiSulfate -t $threads
#python3 -m bsbolt Align -DB TAIR10.DB/ -F1 $pe2_1 -F2 $pe2_2 -UN -O bsbolt.TAIR10.updated.bam/B7-BiSulfate-Sucrose -t $threads
#python3 -m bsbolt Align -DB TAIR10.DB/ -F1 $pe3_1 -F2 $pe3_2 -UN -O bsbolt.TAIR10.updated.bam/C10-4-BiSulfate -t $threads
#python3 -m bsbolt Align -DB TAIR10.DB/ -F1 $pe4_1 -F2 $pe4_2 -UN -O bsbolt.TAIR10.updated.bam/C10-4-BiSulfate-Sucrose -t $threads
#python3 -m bsbolt Align -DB TAIR10.DB/ -F1 $pe5_1 -F2 $pe5_2 -UN -O bsbolt.TAIR10.updated.bam/Col-0-BiSulfate -t $threads
#python3 -m bsbolt Align -DB TAIR10.DB/ -F1 $pe6_1 -F2 $pe6_2 -UN -O bsbolt.TAIR10.updated.bam/Col-0-BiSulfate-Sucrose -t $threads
#python3 -m bsbolt Align -DB TAIR10.DB/ -F1 $pe7_1 -F2 $pe7_2 -UN -O bsbolt.TAIR10.updated.bam/D89-BiSulfate -t $threads
python3 -m bsbolt Align -DB TAIR10.DB/ -F1 $pe8_1 -F2 $pe8_2 -UN -O bsbolt.TAIR10.updated.bam/D89-BiSulfate-Sucrose -t $threads
#python3 -m bsbolt Align -DB gene.DB/ -F1 $pe1_1 -F2 $pe1_2 -UN -O gene.bam/B7-BiSulfate -t $threads
