tiff(file="Figure_4.tiff", width=6500, height=2500)
dir(".", pattern = "2169150.position", full.names = TRUE, ignore.case = TRUE)->Files
par(mgp=c(20,0,0),mar=c(25,25,6,2))
for(i in Files){
read.table(file=i,header=TRUE,sep="\t")->MB
Bar=transform(MB, A = MB$A/MB$Ref, C=MB$C/MB$Ref, G=MB$G/MB$Ref,T=MB$T/MB$Ref)
barplot(as.matrix(t(Bar[,3:6])),col=c("red","blue","yellow","green"),xlab = "Individual id", ylab = "Fraction of reads", names.arg=Bar$SRR_ID,las=2,main="",space=0.35,cex.names = 2.5, font = 2,border="black",cex.lab=4.5, font.lab=4,cex=2.5)
legend("topright", legend=c("A","C","G","T"), fill=c("red","blue","yellow","green"), cex = 3.5)
}
dev.off()   
