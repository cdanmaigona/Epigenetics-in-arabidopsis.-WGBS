source("http://zzlab.net/GAPIT/GAPIT.library.R")
source("http://zzlab.net/GAPIT/gapit_functions.txt")
CHH.map.merged.c <- read.delim("~/Desktop/Claudia.WGBS/CHH.map.merged.c.txt")
##CHH
NAto0 <- function(v) {v[is.na(v)] <- 0; v}
B7_NS.N <- NAto0(CHH.map.merged.c$B7_NS.N); B7_NS.D <- NAto0(CHH.map.merged.c$B7_NS.D);
B7_S.N <- NAto0(CHH.map.merged.c$B7_S.N); B7_S.D <- NAto0(CHH.map.merged.c$B7_S.D);
Col_0_NS.N <- NAto0(CHH.map.merged.c$Col_0_NS.N); Col_0_NS.D <- NAto0(CHH.map.merged.c$Col_0_NS.D);
Col_0_S.N <- NAto0(CHH.map.merged.c$Col_0_S.N); Col_0_S.D <- NAto0(CHH.map.merged.c$Col_0_S.D);
C10_4_NS.N <- NAto0(CHH.map.merged.c$C10_4_NS.N); C10_4_NS.D <- NAto0(CHH.map.merged.c$C10_4_NS.D);
C10_4_S.N <- NAto0(CHH.map.merged.c$C10_4_S.N); C10_4_S.D <- NAto0(CHH.map.merged.c$C10_4_S.D);
D89_NS.N <- NAto0(CHH.map.merged.c$D89_NS.N); D89_NS.D <- NAto0(CHH.map.merged.c$D89_NS.D);
D89_S.N <- NAto0(CHH.map.merged.c$D89_S.N); D89_S.D <- NAto0(CHH.map.merged.c$D89_S.D);
##Get percentages
B7_NS_P <- 100.0*B7_NS.N/B7_NS.D; B7_S_P <- 100.00*B7_S.N/B7_S.D;
Col_0_NS_P <- 100.0*Col_0_NS.N/Col_0_NS.D; Col_0_S_P <- 100.0*Col_0_S.N/Col_0_S.D;
C10_4_NS_P <- 100.0*C10_4_NS.N/C10_4_NS.D; C10_4_S_P <- 100.00*C10_4_S.N/C10_4_S.D;
D89_NS_P <- 100.0*D89_NS.N/D89_NS.D; D89_S_P <- 100.00*D89_S.N/D89_S.D;

head(C10_4_S_P)
head(Col_0_S_P)
head(B7_NS_P)

CHH <- data.frame(ChrName=CHH.map.merged.c$Chrom, Coord=CHH.map.merged.c$Pos,
                  B7_NS_Pct=B7_NS_P, B7_S_Pct=B7_S_P, B7_NS_Cvg=B7_NS.D, B7_S_Cvg=B7_S.D,
                  Col_0_NS_Pct=Col_0_NS_P, Col_0_S_Pct=Col_0_S_P, Col_0_NS_Cvg=Col_0_NS.D, Col_0_S_Cvg=Col_0_S.D,
                  C10_4_NS_Pct=C10_4_NS_P, C10_4_S_Pct=C10_4_S_P, C10_4_NS_Cvg=C10_4_NS.D, C10_4_S_Cvg=C10_4_S.D,
                  D89_NS_Pct=D89_NS_P, D89_S_Pct=D89_S_P, D89_NS_Cvg=D89_NS.D, D89_S.Cvg=D89_S.D  )
