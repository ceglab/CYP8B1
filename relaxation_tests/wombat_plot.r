library("ape")
#make panel-A showing all the tree topologies that appear in Panels B and C.
tiff("Wombat_Figure_Extra_1.tif", width = 12, height = 6, units = 'in', res = 500)
par(mfrow=c(1,3))
#well supported topologies
tree.owls <- read.tree("Tree1.txt")
plot(tree.owls,edge.color="red",edge.width=5,label.offset=0.5,main="Topology 1",cex=1)
tree.owls <- read.tree("Tree2.txt")
plot(tree.owls,edge.color="blue",edge.width=5,label.offset=0.5,main="Topology 2",cex=1)
tree.owls <- read.tree("Tree3.txt")
plot(tree.owls,edge.color="green",edge.width=5,label.offset=0.5,main="Topology 3",cex=1)
dev.off()

#Distribution of K and p-values for different tree topologies, color is tree topology, size is number of background species, shape refers to significance
#species under relaxed selection
xlimval<-20
scalingfactor<-1.75
read.table(file="wombat_merged_relax_results.txt",header=TRUE,fill=TRUE,sep=" ",as.is=TRUE)->M
tiff("Wombat_Figure_Extra_2.tif", width = 12, height = 4, units = 'in', res = 500)
par(mfrow=c(1,3))
species<-"Dasypus_novemcinctus"
plot(M$K_value1[M$Foreground==species],-log(M$P_value[M$Foreground==species]),col=ifelse(M$Tree_topology[M$Foreground==species]==1,"red",ifelse(M$Tree_topology[M$Foreground==species]==2,"blue",ifelse(M$Tree_topology[M$Foreground==species]==3,"green",ifelse(M$Tree_topology[M$Foreground==species]==4,"brown",ifelse(M$Tree_topology[M$Foreground==species]==5,"darkmagenta","black"))))),pch=ifelse(M$P_value[M$Foreground==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,xlimval),ylim=c(0,10),cex.lab=1.5, cex.axis=1.5,cex=(M$Background_count*scalingfactor)/5)
abline(v=1,col="blue")
species<-"Sorex_araneus"
plot(M$K_value1[M$Foreground==species],-log(M$P_value[M$Foreground==species]),col=ifelse(M$Tree_topology[M$Foreground==species]==1,"red",ifelse(M$Tree_topology[M$Foreground==species]==2,"blue",ifelse(M$Tree_topology[M$Foreground==species]==3,"green",ifelse(M$Tree_topology[M$Foreground==species]==4,"brown",ifelse(M$Tree_topology[M$Foreground==species]==5,"darkmagenta","black"))))),pch=ifelse(M$P_value[M$Foreground==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,xlimval),ylim=c(0,10),cex.lab=1.5, cex.axis=1.5,cex=(M$Background_count*scalingfactor)/5)
abline(v=1,col="blue")
species<-"Vombatus_ursinus"
plot(M$K_value1[M$Foreground==species],-log(M$P_value[M$Foreground==species]),col=ifelse(M$Tree_topology[M$Foreground==species]==1,"red",ifelse(M$Tree_topology[M$Foreground==species]==2,"blue",ifelse(M$Tree_topology[M$Foreground==species]==3,"green",ifelse(M$Tree_topology[M$Foreground==species]==4,"brown",ifelse(M$Tree_topology[M$Foreground==species]==5,"darkmagenta","black"))))),pch=ifelse(M$P_value[M$Foreground==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,xlimval),ylim=c(0,10),cex.lab=1.5, cex.axis=1.5,cex=(M$Background_count*scalingfactor)/5)
abline(v=1,col="blue")
dev.off()

#species under intensified selection
tiff("Wombat_Figure_Extra_3.tif", width = 12, height = 4, units = 'in', res = 500)
par(mfrow=c(1,3))
species<-"Ornithorhynchus_anatinus"
plot(M$K_value1[M$Foreground==species],-log(M$P_value[M$Foreground==species]),col=ifelse(M$Tree_topology[M$Foreground==species]==1,"red",ifelse(M$Tree_topology[M$Foreground==species]==2,"blue",ifelse(M$Tree_topology[M$Foreground==species]==3,"green",ifelse(M$Tree_topology[M$Foreground==species]==4,"brown",ifelse(M$Tree_topology[M$Foreground==species]==5,"darkmagenta","black"))))),pch=ifelse(M$P_value[M$Foreground==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,xlimval),ylim=c(0,10),cex.lab=1.5, cex.axis=1.5,cex=(M$Background_count*scalingfactor)/5)
abline(v=1,col="blue")
species<-"Phascolarctos_cinereus"
plot(M$K_value1[M$Foreground==species],-log(M$P_value[M$Foreground==species]),col=ifelse(M$Tree_topology[M$Foreground==species]==1,"red",ifelse(M$Tree_topology[M$Foreground==species]==2,"blue",ifelse(M$Tree_topology[M$Foreground==species]==3,"green",ifelse(M$Tree_topology[M$Foreground==species]==4,"brown",ifelse(M$Tree_topology[M$Foreground==species]==5,"darkmagenta","black"))))),pch=ifelse(M$P_value[M$Foreground==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,xlimval),ylim=c(0,10),cex.lab=1.5, cex.axis=1.5,cex=(M$Background_count*scalingfactor)/5)
abline(v=1,col="blue")
species<-"Erinaceus_europaeus"
plot(M$K_value1[M$Foreground==species],-log(M$P_value[M$Foreground==species]),col=ifelse(M$Tree_topology[M$Foreground==species]==1,"red",ifelse(M$Tree_topology[M$Foreground==species]==2,"blue",ifelse(M$Tree_topology[M$Foreground==species]==3,"green",ifelse(M$Tree_topology[M$Foreground==species]==4,"brown",ifelse(M$Tree_topology[M$Foreground==species]==5,"darkmagenta","black"))))),pch=ifelse(M$P_value[M$Foreground==species]<0.05,15,1),xlab="K value",ylab="-log(p-value)",main=species,xlim=c(0,xlimval),ylim=c(0,10),cex.lab=1.5, cex.axis=1.5,cex=(M$Background_count*scalingfactor)/5)
abline(v=1,col="blue")
dev.off()

