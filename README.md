# Epigenetics-in-arabidopsis.-WGBS
This pipleline descibes the steps used in analyzing whole genome bisulfite sequencing data for arabidopsis sequenced at 200x coverage to identify differentually methylated regions
* software requirements
 ** fastqc
 ** BSbolt
 ** Bismark
 ** R
 ** Samtools
 ** metilene
 ** BAT
 ** Cutadapt
 
 The pipeline consist of
 * Quality control
 ** Trim adaptors with cutadapt
 ** fastqc of trimmed reads
 * Align reads 
 * Mark duplicates
 * Call CG, CHH, CHG methylation
 * Plot %methylation of CG, CHH, and CHG across the whole genome
 * Compute Differentially Methylated Regions (DMRs)
 * Annotate DMRs
 
