B7_C10_4_S.chr1.10k.CG.1L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/B7_C10_4_S.chr1.10k.CG.1L.50bp.1.txt", header=FALSE)
B7_C10_4_S.chr1.10k.CG.1L.50bp.1[is.na(B7_C10_4_S.chr1.10k.CG.1L.50bp.1)] <- 0
Col_0_B7_S.chr1.10k.CG.1L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_B7_S.chr1.10k.CG.1L.50bp.1.txt", header=FALSE)
Col_0_B7_S.chr1.10k.CG.1L.50bp.1[is.na(Col_0_B7_S.chr1.10k.CG.1L.50bp.1)] <- 0
Col_0_C10_4_S.chr1.10k.CG.1L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_C10_4_S.chr1.10k.CG.1L.50bp.1.txt", header=FALSE)
Col_0_C10_4_S.chr1.10k.CG.1L.50bp.1[is.na(Col_0_C10_4_S.chr1.10k.CG.1L.50bp.1)] <- 0
Col_0_D89_B7_C10_4_S.chr1.10k.CG.1L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_B7_C10_4_S.chr1.10k.CG.1L.50bp.1.txt", header=FALSE)
Col_0_D89_B7_C10_4_S.chr1.10k.CG.1L.50bp.1[is.na(Col_0_D89_B7_C10_4_S.chr1.10k.CG.1L.50bp.1)] <- 0
Col_0_D89_S.chr1.10k.CG.1L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_S.chr1.10k.CG.1L.50bp.1.txt", header=FALSE)
Col_0_D89_S.chr1.10k.CG.1L.50bp.1[is.na(Col_0_D89_S.chr1.10k.CG.1L.50bp.1)] <- 0
D89_B7_S.chr1.10k.CG.1L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_B7_S.chr1.10k.CG.1L.50bp.1.txt", header=FALSE)
D89_C10_4_S.chr1.10k.CG.1L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_C10_4_S.chr1.10k.CG.1L.50bp.1.txt", header=FALSE)
D89_C10_4_S.chr1.10k.CG.1L.50bp.1[is.na(D89_C10_4_S.chr1.10k.CG.1L.50bp.1)] <- 0

bpPerBin <- 50
xLbl <- paste0('bins of 50');
yLbl <- 'Average %mCG Chr1 1L'

