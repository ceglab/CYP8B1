library(RColorBrewer)
qual_col_pals <- brewer.pal.info[brewer.pal.info$category == 'qual',]
col_vector <- unlist(mapply(brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals)))
tiff("Figure_S2A.tif", width = 22, height = 12, units = 'in', res = 500)
par(mfrow=c(4,4))
for (j in c(1:16)){
Sys.glob(file.path(".", paste(j,"_*.GC_deviation",sep="")))->Files
plot(1, type="n", xlab="", ylab="", xlim=c(0, 1600), ylim=c(-1, 1),main=substring(unlist(strsplit(Files[1],"[.]"))[2], 2))
count<-1
for(i in Files){
read.table(file=i,header=FALSE,sep=" ")->M
points(M$V2,M$V4,type="b",col=col_vector[count],pch=16)
count<-count+1
abline(h=0,col="blue")
}
}
dev.off()

tiff("Figure_S2Btif", width = 22, height = 12, units = 'in', res = 500)
par(mfrow=c(4,4))
for (j in c(1:16)){
Sys.glob(file.path(".", paste(j,"_*.gc_content",sep="")))->Files
plot(1, type="n", xlab="", ylab="", xlim=c(0, 1600), ylim=c(-1, 1),main=substring(unlist(strsplit(Files[1],"[.]"))[2], 2))
count<-1
for(i in Files){
read.table(file=i,header=FALSE,sep=" ")->M
points(M$V2,M$V4,type="b",col=col_vector[count],pch=16)
count<-count+1
abline(h=0,col="blue")
}
}
dev.off()
