read.table(file="merged_results.txt",header=FALSE,fill=TRUE,sep=" ")->M

library("ape")
tiff("Plot_Gallus_A.tif", width = 12, height = 6, units = 'in', res = 500)
par(mfrow=c(1,3))
tree.owls <- read.tree("Tree1.txt")
plot(tree.owls,edge.color="red",edge.width=5,label.offset=0.5,main="Topology 1",cex=1)
tree.owls <- read.tree("Tree2.txt")
plot(tree.owls,edge.color="blue",edge.width=5,label.offset=0.5,main="Topology 2",cex=1)
tree.owls <- read.tree("Tree3.txt")
plot(tree.owls,edge.color="black",edge.width=5,label.offset=0.5,main="Topology 3",cex=1)
dev.off()


tiff("Plot_Gallus_B.tif", width = 12, height = 4, units = 'in', res = 500)
par(mfrow=c(1,3))
species<-"Coturnix_japonica"
plot(M$V8[M$V1==species],-log(M$V6[M$V1==species]),col=ifelse(M$V4[M$V1==species]==1,"red",ifelse(M$V4[M$V1==species]==2,"blue","black")),pch=ifelse(M$V6[M$V1==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,60),ylim=c(0,10),cex.lab=1.5, cex.axis=1.75)
abline(v=1,col="blue")
species<-"Meleagris_gallopavo"
plot(M$V8[M$V1==species],-log(M$V6[M$V1==species]),col=ifelse(M$V4[M$V1==species]==1,"red",ifelse(M$V4[M$V1==species]==2,"blue","black")),pch=ifelse(M$V6[M$V1==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,60),ylim=c(0,10),cex.lab=1.5, cex.axis=1.75)
abline(v=1,col="blue")
species<-"Syrmaticus_mikado"
plot(M$V8[M$V1==species],-log(M$V6[M$V1==species]),col=ifelse(M$V4[M$V1==species]==1,"red",ifelse(M$V4[M$V1==species]==2,"blue","black")),pch=ifelse(M$V6[M$V1==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,60),ylim=c(0,10),cex.lab=1.5, cex.axis=1.75)
abline(v=1,col="blue")
dev.off()

tiff("Plot_Gallus_C.tif", width = 12, height = 4, units = 'in', res = 500)
par(mfrow=c(1,3))
species<-"Gallus_gallus"
plot(M$V8[M$V1==species],-log(M$V6[M$V1==species]),col=ifelse(M$V4[M$V1==species]==1,"red",ifelse(M$V4[M$V1==species]==2,"blue","black")),pch=ifelse(M$V6[M$V1==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,60),ylim=c(0,10),cex.lab=1.5, cex.axis=1.75)
abline(v=1,col="blue")
species<-"Numida_meleagris"
plot(M$V8[M$V1==species],-log(M$V6[M$V1==species]),col=ifelse(M$V4[M$V1==species]==1,"red",ifelse(M$V4[M$V1==species]==2,"blue","black")),pch=ifelse(M$V6[M$V1==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,60),ylim=c(0,10),cex.lab=1.5, cex.axis=1.75)
abline(v=1,col="blue")
species<-"Tympanuchus_cupido_pinnatus"
plot(M$V8[M$V1==species],-log(M$V6[M$V1==species]),col=ifelse(M$V4[M$V1==species]==1,"red",ifelse(M$V4[M$V1==species]==2,"blue","black")),pch=ifelse(M$V6[M$V1==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,60),ylim=c(0,10),cex.lab=1.5, cex.axis=1.75)
abline(v=1,col="blue")
dev.off()
