#!/bin/bash                                                        
#SBATCH --export=NONE               # do not export current env to the job
#SBATCH --job-name=fastqc_Shan_R1_pool1 # job name       
#SBATCH --time=24:00:00             # max job run time dd-hh:mm:ss
#SBATCH --ntasks-per-node=1         # tasks (commands) per compute node
#SBATCH --cpus-per-task=2           # CPUs (threads) per command  
#SBATCH --mem=14G                   # total memory per node
#SBATCH --output=stdout.%x.%j       # save stdout to file
#SBATCH --error=stderr.%x.%j        # save stderr to file

module load FastQC/0.11.9-Java-11

<<README
    - FASTQC homepage: http://www.bioinformatics.babraham.ac.uk/projects/fastqc
    - FASTQC manual: http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help
README

################################### VARIABLES ##################################
# TODO Edit these variables as needed:

######## PARAMETERS ########
threads=$SLURM_CPUS_PER_TASK

########## OUTPUTS #########
output_dir='/scratch/user/cdanmaigona/Claudia.Bisulfite.seq/QC_post.trim'
RUN_PATH='/scratch/user/cdanmaigona/Claudia.Bisulfite.seq'

cd $RUN_PATH
#for file in $(ls *val*fq.gz $RUN_PATH)
#for file in D89-BiSulfate-Sucrose_S6_L002_R2_001_val_2.fq.gz
#for file in D89-BiSulfate-Sucrose_S6_L002_R1_001_val_1.fq.gz
#for file in D89-BiSulfate_S2_L001_R2_001_val_2.fq.gz
#for file in D89-BiSulfate_S2_L001_R1_001_val_1.fq.gz
#for file in Col-0-BiSulfate-Sucrose_S5_L002_R2_001_val_2.fq.gz
#for file in Col-0-BiSulfate-Sucrose_S5_L002_R1_001_val_1.fq.gz
#for file in Col-0-BiSulfate_S1_L001_R2_001_val_2.fq.gz
#for file in Col-0-BiSulfate_S1_L001_R1_001_val_1.fq.gz
#for file in C10-4-BiSulfate-Sucrose_S7_L002_R2_001_val_2.fq.gz
#for file in C10-4-BiSulfate-Sucrose_S7_L002_R1_001_val_1.fq.gz
#for file in C10-4-BiSulfate_S3_L001_R2_001_val_2.fq.gz
#for file in C10-4-BiSulfate_S3_L001_R1_001_val_1.fq.gz
#for file in B7-BiSulfate-Sucrose_S8_L002_R2_001_val_2.fq.gz
#for file in B7-BiSulfate-Sucrose_S8_L002_R1_001_val_1.fq.gz
for file in B7-BiSulfate_S4_L001_R2_001_val_2.fq.gz
do
    SAMPLE=`basename $file`
    fastqc -t $threads ${SAMPLE} -o $output_dir
done

################################### COMMANDS ###################################
# use -o <directory> to save results to <directory> instead of directory where reads are located
#   <directory> must already exist before using -o <directory> option
# --nogroup will calculate average at each base instead of bins after the first 50 bp
# fastqc runs one thread per file; using 20 threads for 2 files does not speed up the processing


################################################################################
<<CITATION
      - FastQC: http://www.bioinformatics.babraham.ac.uk/projects/fastqc
CITATION
