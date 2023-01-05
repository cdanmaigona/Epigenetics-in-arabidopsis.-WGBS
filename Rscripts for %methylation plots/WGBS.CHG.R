source("http://zzlab.net/GAPIT/GAPIT.library.R")
source("http://zzlab.net/GAPIT/gapit_functions.txt")

###CHP plots
NAto0 <- function(v) {v[is.na(v)] <- 0; v}
B7_NS.N <- NAto0(CHG.map.merged.c$B7_NS.N); B7_NS.D <- NAto0(CHG.map.merged.c$B7_NS.D);
B7_S.N <- NAto0(CHG.map.merged.c$B7_S.N); B7_S.D <- NAto0(CHG.map.merged.c$B7_S.D);
Col_0_NS.N <- NAto0(CHG.map.merged.c$Col_0_NS.N); Col_0_NS.D <- NAto0(CHG.map.merged.c$Col_0_NS.D);
Col_0_S.N <- NAto0(CHG.map.merged.c$Col_0_S.N); Col_0_S.D <- NAto0(CHG.map.merged.c$Col_0_S.D);
C10_4_NS.N <- NAto0(CHG.map.merged.c$C10_4_NS.N); C10_4_NS.D <- NAto0(CHG.map.merged.c$C10_4_NS.D);
C10_4_S.N <- NAto0(CHG.map.merged.c$C10_4_S.N); C10_4_S.D <- NAto0(CHG.map.merged.c$C10_4_S.D);
D89_NS.N <- NAto0(CHG.map.merged.c$D89_NS.N); D89_NS.D <- NAto0(CHG.map.merged.c$D89_NS.D);
D89_S.N <- NAto0(CHG.map.merged.c$D89_S.N); D89_S.D <- NAto0(CHG.map.merged.c$D89_S.D);
##Get percentages
B7_NS_P <- 100.0*B7_NS.N/B7_NS.D; B7_S_P <- 100.00*B7_S.N/B7_S.D;
Col_0_NS_P <- 100.0*Col_0_NS.N/Col_0_NS.D; Col_0_S_P <- 100.0*Col_0_S.N/Col_0_S.D;
C10_4_NS_P <- 100.0*C10_4_NS.N/C10_4_NS.D; C10_4_S_P <- 100.00*C10_4_S.N/C10_4_S.D;
D89_NS_P <- 100.0*D89_NS.N/D89_NS.D; D89_S_P <- 100.00*D89_S.N/D89_S.D;

head(C10_4_S_P)
head(Col_0_S_P)
head(B7_NS_P)

CHG <- data.frame(ChrName=CHG.map.merged.c$Chrom, Coord=CHG.map.merged.c$Pos,
                 B7_NS_Pct=B7_NS_P, B7_S_Pct=B7_S_P, B7_NS_Cvg=B7_NS.D, B7_S_Cvg=B7_S.D,
                 Col_0_NS_Pct=Col_0_NS_P, Col_0_S_Pct=Col_0_S_P, Col_0_NS_Cvg=Col_0_NS.D, Col_0_S_Cvg=Col_0_S.D,
                 C10_4_NS_Pct=C10_4_NS_P, C10_4_S_Pct=C10_4_S_P, C10_4_NS_Cvg=C10_4_NS.D, C10_4_S_Cvg=C10_4_S.D,
                 D89_NS_Pct=D89_NS_P, D89_S_Pct=D89_S_P, D89_NS_Cvg=D89_NS.D, D89_S.Cvg=D89_S.D  )
