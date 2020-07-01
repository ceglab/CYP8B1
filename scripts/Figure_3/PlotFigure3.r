library("ape")
#make panel-A showing all the tree topologies that appear in Panels B and C.
tiff("Figure_3A.tif", width = 12, height = 6, units = 'in', res = 500)
par(mfrow=c(2,3))
#well supported topologies
tree.owls <- read.tree("Tree1.txt")
plot(tree.owls,edge.color="red",edge.width=5,label.offset=0.5,main="Topology 1",cex=1)
tree.owls <- read.tree("Tree2.txt")
plot(tree.owls,edge.color="blue",edge.width=5,label.offset=0.5,main="Topology 2",cex=1)
tree.owls <- read.tree("Tree3.txt")
plot(tree.owls,edge.color="green",edge.width=5,label.offset=0.5,main="Topology 3",cex=1)
#Poorly supported topologies
tree.owls <- read.tree("Tree4.txt")
plot(tree.owls,edge.color="brown",edge.width=5,label.offset=0.5,main="Topology 4",cex=1)
tree.owls <- read.tree("Tree5.txt")
plot(tree.owls,edge.color="darkmagenta",edge.width=5,label.offset=0.5,main="Topology 5",cex=1)
tree.owls <- read.tree("Tree6.txt")
plot(tree.owls,edge.color="black",edge.width=5,label.offset=0.5,main="Topology 6",cex=1)
dev.off()

#Distribution of K and p-values for different tree topologies, color is tree topology, size is number of background species, shape refers to significance
#species under relaxed selection
xlimval<-20
scalingfactor<-1.75
read.table(file="afrotheria_merged_relax_results.txt",header=TRUE,fill=TRUE,sep=" ",as.is=TRUE)->M
tiff("Figure_3B.tif", width = 12, height = 4, units = 'in', res = 500)
par(mfrow=c(1,3))
species<-"Chrysochloris_asiatica"
plot(M$K_value1[M$Foreground==species],-log(M$P_value[M$Foreground==species]),col=ifelse(M$Tree_topology[M$Foreground==species]==1,"red",ifelse(M$Tree_topology[M$Foreground==species]==2,"blue",ifelse(M$Tree_topology[M$Foreground==species]==3,"green",ifelse(M$Tree_topology[M$Foreground==species]==4,"brown",ifelse(M$Tree_topology[M$Foreground==species]==5,"darkmagenta","black"))))),pch=ifelse(M$P_value[M$Foreground==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,xlimval),ylim=c(0,10),cex.lab=1.5, cex.axis=1.5,cex=(M$Background_count*scalingfactor)/5)
abline(v=1,col="blue")
species<-"Loxodonta_africana"
plot(M$K_value1[M$Foreground==species],-log(M$P_value[M$Foreground==species]),col=ifelse(M$Tree_topology[M$Foreground==species]==1,"red",ifelse(M$Tree_topology[M$Foreground==species]==2,"blue",ifelse(M$Tree_topology[M$Foreground==species]==3,"green",ifelse(M$Tree_topology[M$Foreground==species]==4,"brown",ifelse(M$Tree_topology[M$Foreground==species]==5,"darkmagenta","black"))))),pch=ifelse(M$P_value[M$Foreground==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,xlimval),ylim=c(0,10),cex.lab=1.5, cex.axis=1.5,cex=(M$Background_count*scalingfactor)/5)
abline(v=1,col="blue")
species<-"Trichechus_manatus_latirostris"
plot(M$K_value1[M$Foreground==species],-log(M$P_value[M$Foreground==species]),col=ifelse(M$Tree_topology[M$Foreground==species]==1,"red",ifelse(M$Tree_topology[M$Foreground==species]==2,"blue",ifelse(M$Tree_topology[M$Foreground==species]==3,"green",ifelse(M$Tree_topology[M$Foreground==species]==4,"brown",ifelse(M$Tree_topology[M$Foreground==species]==5,"darkmagenta","black"))))),pch=ifelse(M$P_value[M$Foreground==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,xlimval),ylim=c(0,10),cex.lab=1.5, cex.axis=1.5,cex=(M$Background_count*scalingfactor)/5)
abline(v=1,col="blue")
dev.off()

#species under intensified selection
tiff("Figure_3C.tif", width = 12, height = 4, units = 'in', res = 500)
par(mfrow=c(1,4))
species<-"Echinops_telfairi"
plot(M$K_value1[M$Foreground==species],-log(M$P_value[M$Foreground==species]),col=ifelse(M$Tree_topology[M$Foreground==species]==1,"red",ifelse(M$Tree_topology[M$Foreground==species]==2,"blue",ifelse(M$Tree_topology[M$Foreground==species]==3,"green",ifelse(M$Tree_topology[M$Foreground==species]==4,"brown",ifelse(M$Tree_topology[M$Foreground==species]==5,"darkmagenta","black"))))),pch=ifelse(M$P_value[M$Foreground==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,xlimval),ylim=c(0,10),cex.lab=1.5, cex.axis=1.5,cex=(M$Background_count*scalingfactor)/5)
abline(v=1,col="blue")
species<-"Elephantulus_edwardii"
plot(M$K_value1[M$Foreground==species],-log(M$P_value[M$Foreground==species]),col=ifelse(M$Tree_topology[M$Foreground==species]==1,"red",ifelse(M$Tree_topology[M$Foreground==species]==2,"blue",ifelse(M$Tree_topology[M$Foreground==species]==3,"green",ifelse(M$Tree_topology[M$Foreground==species]==4,"brown",ifelse(M$Tree_topology[M$Foreground==species]==5,"darkmagenta","black"))))),pch=ifelse(M$P_value[M$Foreground==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,xlimval),ylim=c(0,10),cex.lab=1.5, cex.axis=1.5,cex=(M$Background_count*scalingfactor)/5)
abline(v=1,col="blue")
species<-"Orycteropus_afer_afer"
plot(M$K_value1[M$Foreground==species],-log(M$P_value[M$Foreground==species]),col=ifelse(M$Tree_topology[M$Foreground==species]==1,"red",ifelse(M$Tree_topology[M$Foreground==species]==2,"blue",ifelse(M$Tree_topology[M$Foreground==species]==3,"green",ifelse(M$Tree_topology[M$Foreground==species]==4,"brown",ifelse(M$Tree_topology[M$Foreground==species]==5,"darkmagenta","black"))))),pch=ifelse(M$P_value[M$Foreground==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,xlimval),ylim=c(0,10),cex.lab=1.5, cex.axis=1.5,cex=(M$Background_count*scalingfactor)/5)
abline(v=1,col="blue")
species<-"Procavia_capensis"
plot(M$K_value1[M$Foreground==species],-log(M$P_value[M$Foreground==species]),col=ifelse(M$Tree_topology[M$Foreground==species]==1,"red",ifelse(M$Tree_topology[M$Foreground==species]==2,"blue",ifelse(M$Tree_topology[M$Foreground==species]==3,"green",ifelse(M$Tree_topology[M$Foreground==species]==4,"brown",ifelse(M$Tree_topology[M$Foreground==species]==5,"darkmagenta","black"))))),pch=ifelse(M$P_value[M$Foreground==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,xlimval),ylim=c(0,10),cex.lab=1.5, cex.axis=1.5,cex=(M$Background_count*scalingfactor)/5)
abline(v=1,col="blue")
dev.off()