ggplot(D89_C10_4_S.chr1.10k.CG.1L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "C10_4_S" = "#e8d336")) + geom_line(alpha =1, size=1, se=FALSE) +
  theme_classic() +
  ggsave("CG.CHR1.line.1L.D89.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_C10_4_S.chr1.10k.CG.1L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "C10_4_S" = "#e8d336")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR1.line.1L.Col.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_B7_S.chr1.10k.CG.1L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "B7_S" = "#a88c60")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR1.line.1L.Col.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_S.chr1.10k.CG.1L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR1.line.1L.D89.Col.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(B7_C10_4_S.chr1.10k.CG.1L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("B7_S" = "#a88c60", "C10_4_S" = "#F0E27B")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR1.line.1L.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(D89_B7_S.chr1.10k.CG.1L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "B7_S" = "#a88c60")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR1.line.1L.D89.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_B7_C10_4_S.chr1.10k.CG.1L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500","B7_S" = "#a88c60", "C10_4_S" = "#F0E27B" )) + 
  geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR1.line.1L.Col.D89.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

##2L
B7_C10_4_S.chr2.10k.CG.2L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/B7_C10_4_S.chr2.10k.CG.2L.50bp.1.txt", header=FALSE)
Col_0_B7_S.chr2.10k.CG.2L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_B7_S.chr2.10k.CG.2L.50bp.1.txt", header=FALSE)
Col_0_C10_4_S.chr2.10k.CG.2L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_C10_4_S.chr2.10k.CG.2L.50bp.1.txt", header=FALSE)
Col_0_D89_B7_C10_4_S.chr2.10k.CG.2L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_B7_C10_4_S.chr2.10k.CG.2L.50bp.1.txt", header=FALSE)
Col_0_D89_S.chr2.10k.CG.2L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_S.chr2.10k.CG.2L.50bp.1.txt", header=FALSE)
D89_B7_S.chr2.10k.CG.2L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_B7_S.chr2.10k.CG.2L.50bp.1.txt", header=FALSE)
D89_C10_4_S.chr2.10k.CG.2L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_C10_4_S.chr2.10k.CG.2L.50bp.1.txt", header=FALSE)
bpPerBin <- 50
xLbl <- paste0('bins of 50');
yLbl <- 'Average %mCG Chr2 2L'

ggplot(D89_C10_4_S.chr2.10k.CG.2L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "C10_4_S" = "#e8d336")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR2.line.2L.D89.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_C10_4_S.chr2.10k.CG.2L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "C10_4_S" = "#e8d336")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR2.line.2L.Col.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_B7_S.chr2.10k.CG.2L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "B7_S" = "#a88c60")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR2.line.2L.Col.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_S.chr2.10k.CG.2L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR2.line.2L.D89.Col.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(B7_C10_4_S.chr2.10k.CG.2L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("B7_S" = "#a88c60", "C10_4_S" = "#F0E27B")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR2.line.2L.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(D89_B7_S.chr2.10k.CG.2L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "B7_S" = "#a88c60")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR2.line.2L.D89.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_B7_C10_4_S.chr2.10k.CG.2L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500","B7_S" = "#a88c60", "C10_4_S" = "#F0E27B" )) + 
  geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR2.2L.Col.D89.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

##3L
B7_C10_4_S.chr3.10k.CG.3L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/B7_C10_4_S.chr3.10k.CG.3L.50bp.1.txt", header=FALSE)
Col_0_B7_S.chr3.10k.CG.3L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_B7_S.chr3.10k.CG.3L.50bp.1.txt", header=FALSE)
Col_0_C10_4_S.chr3.10k.CG.3L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_C10_4_S.chr3.10k.CG.3L.50bp.1.txt", header=FALSE)
Col_0_D89_B7_C10_4_S.chr3.10k.CG.3L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_B7_C10_4_S.chr3.10k.CG.3L.50bp.1.txt", header=FALSE)
Col_0_D89_S.chr3.10k.CG.3L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_S.chr3.10k.CG.3L.50bp.1.txt", header=FALSE)
D89_B7_S.chr3.10k.CG.3L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_B7_S.chr3.10k.CG.3L.50bp.1.txt", header=FALSE)
D89_C10_4_S.chr3.10k.CG.3L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_C10_4_S.chr3.10k.CG.3L.50bp.1.txt", header=FALSE)
bpPerBin <- 50
xLbl <- paste0('bins of 50');
yLbl <- 'Average %mCG Chr3 3L'

ggplot(D89_C10_4_S.chr3.10k.CG.3L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "C10_4_S" = "#e8d336")) + geom_line(alpha =1, size=1, se=FALSE) +
  theme_classic() +
  ggsave("CG.CHR3.line.3L.D89.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_C10_4_S.chr3.10k.CG.3L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "C10_4_S" = "#e8d336")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR3.line.3L.Col.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_B7_S.chr3.10k.CG.3L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "B7_S" = "#a88c60")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR3.line.3L.Col.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_S.chr3.10k.CG.3L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR3.line.3L.D89.Col.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(B7_C10_4_S.chr3.10k.CG.3L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("B7_S" = "#a88c60", "C10_4_S" = "#F0E27B")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR3.line.3L.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(D89_B7_S.chr3.10k.CG.3L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "B7_S" = "#a88c60")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR3.line.3L.D89.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_B7_C10_4_S.chr3.10k.CG.3L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500","B7_S" = "#a88c60", "C10_4_S" = "#F0E27B" )) + 
  geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR3.line.3L.Col.D89.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

##4L
B7_C10_4_S.chr4.10k.CG.4L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/B7_C10_4_S.chr4.10k.CG.4L.50bp.1.txt", header=FALSE)
Col_0_B7_S.chr4.10k.CG.4L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_B7_S.chr4.10k.CG.4L.50bp.1.txt", header=FALSE)
Col_0_C10_4_S.chr4.10k.CG.4L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_C10_4_S.chr4.10k.CG.4L.50bp.1.txt", header=FALSE)
Col_0_D89_B7_C10_4_S.chr4.10k.CG.4L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_B7_C10_4_S.chr4.10k.CG.4L.50bp.1.txt", header=FALSE)
Col_0_D89_S.chr4.10k.CG.4L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_S.chr4.10k.CG.4L.50bp.1.txt", header=FALSE)
D89_B7_S.chr4.10k.CG.4L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_B7_S.chr4.10k.CG.4L.50bp.1.txt", header=FALSE)
D89_C10_4_S.chr4.10k.CG.4L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_C10_4_S.chr4.10k.CG.4L.50bp.1.txt", header=FALSE)

bpPerBin <- 50
xLbl <- paste0('bins of 50');
yLbl <- 'Average %mCG Chr4 4L'

ggplot(D89_C10_4_S.chr4.10k.CG.4L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "C10_4_S" = "#e8d336")) + geom_line(alpha =1, size=1, se=FALSE) +
  theme_classic() +
  ggsave("CG.CHR4.line.4L.D89.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_C10_4_S.chr4.10k.CG.4L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "C10_4_S" = "#e8d336")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR4.line.4L.Col.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_B7_S.chr4.10k.CG.4L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "B7_S" = "#a88c60")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR4.line.4L.Col.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_S.chr4.10k.CG.4L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR4.line.4L.D89.Col.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(B7_C10_4_S.chr4.10k.CG.4L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("B7_S" = "#a88c60", "C10_4_S" = "#F0E27B")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR4.line.4L.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(D89_B7_S.chr4.10k.CG.4L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "B7_S" = "#a88c60")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR4.line.4L.D89.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_B7_C10_4_S.chr4.10k.CG.4L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500","B7_S" = "#a88c60", "C10_4_S" = "#F0E27B" )) + 
  geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR4.line.4L.Col.D89.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

##5L
B7_C10_4_S.chr5.10k.CG.5L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/B7_C10_4_S.chr5.10k.CG.5L.50bp.1.txt", header=FALSE)
Col_0_B7_S.chr5.10k.CG.5L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_B7_S.chr5.10k.CG.5L.50bp.1.txt", header=FALSE)
Col_0_C10_4_S.chr5.10k.CG.5L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_C10_4_S.chr5.10k.CG.5L.50bp.1.txt", header=FALSE)
Col_0_D89_B7_C10_4_S.chr5.10k.CG.5L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_B7_C10_4_S.chr5.10k.CG.5L.50bp.1.txt", header=FALSE)
Col_0_D89_S.chr5.10k.CG.5L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_S.chr5.10k.CG.5L.50bp.1.txt", header=FALSE)
D89_B7_S.chr5.10k.CG.5L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_B7_S.chr5.10k.CG.5L.50bp.1.txt", header=FALSE)
D89_C10_4_S.chr5.10k.CG.5L.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_C10_4_S.chr5.10k.CG.5L.50bp.1.txt", header=FALSE)

bpPerBin <- 50
xLbl <- paste0('bins of 50');
yLbl <- 'Average %mCG Chr5 5L'

ggplot(D89_C10_4_S.chr5.10k.CG.5L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "C10_4_S" = "#e8d336")) + geom_line(alpha =1, size=1, se=FALSE) +
  theme_classic() +
  ggsave("CG.CHR5.line.5L.D89.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_C10_4_S.chr5.10k.CG.5L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "C10_4_S" = "#e8d336")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR5.line.5L.Col.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_B7_S.chr5.10k.CG.5L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "B7_S" = "#a88c60")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR5.line.5L.Col.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_S.chr5.10k.CG.5L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR5.line.5L.D89.Col.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(B7_C10_4_S.chr5.10k.CG.5L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("B7_S" = "#a88c60", "C10_4_S" = "#F0E27B")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR5.line.5L.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(D89_B7_S.chr5.10k.CG.5L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "B7_S" = "#a88c60")) + geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR5.line.5L.D89.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_B7_C10_4_S.chr5.10k.CG.5L.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500","B7_S" = "#a88c60", "C10_4_S" = "#F0E27B" )) + 
  geom_line(alpha =1, size=1) +
  theme_classic() +
  ggsave("CG.CHR5.line.5L.Col.D89.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

##1R
B7_C10_4_S.chr1.10k.CG.1R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/B7_C10_4_S.chr1.10k.CG.1R.50bp.1.txt", header=FALSE)
Col_0_B7_S.chr1.10k.CG.1R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_B7_S.chr1.10k.CG.1R.50bp.1.txt", header=FALSE)
Col_0_C10_4_S.chr1.10k.CG.1R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_C10_4_S.chr1.10k.CG.1R.50bp.1.txt", header=FALSE)
Col_0_D89_B7_C10_4_S.chr1.10k.CG.1R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_B7_C10_4_S.chr1.10k.CG.1R.50bp.1.txt", header=FALSE)
Col_0_D89_S.chr1.10k.CG.1R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_S.chr1.10k.CG.1R.50bp.1.txt", header=FALSE)
D89_B7_S.chr1.10k.CG.1R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_B7_S.chr1.10k.CG.1R.50bp.1.txt", header=FALSE)
D89_C10_4_S.chr1.10k.CG.1R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_C10_4_S.chr1.10k.CG.1R.50bp.1.txt", header=FALSE)


bpPerBin <- 50
xLbl <- paste0('bins of 50');
yLbl <- 'Average %mCG Chr1 1R'

ggplot(D89_C10_4_S.chr1.10k.CG.1R.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "C10_4_S" = "#e8d336")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.1R.line.CHR1R.D89_C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_C10_4_S.chr1.10k.CG.1R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "C10_4_S" = "#e8d336")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.1R.CHR1.Col.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_B7_S.chr1.10k.CG.1R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "B7_S" = "#a88c60")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.1R.CHR1.Col.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_S.chr1.10k.CG.1R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.1R.CHR1.D89.Col.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(B7_C10_4_S.chr1.10k.CG.1R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("B7_S" = "#a88c60", "C10_4_S" = "#F0E27B")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.1R.CHR1.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(D89_B7_S.chr1.10k.CG.1R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "B7_S" = "#a88c60")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.1R.CHR1.D89.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_B7_C10_4_S.chr1.10k.CG.1R.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500","B7_S" = "#a88c60", "C10_4_S" = "#F0E27B" )) + 
  geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.1R.CHR1.Col.D89.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 


##2R
B7_C10_4_S.chr2.10k.CG.2R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/B7_C10_4_S.chr2.10k.CG.2R.50bp.1.txt", header=FALSE)
B7_C10_4_S.chr2.10k.CG.2R.50bp.1[is.na(B7_C10_4_S.chr2.10k.CG.2R.50bp.1)] <- 0
Col_0_B7_S.chr2.10k.CG.2R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_B7_S.chr2.10k.CG.2R.50bp.1.txt", header=FALSE)
Col_0_B7_S.chr2.10k.CG.2R.50bp.1[is.na(Col_0_B7_S.chr2.10k.CG.2R.50bp.1)] <- 0
Col_0_C10_4_S.chr2.10k.CG.2R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_C10_4_S.chr2.10k.CG.2R.50bp.1.txt", header=FALSE)
Col_0_C10_4_S.chr2.10k.CG.2R.50bp.1[is.na(Col_0_C10_4_S.chr2.10k.CG.2R.50bp.1)] <- 0
Col_0_D89_B7_C10_4_S.chr2.10k.CG.2R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_B7_C10_4_S.chr2.10k.CG.2R.50bp.1.txt", header=FALSE)
Col_0_D89_B7_C10_4_S.chr2.10k.CG.2R.50bp.1[is.na(Col_0_D89_B7_C10_4_S.chr2.10k.CG.2R.50bp.1)] <- 0
Col_0_D89_S.chr2.10k.CG.2R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_S.chr2.10k.CG.2R.50bp.1.txt", header=FALSE)
Col_0_D89_S.chr2.10k.CG.2R.50bp.1[is.na(Col_0_D89_S.chr2.10k.CG.2R.50bp.1)] <- 0
D89_B7_S.chr2.10k.CG.2R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_B7_S.chr2.10k.CG.2R.50bp.1.txt", header=FALSE)
D89_B7_S.chr2.10k.CG.2R.50bp.1[is.na(D89_B7_S.chr2.10k.CG.2R.50bp.1)] <- 0
D89_C10_4_S.chr2.10k.CG.2R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_C10_4_S.chr2.10k.CG.2R.50bp.1.txt", header=FALSE)
D89_C10_4_S.chr2.10k.CG.2R.50bp.1[is.na(D89_C10_4_S.chr2.10k.CG.2R.50bp.1)] <- 0
bpPerBin <- 50
xLbl <- paste0('bins of 50');
yLbl <- 'Average %mCG Chr2 2R'

ggplot(D89_C10_4_S.chr2.10k.CG.2R.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "C10_4_S" = "#e8d336")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.2R.line.CHR2R.D89_C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_C10_4_S.chr2.10k.CG.2R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "C10_4_S" = "#e8d336")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.2R.line.CHR2.Col.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_B7_S.chr2.10k.CG.2R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "B7_S" = "#a88c60")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.2R.line.CHR2.Col.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_S.chr2.10k.CG.2R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.2R.line.CHR2.D89.Col.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(B7_C10_4_S.chr2.10k.CG.2R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("B7_S" = "#a88c60", "C10_4_S" = "#F0E27B")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.2R.line.CHR2.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(D89_B7_S.chr2.10k.CG.2R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "B7_S" = "#a88c60")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.2R.line.CHR2.D89.B7.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

ggplot(Col_0_D89_B7_C10_4_S.chr2.10k.CG.2R.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500","B7_S" = "#a88c60", "C10_4_S" = "#F0E27B" )) + 
  geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.2R.line.CHR2.Col.D89.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 ) 

##3R
B7_C10_4_S.chr3.10k.CG.3R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/B7_C10_4_S.chr3.10k.CG.3R.50bp.1.txt", header=FALSE)
B7_C10_4_S.chr3.10k.CG.3R.50bp.1[is.na(B7_C10_4_S.chr3.10k.CG.3R.50bp.1)] <- 0
Col_0_B7_S.chr3.10k.CG.3R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_B7_S.chr3.10k.CG.3R.50bp.1.txt", header=FALSE)
Col_0_B7_S.chr3.10k.CG.3R.50bp.1[is.na(Col_0_B7_S.chr3.10k.CG.3R.50bp.1)] <- 0
Col_0_C10_4_S.chr3.10k.CG.3R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_C10_4_S.chr3.10k.CG.3R.50bp.1.txt", header=FALSE)
Col_0_C10_4_S.chr3.10k.CG.3R.50bp.1[is.na(Col_0_C10_4_S.chr3.10k.CG.3R.50bp.1)] <- 0 
Col_0_D89_B7_C10_4_S.chr3.10k.CG.3R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_B7_C10_4_S.chr3.10k.CG.3R.50bp.1.txt", header=FALSE)
Col_0_D89_B7_C10_4_S.chr3.10k.CG.3R.50bp.1[is.na(Col_0_D89_B7_C10_4_S.chr3.10k.CG.3R.50bp.1)] <- 0
Col_0_D89_S.chr3.10k.CG.3R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_S.chr3.10k.CG.3R.50bp.1.txt", header=FALSE)
Col_0_D89_S.chr3.10k.CG.3R.50bp.1[is.na(Col_0_D89_S.chr3.10k.CG.3R.50bp.1)] <- 0
D89_B7_S.chr3.10k.CG.3R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_B7_S.chr3.10k.CG.3R.50bp.1.txt", header=FALSE)
D89_B7_S.chr3.10k.CG.3R.50bp.1[is.na(D89_B7_S.chr3.10k.CG.3R.50bp.1)] <- 0
D89_C10_4_S.chr3.10k.CG.3R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_C10_4_S.chr3.10k.CG.3R.50bp.1.txt", header=FALSE)
D89_C10_4_S.chr3.10k.CG.3R.50bp.1[is.na(D89_C10_4_S.chr3.10k.CG.3R.50bp.1)] <- 0

bpPerBin <- 50
xLbl <- paste0('bins of 50');
yLbl <- 'Average %mCG Chr3 3R'

ggplot(D89_C10_4_S.chr3.10k.CG.3R.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "C10_4_S" = "#e8d336")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.3R.line.CHR3R.D89_C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_C10_4_S.chr3.10k.CG.3R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "C10_4_S" = "#e8d336")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.3R.line.CHR3.Col.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_B7_S.chr3.10k.CG.3R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "B7_S" = "#a88c60")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.3R.line.CHR3.Col.B7.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_D89_S.chr3.10k.CG.3R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.3R.line.CHR3.D89.Col.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(B7_C10_4_S.chr3.10k.CG.3R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("B7_S" = "#a88c60", "C10_4_S" = "#F0E27B")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.3R.line.CHR3.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(D89_B7_S.chr3.10k.CG.3R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "B7_S" = "#a88c60")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.3R.line.CHR3.D89.B7.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_D89_B7_C10_4_S.chr3.10k.CG.3R.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500","B7_S" = "#a88c60", "C10_4_S" = "#F0E27B" )) +
  geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.3R.line.CHR3.Col.D89.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )
