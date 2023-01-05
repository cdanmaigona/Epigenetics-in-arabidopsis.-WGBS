Do <- function(vec, name) {
  hist(vec, breaks=seq(0.0,1.0,by=0.02), xlim=c(0.0,1.0),
       border='darkblue', col='darkblue', main=name,
       xlab='Fraction methylation', ylab='Number of CG sites')
}

Do(WGBS.CG.map.merged.nc$B7_NS, 'B7_NS')
Do(WGBS.CG.map.merged.nc$B7_S, 'B7_S')
Do(WGBS.CG.map.merged.nc$Col_0_NS, 'Col_NS')
Do(WGBS.CG.map.merged.nc$Col_0_S, 'Col_S')
Do(WGBS.CG.map.merged.nc$C10_4_NS, 'C10_NS')
Do(WGBS.CG.map.merged.nc$C10_4_S, 'C10_S')
Do(WGBS.CG.map.merged.nc$D89_NS, 'D89_NS')
Do(WGBS.CG.map.merged.nc$D89_S, 'D89_S')

ggplot(WGBS.CG.map.merged.nc,aes(WGBS.CG.map.merged.nc$D89_NS, xlab('Fraction methylation'), ylab('Number of CG sites')))+geom_histogram(bins=30) + facet_grid(.~WGBS.CG.map.merged.nc$Chrom)
library(ggplot2)
CG.map.merged.c <- read.delim("~/Desktop/Claudia.WGBS/CG.map.merged.c.txt")
NAto0 <- function(v) {v[is.na(v)] <- 0; v}
B7_NS.N <- NAto0(CG.map.merged.c$B7_NS.N); B7_NS.D <- NAto0(CG.map.merged.c$B7_NS.D);
B7_S.N <- NAto0(CG.map.merged.c$B7_S.N); B7_S.D <- NAto0(CG.map.merged.c$B7_S.D);
Col_0_NS.N <- NAto0(CG.map.merged.c$Col_0_NS.N); Col_0_NS.D <- NAto0(CG.map.merged.c$Col_0_NS.D);
Col_0_S.N <- NAto0(CG.map.merged.c$Col_0_S.N); Col_0_S.D <- NAto0(CG.map.merged.c$Col_0_S.D);
C10_4_NS.N <- NAto0(CG.map.merged.c$C10_4_NS.N); C10_4_NS.D <- NAto0(CG.map.merged.c$C10_4_NS.D);
C10_4_S.N <- NAto0(CG.map.merged.c$C10_4_S.N); C10_4_S.D <- NAto0(CG.map.merged.c$C10_4_S.D);
D89_NS.N <- NAto0(CG.map.merged.c$D89_NS.N); D89_NS.D <- NAto0(CG.map.merged.c$D89_NS.D);
D89_S.N <- NAto0(CG.map.merged.c$D89_S.N); D89_S.D <- NAto0(CG.map.merged.c$D89_S.D);
##Get percentages
B7_NS_P <- 100.0*B7_NS.N/B7_NS.D; B7_S_P <- 100.00*B7_S.N/B7_S.D;
Col_0_NS_P <- 100.0*Col_0_NS.N/Col_0_NS.D; Col_0_S_P <- 100.0*Col_0_S.N/Col_0_S.D;
C10_4_NS_P <- 100.0*C10_4_NS.N/C10_4_NS.D; C10_4_S_P <- 100.00*C10_4_S.N/C10_4_S.D;
D89_NS_P <- 100.0*D89_NS.N/D89_NS.D; D89_S_P <- 100.00*D89_S.N/D89_S.D;

head(C10_4_S_P)
head(Col_0_S_P)
head(B7_NS_P)

CG <- data.frame(ChrName=CG.map.merged.c$Chrom, Coord=CG.map.merged.c$Pos,
                 B7_NS_Pct=B7_NS_P, B7_S_Pct=B7_S_P, B7_NS_Cvg=B7_NS.D, B7_S_Cvg=B7_S.D,
                 Col_0_NS_Pct=Col_0_NS_P, Col_0_S_Pct=Col_0_S_P, Col_0_NS_Cvg=Col_0_NS.D, Col_0_S_Cvg=Col_0_S.D,
                 C10_4_NS_Pct=C10_4_NS_P, C10_4_S_Pct=C10_4_S_P, C10_4_NS_Cvg=C10_4_NS.D, C10_4_S_Cvg=C10_4_S.D,
                 D89_NS_Pct=D89_NS_P, D89_S_Pct=D89_S_P, D89_NS_Cvg=D89_NS.D, D89_S.Cvg=D89_S.D  )

