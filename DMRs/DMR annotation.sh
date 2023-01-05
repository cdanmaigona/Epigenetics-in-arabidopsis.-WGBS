##prepare fractionation data for metilene DMR analysis. Considering only the sucrose data

sed 's/\ /\t/g' WGBS.CHG.map.merged.nc.txt | sed 's/:/\t/g' | sed 's/Site/Chrom\tSite/g' > WGBS.CHG.map.merged.nc.sucrose.txt

sed 's/\ /\t/g' WGBS.CG.map.merged.nc.txt | sed 's/:/\t/g' | sed 's/Site/Chrom\tSite/g' > WGBS.CG.map.merged.nc.sucrose.txt

sed 's/\ /\t/g' WGBS.CHH.map.merged.nc.txt | sed 's/:/\t/g' | sed 's/Site/Chrom\tSite/g' > WGBS.CHH.map.merged.nc.sucrose.txt


##run metilene (installed in my directory)
metilene WGBS.CHH.map.merged.nc.sucrose.txt -a 'Col_' -b 'D89_' --mode 1 --mtc 2 --mincpgs 5 --maxdist 1000 --minMethDiff 0.25 --valley 0.7 --threads 8 > WGBS.CHH.map.merged.nc.sucrose.DMR.txt &

metilene WGBS.CHG.map.merged.nc.sucrose.txt -a 'Col_' -b 'D89_' --mode 1 --mtc 2 --mincpgs 5 --maxdist 1000 --minMethDiff 0.25 --valley 0.7 --threads 8 > WGBS.CHG.map.merged.nc.sucrose.DMR.txt &

metilene WGBS.CG.map.merged.nc.sucrose.txt -a 'Col_' -b 'D89_' --mode 1 --mtc 2 --mincpgs 5 --maxdist 1000 --minMethDiff 0.25 --valley 0.7 --threads 8 > WGBS.CG.map.merged.nc.sucrose.DMR.txt &


##Load R module
module load GCC/11.2.0  OpenMPI/4.1.1 R/4.2.0

##BAT Calling
BAT/BAT_DMRcalling -q WGBS.CG.map.merged.nc.sucrose.DMR.txt -o WGBS.CG.map.merged.nc.sucrose.DMR.BAT.txt -F 2 -a 'Col_S' -b 'D89_S'

BAT/BAT_DMRcalling -q WGBS.CHG.map.merged.nc.sucrose.DMR.txt -o WGBS.CHG.map.merged.nc.sucrose.DMR.BAT.txt -F 2 -a 'Col_S' -b 'D89_S'

BAT/BAT_DMRcalling -q WGBS.CHH.map.merged.nc.sucrose.DMR.txt -o WGBS.CHH.map.merged.nc.sucrose.DMR.BAT.txt -F 2 -a 'Col_S' -b 'D89_S'

##Create BAT correlating input files
##Load bedtools module
module load GCC/11.2.0 BEDTools/2.30.0

bedtools intersect -wa -wb -a WGBS.CHH.map.merged.nc.sucrose.DMR.BAT.txt_qval.0.05.bed -b /scratch/user/cdanmaigona/Claudia.Bisulfite.seq/TAIR10.GFF.bed | cut -f1-3,9 > DMR_CHH.gene.txt

bedtools intersect -wa -wb -a WGBS.CHG.map.merged.nc.sucrose.DMR.BAT.txt_qval.0.05.bed -b /scratch/user/cdanmaigona/Claudia.Bisulfite.seq/TAIR10.GFF.bed | cut -f1-3,9 > DMR_CHG.gene.txt

bedtools intersect -wa -wb -a WGBS.CG.map.merged.nc.sucrose.DMR.BAT.txt_qval.0.05.bed -b /scratch/user/cdanmaigona/Claudia.Bisulfite.seq/TAIR10.GFF.bed | cut -f1-3,9 > DMR_CG.gene.txt

ls data/*.bw | grep -v "mean" | grep -v "diff" | sed 's/\t/\n/' >DMRs/methylation_files.list

bedtools intersect -wa -wb -a .bed -b /scratch/user/cdanmaigona/Claudia.Bisulfite.seq/TAIR10.GFF.bed 