#4R
B7_C10_4_S.chr4.10k.CG.4R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/B7_C10_4_S.chr4.10k.CG.4R.50bp.1.txt", header=FALSE)
B7_C10_4_S.chr4.10k.CG.4R.50bp.1 [is.na(B7_C10_4_S.chr4.10k.CG.4R.50bp.1 )] <- 0
Col_0_B7_S.chr4.10k.CG.4R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_B7_S.chr4.10k.CG.4R.50bp.1.txt", header=FALSE)
Col_0_B7_S.chr4.10k.CG.4R.50bp.1[is.na(Col_0_B7_S.chr4.10k.CG.4R.50bp.1)] <- 0
Col_0_C10_4_S.chr4.10k.CG.4R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_C10_4_S.chr4.10k.CG.4R.50bp.1.txt", header=FALSE)
Col_0_C10_4_S.chr4.10k.CG.4R.50bp.1[is.na(Col_0_C10_4_S.chr4.10k.CG.4R.50bp.1)] <- 0
Col_0_D89_B7_C10_4_S.chr4.10k.CG.4R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_B7_C10_4_S.chr4.10k.CG.4R.50bp.1.txt", header=FALSE)
Col_0_D89_B7_C10_4_S.chr4.10k.CG.4R.50bp.1 [is.na(Col_0_D89_B7_C10_4_S.chr4.10k.CG.4R.50bp.1 )] <- 0
Col_0_D89_S.chr4.10k.CG.4R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_S.chr4.10k.CG.4R.50bp.1.txt", header=FALSE)
Col_0_D89_S.chr4.10k.CG.4R.50bp.1[is.na(Col_0_D89_S.chr4.10k.CG.4R.50bp.1)] <- 0
D89_B7_S.chr4.10k.CG.4R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_B7_S.chr4.10k.CG.4R.50bp.1.txt", header=FALSE)
D89_B7_S.chr4.10k.CG.4R.50bp.1[is.na(D89_B7_S.chr4.10k.CG.4R.50bp.1)] <- 0
D89_C10_4_S.chr4.10k.CG.4R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_C10_4_S.chr4.10k.CG.4R.50bp.1.txt", header=FALSE)
D89_C10_4_S.chr4.10k.CG.4R.50bp.1[is.na(D89_C10_4_S.chr4.10k.CG.4R.50bp.1)] <- 0
bpPerBin <- 50
xLbl <- paste0('bins of 50');
yLbl <- 'Average %mCG Chr4 4R'