#write.table(CG, file='CG.txt', sep="\t", row.name=FALSE)
#library(dplyr)
Chr2 <- "chr5";
CG.chr1 <- CG[CG$ChrName==Chr2, ];
head(CG.chr1)
bpPerBin <- 1000000;
CG.2.Oview <- CG.chr1  %>%
  group_by(bin=floor(Coord/bpPerBin)) %>%
  summarize(MbpSemiCtr=mean(Coord)/1000000.0,
            B7_NS_Pct=mean(B7_NS_Pct, na.rm=TRUE), B7_S_Pct=mean(B7_S_Pct, na.rm=TRUE),
            B7_S_Cvg=sum(B7_S_Cvg, na.rm=TRUE), B7_NS_Cvg=sum(B7_NS_Cvg, na.rm=TRUE),
            Col_0_NS_Pct=mean(Col_0_NS_Pct, na.rm=TRUE), Col_0_S_Pct=mean(Col_0_S_Pct, na.rm=TRUE),
            Col_0_NS_Cvg=sum(Col_0_NS_Cvg, na.rm=TRUE), Col_0_S_Cvg=sum(Col_0_S_Cvg, na.rm=TRUE),
            C10_4_NS_Pct=mean(C10_4_NS_Pct, na.rm=TRUE), C10_4_S_Pct=mean(C10_4_S_Pct, na.rm=TRUE),
            C10_4_NS_Cvg=sum(C10_4_NS_Cvg, na.rm=TRUE), C10_4_S_Cvg=sum(C10_4_S_Cvg, na.rm=TRUE),
            D89_NS_Pct=mean(D89_NS_Pct, na.rm=TRUE), D89_S_Pct=mean(D89_S_Pct, na.rm=TRUE),
            D89_NS_Cvg=sum(D89_NS_Cvg, na.rm=TRUE), D89_S.Cvg=sum(D89_S.Cvg, na.rm=TRUE))
write.table(CG.2.Oview, file='CG.1.1000kb.Oview.txt', sep="\t", row.name=FALSE)
write.table(CG.2.Oview, file='CG.2.1000kb.Oview.txt', sep="\t", row.name=FALSE)
write.table(CG.2.Oview, file='CG.3.1000kb.Oview.txt', sep="\t", row.names=FALSE)
write.table(CG.2.Oview, file='CG.4.1000kb.Oview.txt', sep="\t", row.names=FALSE)
write.table(CG.2.Oview, file='CG.5.1000kb.Oview.txt', sep="\t", row.names=FALSE)


bpPerBin <- 1000000;
xLbl <- paste0('Mbp (bins of ',
               toString(round(bpPerBin/1000)),
               ' Kbp)');
yLbl <- 'Average %mCG Chr1'

