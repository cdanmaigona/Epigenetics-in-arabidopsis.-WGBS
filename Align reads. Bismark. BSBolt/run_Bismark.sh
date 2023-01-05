#!/bin/bash
#SBATCH --job-name=Bismark        # job name
#SBATCH --time=24:00:00           # max job run time dd-hh:mm:ss
#SBATCH --ntasks-per-node=1         # tasks (commands) per compute node
#SBATCH --cpus-per-task=48          # CPUs (threads) per command
#SBATCH --mem=360G                  # total memory per node
#SBATCH --output=stdout.%x.%j       # save stdout to file
#SBATCH --error=stderr.%x.%j        # save stderr to file

module purge
module load  GCC/7.3.0-2.30  OpenMPI/3.1.1   Bismark/0.20.1


########## INPUTS ##########
genome_dir='/scratch/user/cdanmaigona/Claudia.Bisulfite.seq/TAIR10-Tel'
pe1_1='B7-BiSulfate_S4_L001_R1_001_val_1.fq.gz'
pe1_2='B7-BiSulfate_S4_L001_R2_001_val_2.fq.gz'
pe2_1='B7-BiSulfate-Sucrose_S8_L002_R1_001_val_1.fq.gz'
pe2_2='B7-BiSulfate-Sucrose_S8_L002_R2_001_val_2.fq.gz'
pe3_1='C10-4-BiSulfate_S3_L001_R1_001_val_1.fq.gz'
pe3_2='C10-4-BiSulfate_S3_L001_R2_001_val_2.fq.gz'
pe4_1='C10-4-BiSulfate-Sucrose_S7_L002_R1_001_val_1.fq.gz'
pe5_2='C10-4-BiSulfate-Sucrose_S7_L002_R2_001_val_2.fq.gz'
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
bismark_genome_preparation /scratch/user/cdanmaigona/Claudia.Bisulfite.seq/TAIR10-Tel
bismark --genome $genome_dir --non_directional -1 $pe1_1 -2 $pe1_2 -p $threads -N 1 --score_min L,0,-0.4
#bismark --genome $genome_dir --non_directional -1 $pe1_1 -2 $pe1_2 -p $threads --score_min L,0,-0.4
#bismark --genome $genome_dir --non_directional -1 $pe1_1 -2 $pe1_2 -p $threads
#bismark --genome $genome_dir --non_directional -1 $pe2_1 -2 $pe2_2 -p $threads -N 1 --score_min L,0,-0.4                                              
#bismark --genome $genome_dir --non_directional -1 $pe2_1 -2 $pe2_2 -p $threads --score_min L,0,-0.4
#bismark --genome $genome_dir --non_directional -1 $pe3_1 -2 $pe3_2 -p $threads -N 1 --score_min L,0,-0.6
#bismark --genome $genome_dir --non_directional -1 $pe3_1 -2 $pe3_2 -p $threads --score_min L,0,-0.6
