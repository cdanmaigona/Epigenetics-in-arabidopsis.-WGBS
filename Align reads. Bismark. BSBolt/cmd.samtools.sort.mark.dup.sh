#!/bin/bash                                                                                                                         
#SBATCH --job-name=BsBolt.Methcalls # job name                                                                                      
#SBATCH --time=04:00:00             # max job run time dd-hh:mm:ss                                                                  
#SBATCH --ntasks-per-node=1         # tasks (commands) per compute node                                                             
#SBATCH --cpus-per-task=48          # CPUs (threads) per command                                                                    
#SBATCH --mem=360G                  # total memory per node                                                                         
#SBATCH --output=stdout.%x.%j       # save stdout to file                                                                           
#SBATCH --error=stderr.%x.%j        # save stderr to file                                                                           
                                                                    
                                                           
threads=$SLURM_CPUS_PER_TASK
module purge
module load GCC/11.2.0 SAMtools/1.14

#samtools fixmate -p -m B7-BiSulfate.bam B7-BiSulfate.fixmate.bam --threads $threads
#samtools fixmate -p -m B7-BiSulfate-Sucrose.bam B7-BiSulfate-Sucrose.fixmate.bam --threads $threads
#samtools sort -@ $threads -o B7-BiSulfate-Sucrose.fixmate.sorted.bam B7-BiSulfate-Sucrose.fixmate.bam

#samtools fixmate -p -m C10-4-BiSulfate.bam C10-4-BiSulfate.fixmate.bam --threads $threads
#samtools fixmate -p -m C10-4-BiSulfate-Sucrose.bam C10-4-BiSulfate-Sucrose.fixmate.bam --threads $threads
#samtools sort -@ $threads -o C10-4-BiSulfate-Sucrose.fixmate.sorted.bam C10-4-BiSulfate-Sucrose.fixmate.bam

#samtools fixmate -p -m Col-0-BiSulfate.bam Col-0-BiSulfate.fixmate.bam --threads $threads
#samtools fixmate -p -m Col-0-BiSulfate-Sucrose.bam Col-0-BiSulfate-Sucrose.fixmate.bam --threads $threads
#samtools sort -@ $threads -o Col-0-BiSulfate-Sucrose.fixmate.sorted.bam Col-0-BiSulfate-Sucrose.fixmate.bam

#samtools fixmate -p -m D89-BiSulfate.bam D89-BiSulfate.fixmate.bam --threads $threads
#samtools fixmate -p -m D89-BiSulfate-Sucrose.bam D89-BiSulfate-Sucrose.fixmate.bam --threads $threads
#samtools sort -@ $threads -T $TMPDIR -o D89-BiSulfate-Sucrose.fixmate.sorted.bam D89-BiSulfate-Sucrose.fixmate.bam

# sort bam by coordinates for duplicate calling
#samtools sort -@ $threads -o B7-BiSulfate.fixmate.sorted.bam B7-BiSulfate.fixmate.bam
#samtools sort -@ $threads -o B7-BiSulfate-Sucrose.fixmate.sorted.bam B7-BiSulfate-Sucrose.fixmate.bam
#samtools sort -@ $threads -o C10-4-BiSulfate.fixmate.sorted.bam C10-4-BiSulfate.fixmate.bam
#samtools sort -@ $threads -o C10-4-BiSulfate-Sucrose.fixmate.sorted.bam C10-4-BiSulfate-Sucrose.fixmate.bam
#samtools sort -@ $threads -o Col-0-BiSulfate.fixmate.sorted.bam Col-0-BiSulfate.fixmate.bam
#samtools sort -@ $threads -o Col-0-BiSulfate-Sucrose.fixmate.sorted.bam Col-0-BiSulfate-Sucrose.fixmate.bam
#samtools sort -@ $threads -o D89-BiSulfate.fixmate.sorted.bam D89-BiSulfate.fixmate.bam
#samtools sort -@ $threads -T $TMPDIR -o D89-BiSulfate-Sucrose.fixmate.sorted.bam D89-BiSulfate-Sucrose.fixmate.bam

# remove duplicate reads
#rm B7-BiSulfate.fixmate.bam
#samtools markdup -@ $threads -T $TMPDIR B7-BiSulfate.fixmate.sorted.bam B7-BiSulfate.fixmate.sorted.dup.bam
#samtools index -@ $threads B7-BiSulfate.fixmate.sorted.dup.bam

#rm B7-BiSulfate-Sucrose.fixmate.bam
#samtools markdup -@ $threads -T $TMPDIR B7-BiSulfate-Sucrose.fixmate.sorted.bam B7-BiSulfate-Sucrose.fixmate.sorted.dup.bam
#samtools index -@ $threads B7-BiSulfate-Sucrose.fixmate.sorted.dup.bam

#rm C10-4-BiSulfate.fixmate.bam
#samtools markdup -@ $threads -T $TMPDIR C10-4-BiSulfate.fixmate.sorted.bam C10-4-BiSulfate.fixmate.sorted.dup.bam
#samtools index -@ $threads C10-4-BiSulfate.fixmate.sorted.dup.bam

#rm C10-4-BiSulfate-Sucrose.fixmate.bam
#samtools markdup -@ $threads -T $TMPDIR C10-4-BiSulfate-Sucrose.fixmate.sorted.bam C10-4-BiSulfate-Sucrose.fixmate.sorted.dup.bam
#samtools index -@ $threads C10-4-BiSulfate-Sucrose.fixmate.sorted.dup.bam

#rm Col-0-BiSulfate.fixmate.bam
#samtools markdup -@ $threads -T $TMPDIR Col-0-BiSulfate.fixmate.sorted.bam Col-0-BiSulfate.fixmate.sorted.dup.bam 
#samtools index -@ $threads Col-0-BiSulfate.fixmate.sorted.dup.bam

#rm Col-0-BiSulfate-Sucrose.fixmate.bam 
#samtools markdup -@ $threads -T $TMPDIR Col-0-BiSulfate-Sucrose.fixmate.sorted.bam Col-0-BiSulfate-Sucrose.fixmate.sorted.dup.bam
#samtools index -@ $threads Col-0-BiSulfate-Sucrose.fixmate.sorted.dup.bam

#rm D89-BiSulfate.fixmate.bam
#samtools markdup -@ $threads -T $TMPDIR D89-BiSulfate.fixmate.sorted.bam D89-BiSulfate.fixmate.sorted.dup.bam
#samtools index -@ $threads D89-BiSulfate.fixmate.sorted.dup.bam

rm D89-BiSulfate-Sucrose.fixmate.bam
samtools markdup -@ $threads -T $TMPDIR D89-BiSulfate-Sucrose.fixmate.sorted.bam D89-BiSulfate-Sucrose.fixmate.sorted.dup.bam
samtools index -@ $threads D89-BiSulfate-Sucrose.fixmate.sorted.dup.bam
