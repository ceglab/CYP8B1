GITDUMP="/home/ceglab"

#Obtain all the manually curated ORF's of the CYP8B1 gene from NCBI and Ensembl.
for i in `ls -1 $GITDUMP/CYP8B1/ORFs/*.fa`
do
echo -ne "$i\t"
#this step will remove any dos special characters
dos2unix $i
perl $GITDUMP/CYP8B1/scripts/ORFvalidator.pl $i
done

#Calculate Mean GC content for each ORF. Use a window size of 100 with a step size of 10.
for i in `ls -1 $GITDUMP/CYP8B1/ORFs/*.fa`; do j=`echo $i|cut -f 7 -d '/'`; cp $i .; perl $GITDUMP/CYP8B1/scripts/gc_content.pl --fasta $j --window 100 --step 10; done|grep "the mean GC content"|awk '{print $8,$10}' > ../Mean_GC.txt

#Perform QC on the alignments generated using Guidance and generate a QC report
for i in `ls -1 $GITDUMP/CYP8B1/ORFs/*.fa`
do
j=`echo $i|cut -f 6 -d '/'|cut -f 1 -d '.'`
k=`echo $i|cut -f 6 -d '/'`
mkdir $j
cd $j
cp $i .
$GITDUMP/CYP8B1/scripts/Alignment_QC.sh $k
cp "$k"_MAFFT.aln $GITDUMP/CYP8B1/MSAs
cp "$k"_PRANK.aln $GITDUMP/CYP8B1/MSAs
cp "$k"_MUSCLE.aln $GITDUMP/CYP8B1/MSAs
cp "$k"_CLUSTALW.aln $GITDUMP/CYP8B1/MSAs
cd ..
done