ggplot(Col_0_D89_S.chr4.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,130) +
  scale_color_manual(values = c("Col_0_S" = "darkgreen", "D89_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

###CG.chrom4
D89_C10_4_S.chr1.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_S.chr1.10k.CG.txt", header=FALSE)
Col_0_C10_4_S.chr1.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_S.chr1.10k.CG.txt", header=FALSE)
Col_0_B7_S.chr1.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_S.chr1.10k.CG.txt", header=FALSE)
Col_0_D89_S.chr1.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_S.chr1.10k.CG.txt", header=FALSE)
D89_C10_4_N.chr1.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_N.chr1.10k.CG.txt", header=FALSE)
Col_0_C10_4_N.chr1.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_N.chr1.10k.CG.txt", header=FALSE)
Col_0_B7_N.chr1.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_N.chr1.10k.CG.txt", header=FALSE)
Col_0_D89_N.chr1.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_N.chr1.10k.CG.txt", header=FALSE)
D89_N_S.chr1.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_N_S.chr1.10k.CG.txt", header=FALSE)
C10_4_N_S.chr1.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/C10_4_N_S.chr1.10k.CG.txt", header=FALSE) 
Col_0_N_S.chr1.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_N_S.chr1.10k.CG.txt", header=FALSE)
B7_N_S.chr1.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/B7_N_S.chr1.10k.CG.txt", header=FALSE)



D89_C10_4_S.chr2.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_S.chr2.10k.CG.txt", header=FALSE)
Col_0_C10_4_S.chr2.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_S.chr2.10k.CG.txt", header=FALSE)
Col_0_B7_S.chr2.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_S.chr2.10k.CG.txt", header=FALSE)
Col_0_D89_S.chr2.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_S.chr2.10k.CG.txt", header=FALSE)
D89_C10_4_N.chr2.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_N.chr2.10k.CG.txt", header=FALSE)
Col_0_C10_4_N.chr2.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_N.chr2.10k.CG.txt", header=FALSE)
Col_0_B7_N.chr2.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_N.chr2.10k.CG.txt", header=FALSE)
Col_0_D89_N.chr2.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_N.chr2.10k.CG.txt", header=FALSE)
D89_N_S.chr2.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_N_S.chr2.10k.CG.txt", header=FALSE)
C10_4_N_S.chr2.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/C10_4_N_S.chr2.10k.CG.txt", header=FALSE) 
Col_0_N_S.chr2.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_N_S.chr2.10k.CG.txt", header=FALSE)
B7_N_S.chr2.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/B7_N_S.chr2.10k.CG.txt", header=FALSE)


D89_C10_4_S.chr3.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_S.chr3.10k.CG.txt", header=FALSE)
Col_0_C10_4_S.chr3.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_S.chr3.10k.CG.txt", header=FALSE)
Col_0_B7_S.chr3.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_S.chr3.10k.CG.txt", header=FALSE)
Col_0_D89_S.chr3.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_S.chr3.10k.CG.txt", header=FALSE)
D89_C10_4_N.chr3.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_N.chr3.10k.CG.txt", header=FALSE)
Col_0_C10_4_N.chr3.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_N.chr3.10k.CG.txt", header=FALSE)
Col_0_B7_N.chr3.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_N.chr3.10k.CG.txt", header=FALSE)
Col_0_D89_N.chr3.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_N.chr3.10k.CG.txt", header=FALSE)
D89_N_S.chr3.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_N_S.chr3.10k.CG.txt", header=FALSE)
C10_4_N_S.chr3.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/C10_4_N_S.chr3.10k.CG.txt", header=FALSE) 
Col_0_N_S.chr3.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_N_S.chr3.10k.CG.txt", header=FALSE)
B7_N_S.chr3.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/B7_N_S.chr3.10k.CG.txt", header=FALSE)

D89_C10_4_S.chr4.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_S.chr4.10k.CG.txt", header=FALSE)
Col_0_C10_4_S.chr4.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_S.chr4.10k.CG.txt", header=FALSE)
Col_0_B7_S.chr4.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_S.chr4.10k.CG.txt", header=FALSE)
Col_0_D89_S.chr4.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_S.chr4.10k.CG.txt", header=FALSE)
D89_C10_4_N.chr4.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_N.chr4.10k.CG.txt", header=FALSE)
Col_0_C10_4_N.chr4.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_N.chr4.10k.CG.txt", header=FALSE)
Col_0_B7_N.chr4.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_N.chr4.10k.CG.txt", header=FALSE)
Col_0_D89_N.chr4.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_N.chr4.10k.CG.txt", header=FALSE)
D89_N_S.chr4.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_N_S.chr4.10k.CG.txt", header=FALSE)
C10_4_N_S.chr4.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/C10_4_N_S.chr4.10k.CG.txt", header=FALSE)
Col_0_N_S.chr4.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_N_S.chr4.10k.CG.txt", header=FALSE)
B7_N_S.chr4.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/B7_N_S.chr4.10k.CG.txt", header=FALSE)

D89_C10_4_S.chr5.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_S.chr5.10k.CG.txt", header=FALSE)
Col_0_C10_4_S.chr5.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_S.chr5.10k.CG.txt", header=FALSE)
Col_0_B7_S.chr5.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_S.chr5.10k.CG.txt", header=FALSE)
Col_0_D89_S.chr5.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_S.chr5.10k.CG.txt", header=FALSE)
D89_C10_4_N.chr5.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_N.chr5.10k.CG.txt", header=FALSE)
Col_0_C10_4_N.chr5.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_N.chr5.10k.CG.txt", header=FALSE)
Col_0_B7_N.chr5.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_N.chr5.10k.CG.txt", header=FALSE)
Col_0_D89_N.chr5.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_N.chr5.10k.CG.txt", header=FALSE)
D89_N_S.chr5.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_N_S.chr5.10k.CG.txt", header=FALSE)
C10_4_N_S.chr5.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/C10_4_N_S.chr5.10k.CG.txt", header=FALSE) 
Col_0_N_S.chr5.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_N_S.chr5.10k.CG.txt", header=FALSE)
B7_N_S.chr5.10k.CG <- read.delim("~/Desktop/Claudia.WGBS/B7_N_S.chr5.10k.CG.txt", header=FALSE)


ggplot(Col_0_D89_S.chr3.10k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "darkgreen", "D89_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic() +
  ggsave("CG.CHR3.Col.D89.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_N.chr3.10k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_N" = "darkgreen", "D89_N" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic() +
  ggsave("CG.CHR3.Col.D89.N.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_C10_4_N.chr3.10k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_N" = "darkgreen", "C10_4_N" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic() +
  ggsave("CG.CHR3.Col.C10-4.N.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_C10_4_S.chr3.10k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "darkgreen", "C10_4_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic() +
  ggsave("CG.CHR3.Col.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_B7_N.chr3.10k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_N" = "darkgreen", "B7_N" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic() +
  ggsave("CG.CHR3.Col.B7.N.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_B7_S.chr3.10k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "darkgreen", "B7_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic() +
  ggsave("CG.CHR3.Col.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(D89_C10_4_N.chr3.10k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_N" = "darkgreen", "C10_4_N" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic() +
  ggsave("CG.CHR3.D89.C10-4.N.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(D89_C10_4_S.chr3.10k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "darkgreen", "C10_4_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic() +
  ggsave("CG.CHR3.D89.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_N_S.chr3.10k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_N" = "darkgreen", "Col_0_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic() +
  ggsave("CG.CHR3.Col.NS.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(D89_N_S.chr3.10k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_N" = "darkgreen", "D89_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic() +
  ggsave("CG.CHR3.D89.NS.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(B7_N_S.chr3.10k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("B7_N" = "darkgreen", "B7_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic() +
  ggsave("CG.CHR3.B7.NS.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(C10_4_N_S.chr3.10k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("C10_4_N" = "darkgreen", "C10_4_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic() +
  ggsave("CG.CHR3.C10-4.NS.png", plot = last_plot(), device = "png", dpi = 300 ) 


#####lINE PLOTS


D89_C10_4_S.chr1.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_S.chr1.10k.1000k.CG.txt", header=FALSE)
Col_0_C10_4_S.chr1.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_S.chr1.10k.1000k.CG.txt", header=FALSE)
Col_0_B7_S.chr1.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_S.chr1.10k.1000k.CG.txt", header=FALSE)
Col_0_D89_S.chr1.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_S.chr1.10k.1000k.CG.txt", header=FALSE)
D89_C10_4_N.chr1.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_N.chr1.10k.1000k.CG.txt", header=FALSE)
Col_0_C10_4_N.chr1.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_N.chr1.10k.1000k.CG.txt", header=FALSE)
Col_0_B7_N.chr1.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_N.chr1.10k.1000k.CG.txt", header=FALSE)
Col_0_D89_N.chr1.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_N.chr1.10k.1000k.CG.txt", header=FALSE)
D89_N_S.chr1.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_N_S.chr1.10k.1000k.CG.txt", header=FALSE)
C10_4_N_S.chr1.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/C10_4_N_S.chr1.10k.1000k.CG.txt", header=FALSE) 
Col_0_N_S.chr1.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_N_S.chr1.10k.1000k.CG.txt", header=FALSE)
B7_N_S.chr1.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/B7_N_S.chr1.10k.1000k.CG.txt", header=FALSE)
Col_D89_C10_4_B7.N.chr1.1000K <- read.delim("~/Desktop/Claudia.WGBS/Col_D89_C10_4_B7.N.chr1.1000K.txt", header=FALSE)
Col_D89_C10_4_B7.S.chr1.1000K <- read.delim("~/Desktop/Claudia.WGBS/Col_D89_C10_4_B7.S.chr1.1000K.txt", header=FALSE)

D89_C10_4_S.chr2.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_S.chr2.10k.1000k.CG.txt", header=FALSE)
Col_0_C10_4_S.chr2.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_S.chr2.10k.1000k.CG.txt", header=FALSE)
Col_0_B7_S.chr2.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_S.chr2.10k.1000k.CG.txt", header=FALSE)
Col_0_D89_S.chr2.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_S.chr2.10k.1000k.CG.txt", header=FALSE)
D89_C10_4_N.chr2.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_N.chr2.10k.1000k.CG.txt", header=FALSE)
Col_0_C10_4_N.chr2.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_N.chr2.10k.1000k.CG.txt", header=FALSE)
Col_0_B7_N.chr2.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_N.chr2.10k.1000k.CG.txt", header=FALSE)
Col_0_D89_N.chr2.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_N.chr2.10k.1000k.CG.txt", header=FALSE)
D89_N_S.chr2.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_N_S.chr2.10k.1000k.CG.txt", header=FALSE)
C10_4_N_S.chr2.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/C10_4_N_S.chr2.10k.1000k.CG.txt", header=FALSE) 
Col_0_N_S.chr2.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_N_S.chr2.10k.1000k.CG.txt", header=FALSE)
B7_N_S.chr2.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/B7_N_S.chr2.10k.1000k.CG.txt", header=FALSE)
Col_D89_C10_4_B7.N.chr2.1000K <- read.delim("~/Desktop/Claudia.WGBS/Col_D89_C10_4_B7.N.chr2.1000K.txt", header=FALSE)
Col_D89_C10_4_B7.S.chr2.1000K <- read.delim("~/Desktop/Claudia.WGBS/Col_D89_C10_4_B7.S.chr2.1000K.txt", header=FALSE)

D89_C10_4_S.chr3.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_S.chr3.10k.1000k.CG.txt", header=FALSE)
Col_0_C10_4_S.chr3.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_S.chr3.10k.1000k.CG.txt", header=FALSE)
Col_0_B7_S.chr3.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_S.chr3.10k.1000k.CG.txt", header=FALSE)
Col_0_D89_S.chr3.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_S.chr3.10k.1000k.CG.txt", header=FALSE)
D89_C10_4_N.chr3.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_N.chr3.10k.1000k.CG.txt", header=FALSE)
Col_0_C10_4_N.chr3.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_N.chr3.10k.1000k.CG.txt", header=FALSE)
Col_0_B7_N.chr3.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_N.chr3.10k.1000k.CG.txt", header=FALSE)
Col_0_D89_N.chr3.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_N.chr3.10k.1000k.CG.txt", header=FALSE)
D89_N_S.chr3.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_N_S.chr3.10k.1000k.CG.txt", header=FALSE)
C10_4_N_S.chr3.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/C10_4_N_S.chr3.10k.1000k.CG.txt", header=FALSE) 
Col_0_N_S.chr3.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_N_S.chr3.10k.1000k.CG.txt", header=FALSE)
B7_N_S.chr3.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/B7_N_S.chr3.10k.1000k.CG.txt", header=FALSE)
Col_D89_C10_4_B7.N.chr3.1000K <- read.delim("~/Desktop/Claudia.WGBS/Col_D89_C10_4_B7.N.chr3.1000K.txt", header=FALSE)
Col_D89_C10_4_B7.S.chr3.1000K <- read.delim("~/Desktop/Claudia.WGBS/Col_D89_C10_4_B7.S.chr3.1000K.txt", header=FALSE)

D89_C10_4_S.chr4.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_S.chr4.10k.1000k.CG.txt", header=FALSE)
Col_0_C10_4_S.chr4.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_S.chr4.10k.1000k.CG.txt", header=FALSE)
Col_0_B7_S.chr4.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_S.chr4.10k.1000k.CG.txt", header=FALSE)
Col_0_D89_S.chr4.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_S.chr4.10k.1000k.CG.txt", header=FALSE)
D89_C10_4_N.chr4.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_N.chr4.10k.1000k.CG.txt", header=FALSE)
Col_0_C10_4_N.chr4.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_N.chr4.10k.1000k.CG.txt", header=FALSE)
Col_0_B7_N.chr4.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_N.chr4.10k.1000k.CG.txt", header=FALSE)
Col_0_D89_N.chr4.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_N.chr4.10k.1000k.CG.txt", header=FALSE)
D89_N_S.chr4.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_N_S.chr4.10k.1000k.CG.txt", header=FALSE)
C10_4_N_S.chr4.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/C10_4_N_S.chr4.10k.1000k.CG.txt", header=FALSE) 
Col_0_N_S.chr4.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_N_S.chr4.10k.1000k.CG.txt", header=FALSE)
B7_N_S.chr4.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/B7_N_S.chr4.10k.1000k.CG.txt", header=FALSE)
Col_D89_C10_4_B7.N.chr4.1000K <- read.delim("~/Desktop/Claudia.WGBS/Col_D89_C10_4_B7.N.chr4.1000K.txt", header=FALSE)
Col_D89_C10_4_B7.S.chr4.1000K <- read.delim("~/Desktop/Claudia.WGBS/Col_D89_C10_4_B7.S.chr4.1000K.txt", header=FALSE)

D89_C10_4_S.chr5.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_S.chr5.10k.1000k.CG.txt", header=FALSE)
Col_0_C10_4_S.chr5.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_S.chr5.10k.1000k.CG.txt", header=FALSE)
Col_0_B7_S.chr5.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_S.chr5.10k.1000k.CG.txt", header=FALSE)
Col_0_D89_S.chr5.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_S.chr5.10k.1000k.CG.txt", header=FALSE)
D89_C10_4_N.chr5.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_C10_4_N.chr5.10k.1000k.CG.txt", header=FALSE)
Col_0_C10_4_N.chr5.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_C10_4_N.chr5.10k.1000k.CG.txt", header=FALSE)
Col_0_B7_N.chr5.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_B7_N.chr5.10k.1000k.CG.txt", header=FALSE)
Col_0_D89_N.chr5.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_D89_N.chr5.10k.1000k.CG.txt", header=FALSE)
D89_N_S.chr5.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/D89_N_S.chr5.10k.1000k.CG.txt", header=FALSE)
C10_4_N_S.chr5.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/C10_4_N_S.chr5.10k.1000k.CG.txt", header=FALSE) 
Col_0_N_S.chr5.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/Col_0_N_S.chr5.10k.1000k.CG.txt", header=FALSE)
B7_N_S.chr5.1000k.CG <- read.delim("~/Desktop/Claudia.WGBS/B7_N_S.chr5.10k.1000k.CG.txt", header=FALSE)
Col_D89_C10_4_B7.N.chr5.1000K <- read.delim("~/Desktop/Claudia.WGBS/Col_D89_C10_4_B7.N.chr5.1000K.txt", header=FALSE)
Col_D89_C10_4_B7.S.chr5.1000K <- read.delim("~/Desktop/Claudia.WGBS/Col_D89_C10_4_B7.S.chr5.1000K.txt", header=FALSE)



bpPerBin <- 1000000;
xLbl <- paste0('Mbp (bins of ',
               toString(round(bpPerBin/1000)),
               ' Kbp)');
yLbl <- 'Average %mCG Chr1'
ggplot( aes(x=D89_C10_4_N.chr1.1000k.CG, y=n, group=name, color=name)) +
  geom_line()

library(hrbrthemes)
library(viridis)
install.packages("RColorBrewer")
library(RColorBrewer) 

ggplot(D89_C10_4_N.chr5.1000k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  geom_line(alpha =0.8, size=2.5) +
  theme_classic() +
  ggsave("CG.line.CHR5.D89_C10-4.N.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(D89_C10_4_S.chr5.1000k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  geom_line(alpha =0.8, size=2.2) +
  theme_classic() +
  ggsave("CG.line.CHR5.D89_C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(D89_N_S.chr5.1000k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  geom_line(alpha =0.8, size=2.2) +
  theme_classic() +
  ggsave("CG.line.CHR5.D89.NS.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_B7_N.chr5.1000k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  geom_line(alpha =0.8, size=2.2) +
  theme_classic() +
  ggsave("CG.line.CHR5.Col_0_B7.N.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_B7_S.chr5.1000k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  geom_line(alpha =0.8, size=2.2) +
  theme_classic() +
  ggsave("CG.line.CHR5.Col_0_B7.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_C10_4_N.chr5.1000k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  geom_line(alpha =0.8, size=2.2) +
  theme_classic() +
  ggsave("CG.line.CHR5.Col_0_C10_4.N.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_C10_4_S.chr5.1000k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  geom_line(alpha =0.8, size=2.2) +
  theme_classic() +
  ggsave("CG.line.CHR5.Col_0_C10_4.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_D89_N.chr5.1000k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  geom_line(alpha =0.8, size=2.2) +
  theme_classic() +
  ggsave("CG.line.CHR5.Col_0_D89.N.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_D89_S.chr5.1000k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  geom_line(alpha =0.8, size=2.2) +
  theme_classic() +
  ggsave("CG.line.CHR5.Col_0_D89.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_N_S.chr5.1000k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  geom_line(alpha =0.8, size=2.2) +
  theme_classic() +
  ggsave("CG.line.CHR5.Col_0.NS.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(C10_4_N_S.chr5.1000k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  geom_line(alpha =0.8, size=2.2) +
  theme_classic()  +  ggsave("CG.line.CHR5.C10-4.NS.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(B7_N_S.chr5.1000k.CG, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  geom_line(alpha =0.8, size=2.2) +
  theme_classic()  +
  ggsave("CG.line.CHR5.B7.NS.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_D89_C10_4_B7.N.chr5.1000K, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  geom_line(alpha =0.8, size=2.2) +
  theme_classic()  +
  ggsave("CG.line.CHR5.N.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_D89_C10_4_B7.S.chr5.1000K, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  geom_line(alpha =0.8, size=2.2) +
  theme_classic()  +
  ggsave("CG.line.CHR5.S.png", plot = last_plot(), device = "png", dpi = 300 )

Col_D89_C10_4_B7.N.chr1.1000K <- read.delim("~/Desktop/Claudia.WGBS/Col_D89_C10_4_B7.N.chr1.1000K.txt", header=FALSE)
Col_D89_C10_4_B7.S.chr1.1000K <- read.delim("~/Desktop/Claudia.WGBS/Col_D89_C10_4_B7.S.chr1.1000K.txt", header=FALSE)

install.packages("ggthemes") # Install 
library(ggthemes) # Load


  #geom_line(aes(y = CG.1.Oview$C10_4_NS_Pct), color="green") +
 # geom_point(aes(y = CG.1.Oview$B7_NS_Pct), color="orange")  +  xlab(xLbl) + ylab(yLbl)

bpPerBin <- 10000;
CG.1.group.Oview <- CG.chr1.NS.Col.D89  %>%
  group_by(bin=floor(Coord/bpPerBin)) %>%
  summarize(MbpSemiCtr=mean(Coord)/10000.0,
            mC_percent=mean(mc__Pct, na.rm=TRUE), group=group)

#ggplot(data=CG.1.group.Oview, aes(x=MbpSemiCtr, y=mC_percent, group=group)) + geom_line() + xlab(xLbl) + ylab(yLbl)


  

ggplot(data=CG.1.group.Oview, aes(x=MbpSemiCtr, y=mC_percent, group=group)) +
geom_point(aes(color = group),alpha = 0.4) +  xlab(xLbl) + ylab(yLbl) +
  scale_color_manual(values = c("red", "blue"))
  

ggplot(data=CG.chr1.s.group, aes(x=Coord, y=D89_S_Pct, group=group)) +
  geom_line(aes(color = group),alpha = 8) +  xlab(xLbl) + ylab(yLbl) +
  scale_color_manual(values = c("red", "blue", "green", "orange"))

xLbl <- paste0('Mbp (bins of ',
               toString(round(bpPerBin/1000)),
               ' Kbp)');
yLbl <- 'Average %mCG Chr1'
ov <- function(y, g) {
  plot(CG.1.Oview$MbpSemiCtr, y,
       xlab=xLbl, ylab='Average %mCG Chr1',
       main=name, pch=20, xaxs="i",yaxs="i", type='line',
       col='green') 
  }



write.table(CG.chr1, sep='\t', file='CG.chr1.txt', row.names = FALSE)
?write.table()

#dev.off()

par(mfrow=c(3,1), oma=c(0.1,0.1,0.1,0.1))
ov(CG.1.Oview$Col_0_NS_Pct, 'Col NS')
ov(CG.1.Oview$D89_NS_Pct, 'D89 NS')
ov(CG.1.Oview$C10_4_NS_Pct, 'C10-4 NS')
ov(CG.1.Oview$B7_NS_Pct, 'B7 NS')

ov(CG.1.Oview$Col_0_S_Pct, 'Col S')
ov(CG.1.Oview$D89_S_Pct, 'D89 S')
ov(CG.1.Oview$C10_4_S_Pct, 'C10-4 S')
ov(CG.1.Oview$B7_S_Pct, 'B7 S')




Do <- function(pct, name) {
  hist(pct, breaks=seq(0,100,by=10), xlim=c(0,100),
       borde='darkblue', col='darkblue', main=name,
       xlab='Percent methylation', ylab='Number of CG sites', smooth=TRUE
}

Do(CG.chr1$B7_NS_Pct, 'B7 NS')
Do(CG.chr1$B7_S_Pct, 'B7 SS')


#install.packages("BiocManager")
#BiocManager::install("bsseq")
library(bsseq)

##DSS package
#BiocManager::install("DSS")
library(DSS)

B7NS <- CG.map.merged.c[,c(1,2,4,3)]
B7S <- CG.map.merged.c[,c(1,2,6,5)]
ColNS <- CG.map.merged.c[,c(1,2,8,7)]
ColS <- CG.map.merged.c[,c(1,2,10,9)]
C10NS <- CG.map.merged.c[,c(1,2,12,11)]
C10S <- CG.m=ap.merged.c[,c(1,2,14,13)]
D89S <- CG.map.merged.c[,c(1,2,18,17)]
D89NS <- CG.map.merged.c[,c(1,2,16,15)]

colnames(B7NS) <- c("chr", "pos", "N", "X")
colnames(B7S) <- c("chr", "pos", "N", "X")
colnames(ColNS) <- c("chr", "pos", "N", "X")
colnames(ColS) <- c("chr", "pos", "N", "X")
colnames(C10NS) <- c("chr", "pos", "N", "X")
colnames(C10S) <- c("chr", "pos", "N", "X")
colnames(D89S) <- c("chr", "pos", "N", "X")
colnames(D89NS) <- c("chr", "pos", "N", "X")


CG.BSobj <- makeBSseqData( list(B7NS, B7S, ColNS, ColS, C10NS, C10S, D89NS, D89S),
                           c("B7NS", "B7S", "ColNS", "ColS", "C10NS", "C10S", "D89NS", "D89S"))

CG.B7NS.BSobj <- CG.BSobj[,c(1,3)]
CG.NS.BSobj <- CG.BSobj[,c(1,3,5,7)]
CG.S.BSobj <- CG.BSobj[,c(2,4,6,8)]

CG.Col.D89NS.BSobj <- CG.BSobj[,c(3,7)]
CG.Col.C10.4NS.BSobj <- CG.BSobj[,c(3,5)]
CG.D89.C10.4NS.BSobj <- CG.BSobj[,c(7,5)]
CG.Col.B7.4NS.BSobj <- CG.BSobj[,c(3,1)]

dmlTest <- DMLtest(CG.B7NS.BSobj, c("B7NS"),c("ColNS"),smoothing = TRUE, BPPARAM=snow)
dmlTest.NS.S <- DMLtest(CG.BSobj, group1=c("B7NS","ColNS","C10NS","D89NS"), group2=c("B7S","ColS","C10S","D89S"), smoothing = TRUE, BPPARAM=snow)

dmr.dss.NS = callDMR(dmlTest.NS.S, delta=0, p.threshold=0.001,
                     minlen=50, minCG=3, dis.merge=100, pct.sig=0.5)

dmr.dss.NS.S = callDMR(dmlTest, delta=0, p.threshold=0.001,
                       minlen=50, minCG=3, dis.merge=100, pct.sig=0.5)

head(dmr.dss)
dim(dmr.dss)
showOneDMR(dmr.dss.NS[1,], CG.BSobj)


plotRegion(CG.BSobj, dmr.dss[1,], extend=10000, col=c(2,2,2,4,4,4), addPoints = T)

dmlTestC10NS <- DMLtest(CG.BSobj, c("C10NS"),c("ColNS"),smoothing = TRUE, BPPARAM=snow)
dmlTestC10NS <- DMLtest(CG.BSobj, c("D89NS"),c("ColNS"),smoothing = TRUE, BPPARAM=snow)
?callDMR

snow <- SnowParam(workers = 5)
head(dmlTest)

###BSmoth
CG.BSobj <- makeBSseqData( list(B7NS, B7S, ColNS, ColS, C10NS, C10S, D89NS, D89S),
                           c("B7NS", "B7S", "ColNS", "ColS", "C10NS", "C10S", "D89NS", "D89S"))
CG.Col.D89NS.BSobj <- CG.BSobj[,c(3,7)]
CG.Col.C10.4NS.BSobj <- CG.BSobj[,c(3,5)]
CG.D89.C10.4NS.BSobj <- CG.BSobj[,c(7,5)]
CG.Col.B7.4NS.BSobj <- CG.BSobj[,c(3,1)]

CG.ColNS.BSobj <- CG.BSobj[,3]
CG.C10.4NS.BSobj <- CG.BSobj[,5]
CG.B7NS.BSobj <- CG.BSobj[,1]
CG.D89NS.BSobj <- CG.BSobj[,7]

CG.ColS.BSobj <- CG.BSobj[,4]
CG.C10.4S.BSobj <- CG.BSobj[,6]
CG.B7S.BSobj <- CG.BSobj[,2]
CG.D89S.BSobj <- CG.BSobj[,8]
save(CG.BSobj, file = "CG.BSobj.rda")

##Split large CG files for smoothing
CG.ColNS.BSobj_s <- BSmooth(CG.ColNS.BSobj, verbose =TRUE)
CG.C10.4NS.BSobj_s <- BSmooth(CG.C10.4NS.BSobj, verbose =TRUE)
CG.B7NS.BSobj_s <- BSmooth(CG.B7NS.BSobj, verbose =TRUE)
CG.D89NS.BSobj_s <- BSmooth(CG.D89NS.BSobj, verbose =TRUE)

CG.ColS.BSobj_s <- BSmooth(CG.ColS.BSobj, verbose =TRUE)
CG.C10.4S.BSobj_s <- BSmooth(CG.C10.4S.BSobj, verbose =TRUE)
CG.B7S.BSobj_s <- BSmooth(CG.B7S.BSobj, verbose =TRUE)
CG.D89S.BSobj_s <- BSmooth(CG.D89S.BSobj, verbose =TRUE)



##Get coverage before running tstats
CG.BSobj_S.cov <- getCoverage(CG.BSobj_s)

#Number of CpGs which are covered by at least 1 read in all 8 samples
sum(rowSums(CG.BSobj_S.cov >= 1) == 8)

##Number of CpG with 0 coverage in all samples
sum(rowSums(CG.BSobj_S.cov == 0))

sum(rowSums(CG.BSobj_S.cov >= 8) == 8)

keepLoci.ex <- which(rowSums(CG.BSobj_S.cov >= 8) >= 8)
length(keepLoci.ex)

BS.tstat <- BSmooth.tstat(CG.BSobj_s[keepLoci.ex], 
                          group1 ="ColNS" ,
                          group2 = c("D89NS", "C10NS", "B7S") ,
                          estimate.var = "group2")

stats = getStats(BS.tstat)
head(stats)
plot(BS.tstat)
DMRs.NS = dmrFinder(BS.tstat, cutoff = c(-4.6, 4.6))
dmrs <- subset(DMRs.NS, n >= 3 & abs(meanDiff) >= 0.1)
nrow(dmrs)
head(dmrs, n = 3)

pdata <- pData(CG.BSobj_s)
pdata$col <- c('red','blue')
pData(CG.BSobj_s) <- pdata
plotManyRegions(CG.BSobj_s, dmrs[300:400,], extend = 10600, addRegions = dmrs)
