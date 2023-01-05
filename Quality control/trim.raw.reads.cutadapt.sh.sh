#!/bin/bash
#SBATCH --export=NONE               # do not export current env to the job                                                   
#SBATCH --job-name=fastqc_cutadapt  # job name                                                                      
#SBATCH --time=48:00:00             # max job run time dd-hh:mm:ss                                                               
#SBATCH --ntasks-per-node=1         # tasks (commands) per compute node                                                          
#SBATCH --cpus-per-task=2           # CPUs (threads) per command                                                              
#SBATCH --mem=14G                   # total memory per node                                                          
#SBATCH --output=stdout.%x.%j       # save stdout to file                                                                  
#SBATCH --error=stderr.%x.%j        # save stderr to file           

module load GCCcore/10.2.0 cutadapt/3.4

for i in *_R1_001.fastq.gz
do

    SAMPLE=$(echo ${i} | sed "s/_R1_\001\.fastq\.gz//")
    echo ${SAMPLE}_R1_001.fastq.gz ${SAMPLE}_R2_001.fastq.gz

cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
-o /scratch/user/cdanmaigona/Claudia.Bisulfite.seq/trim/${SAMPLE}_R1_001.fastq.gz \
-p /scratch/user/cdanmaigona/Claudia.Bisulfite.seq/trim/${SAMPLE}_R2_001.fastq.gz \
${SAMPLE}_R1_001.fastq.gz ${SAMPLE}_R2_001.fastq.gz  

done