library(dplyr)
Chr <- "chr5";
CHH.chr1 <- CHH[CHH$ChrName==Chr, ];
head(CHH.chr1)
bpPerBin <- 10000;
CHH.1.Oview <- CHH.chr1  %>%
  group_by(bin=floor(Coord/bpPerBin)) %>%
  summarize(MbpSemiCtr=mean(Coord)/10000.0,
            B7_NS_Pct=mean(B7_NS_Pct, na.rm=TRUE), B7_S_Pct=mean(B7_S_Pct, na.rm=TRUE),
            B7_S_Cvg=sum(B7_S_Cvg, na.rm=TRUE), B7_NS_Cvg=sum(B7_NS_Cvg, na.rm=TRUE),
            Col_0_NS_Pct=mean(Col_0_NS_Pct, na.rm=TRUE), Col_0_S_Pct=mean(Col_0_S_Pct, na.rm=TRUE),
            Col_0_NS_Cvg=sum(Col_0_NS_Cvg, na.rm=TRUE), Col_0_S_Cvg=sum(Col_0_S_Cvg, na.rm=TRUE),
            C10_4_NS_Pct=mean(C10_4_NS_Pct, na.rm=TRUE), C10_4_S_Pct=mean(C10_4_S_Pct, na.rm=TRUE),
            C10_4_NS_Cvg=sum(C10_4_NS_Cvg, na.rm=TRUE), C10_4_S_Cvg=sum(C10_4_S_Cvg, na.rm=TRUE),
            D89_NS_Pct=mean(D89_NS_Pct, na.rm=TRUE), D89_S_Pct=mean(D89_S_Pct, na.rm=TRUE),
            D89_NS_Cvg=sum(D89_NS_Cvg, na.rm=TRUE), D89_S.Cvg=sum(D89_S.Cvg, na.rm=TRUE))
write.table(CHH.1.Oview, file='CHH.5.Oview.txt', sep="\t", row.name=FALSE)

ggplot(data=CHG.1.Oview, aes(x=MbpSemiCtr)) + 
  geom_point(aes(y = D89_NS_Pct), color = "darkblue", alpha=0.6, size=1, show.legend=TRUE) + 
  geom_point(aes(y = C10_4_NS_Pct), color="magenta", alpha =0.6, size=1,  show.legend=TRUE) +  xlab(xLbl) + ylab(yLbl) + ggtitle("D89 vs C10-4 N") +
  theme_bw()

ggplot(Col_0_D89_S.chr4.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "darkgreen", "D89_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

###CHG.chrom1


xLbl <- paste0('Mbp (bins of ',
               toString(round(bpPerBin/1000)),
               ' Kbp)');
yLbl <- 'Average %mCHG Chr5'

ggplot(Col_0_D89_S.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "darkgreen", "D89_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(Col_0_D89_N.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_N" = "darkgreen", "D89_N" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(Col_0_C10_4_N.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_N" = "darkgreen", "C10_4_N" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(Col_0_C10_4_S.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "darkgreen", "C10_4_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(Col_0_B7_N.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_N" = "darkgreen", "B7_N" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(Col_0_B7_S.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "darkgreen", "B7_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(Col_0_N_S.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_N" = "darkgreen", "Col_0_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(D89_N_S.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_N" = "darkgreen", "D89_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(B7_N_S.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("B7_N" = "darkgreen", "B7_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(C10_4_N_S.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("C10_4_N" = "darkgreen", "C10_4_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()
#####

ggplot(Col_0_D89_S.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "darkgreen", "D89_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(Col_0_D89_N.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_N" = "darkgreen", "D89_N" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(Col_0_C10_4_N.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_N" = "darkgreen", "C10_4_N" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(Col_0_C10_4_S.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "darkgreen", "C10_4_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(Col_0_B7_N.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_N" = "darkgreen", "B7_N" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(Col_0_B7_S.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "darkgreen", "B7_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(Col_0_N_S.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_N" = "darkgreen", "Col_0_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(D89_N_S.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_N" = "darkgreen", "D89_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(B7_N_S.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("B7_N" = "darkgreen", "B7_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()

ggplot(C10_4_N_S.chr5.10k, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("C10_4_N" = "darkgreen", "C10_4_S" = "magenta")) + geom_point(alpha =0.4, size=0.6) +
  theme_classic()