ggplot(D89_C10_4_S.chr4.10k.CG.4R.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "C10_4_S" = "#e8d336")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.4R.line.CHR4R.D89_C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_C10_4_S.chr4.10k.CG.4R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "C10_4_S" = "#e8d336")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.4R.line.CHR4.Col.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_B7_S.chr4.10k.CG.4R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "B7_S" = "#a88c60")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.4R.line.CHR4.Col.B7.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_D89_S.chr4.10k.CG.4R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.4R.line.CHR4.D89.Col.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(B7_C10_4_S.chr4.10k.CG.4R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("B7_S" = "#a88c60", "C10_4_S" = "#F0E27B")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.4R.line.CHR4.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(D89_B7_S.chr4.10k.CG.4R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "B7_S" = "#a88c60")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.4R.line.CHR4.D89.B7.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_D89_B7_C10_4_S.chr4.10k.CG.4R.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500","B7_S" = "#a88c60", "C10_4_S" = "#F0E27B" )) +
  geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.4R.line.CHR4.Col.D89.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

B7_C10_4_S.chr5.10k.CG.5R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/B7_C10_4_S.chr5.10k.CG.5R.50bp.1.txt", header=FALSE)
B7_C10_4_S.chr5.10k.CG.5R.50bp.1[is.na(B7_C10_4_S.chr5.10k.CG.5R.50bp.1)] <- 0
Col_0_B7_S.chr5.10k.CG.5R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_B7_S.chr5.10k.CG.5R.50bp.1.txt", header=FALSE)
Col_0_B7_S.chr5.10k.CG.5R.50bp.1[is.na(Col_0_B7_S.chr5.10k.CG.5R.50bp.1)] <- 0
Col_0_C10_4_S.chr5.10k.CG.5R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_C10_4_S.chr5.10k.CG.5R.50bp.1.txt", header=FALSE)
Col_0_C10_4_S.chr5.10k.CG.5R.50bp.1[is.na(Col_0_C10_4_S.chr5.10k.CG.5R.50bp.1)] <- 0
Col_0_D89_B7_C10_4_S.chr5.10k.CG.5R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_B7_C10_4_S.chr5.10k.CG.5R.50bp.1.txt", header=FALSE)
Col_0_D89_B7_C10_4_S.chr5.10k.CG.5R.50bp.1[is.na(Col_0_D89_B7_C10_4_S.chr5.10k.CG.5R.50bp.1)] <- 0
Col_0_D89_S.chr5.10k.CG.5R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/Col_0_D89_S.chr5.10k.CG.5R.50bp.1.txt", header=FALSE)
Col_0_D89_S.chr5.10k.CG.5R.50bp.1[is.na(Col_0_D89_S.chr5.10k.CG.5R.50bp.1)] <- 0
D89_B7_S.chr5.10k.CG.5R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_B7_S.chr5.10k.CG.5R.50bp.1.txt", header=FALSE)
D89_B7_S.chr5.10k.CG.5R.50bp.1[is.na(D89_B7_S.chr5.10k.CG.5R.50bp.1)] <- 0
D89_C10_4_S.chr5.10k.CG.5R.50bp.1 <- read.delim("~/Desktop/Claudia.WGBS/updated_plots/D89_C10_4_S.chr5.10k.CG.5R.50bp.1.txt", header=FALSE)
D89_C10_4_S.chr5.10k.CG.5R.50bp.1[is.na(D89_C10_4_S.chr5.10k.CG.5R.50bp.1)] <- 0

bpPerBin <- 50
xLbl <- paste0('bins of 50');
yLbl <- 'Average %mCG Chr5 5R'

ggplot(D89_C10_4_S.chr5.10k.CG.5R.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "C10_4_S" = "#e8d336")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.5R.line.CHR5R.D89_C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_C10_4_S.chr5.10k.CG.5R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "C10_4_S" = "#e8d336")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.5R.line.CHR5.Col.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_B7_S.chr5.10k.CG.5R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "B7_S" = "#a88c60")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.5R.line.CHR5.Col.B7.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_D89_S.chr5.10k.CG.5R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.5R.line.CHR5.D89.Col.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(B7_C10_4_S.chr5.10k.CG.5R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("B7_S" = "#a88c60", "C10_4_S" = "#F0E27B")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.5R.line.CHR5.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(D89_B7_S.chr5.10k.CG.5R.50bp.1, aes(V2, V3, colour = V4 )) +  xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("D89_S" = "#F28500", "B7_S" = "#a88c60")) + geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.5R.line.CHR5.D89.B7.S.png", plot = last_plot(), device = "png", dpi = 300 )

ggplot(Col_0_D89_B7_C10_4_S.chr5.10k.CG.5R.50bp.1, aes(V2, V3, colour = V4 )) + xlab(xLbl) + ylab(yLbl) + ylim(0,100) +
  scale_color_manual(values = c("Col_0_S" = "#267326", "D89_S" = "#F28500","B7_S" = "#a88c60", "C10_4_S" = "#F0E27B" )) +
  geom_line(alpha =3, size=1) +
  theme_classic() + scale_x_reverse(n.breaks = 4, labels= c('60', '40', '20', '0')) +
  ggsave("CG.5R.line.CHR5.Col.D89.B7.C10-4.S.png", plot = last_plot(), device = "png", dpi = 300 )

