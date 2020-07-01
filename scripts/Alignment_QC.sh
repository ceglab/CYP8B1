GITDUMP="/home/ceglab"

for i in 10_Marsupial.fa 11_Paleognathae_with_tortoise.fa 12_Passeriformes.fa 13_Perissodactyla.fa 14_Primate.fa 15_Rodents.fa 16_Telluraves.fa 1_Aequorlitornithes.fa 2_Afrotheria.fa 4_Carnivores.fa 5_Cetacean.fa 6_Chiroptera.fa 7_Columbaves_Strisores_Gruiformes.fa 8_Galliformes.fa 9_Lemur.fa
do
cd $GITDUMP/CYP8B1/BAAT
mkdir $i
cd $i
cp $GITDUMP/CYP8B1/ORFs/"$i" .
taxcount=`grep ">" $i |cut -c 1-7|wc -l`
utaxcount=`grep ">" $i |cut -c 1-7|sort -u|wc -l`

echo -ne "$i\t$taxcount\t$utaxcount\n"

guidance.pl --program GUIDANCE --seqFile "$i" --msaProgram PRANK --seqType codon --outDir "$i".100_PRANK --genCode 1 --bootstraps 100 --proc_num 20
guidance.pl --program GUIDANCE --seqFile "$i" --msaProgram MUSCLE --seqType codon --outDir "$i".100_MUSCLE --genCode 1 --bootstraps 100 --proc_num 20
guidance.pl --program GUIDANCE --seqFile "$i" --msaProgram CLUSTALW --seqType codon --outDir "$i".100_CLUSTALW --genCode 1 --bootstraps 100 --proc_num 20
guidance.pl --program GUIDANCE --seqFile "$i" --msaProgram MAFFT --seqType codon --outDir "$i".100_MAFFT --genCode 1 --bootstraps 100 --proc_num 20

#sort MSA files before comparing
##Use https://github.com/shenwei356/seqkit
seqkit sort "$i".100_PRANK/MSA.PRANK.aln.With_Names >"$i"_PRANK.aln
seqkit sort "$i".100_MUSCLE/MSA.MUSCLE.aln.With_Names >"$i"_MUSCLE.aln
seqkit sort "$i".100_CLUSTALW/MSA.CLUSTALW.aln.With_Names >"$i"_CLUSTALW.aln
seqkit sort "$i".100_MAFFT/MSA.MAFFT.aln.With_Names >"$i"_MAFFT.aln

mumsa -g -s "$i"_PRANK.aln "$i"_MUSCLE.aln "$i"_CLUSTALW.aln "$i"_MAFFT.aln >> "$i".log
done

