#Set the variable i to the value of species set being analysed.

#Add a header line to explain the columns. Will overwrite existing files
echo "Foreground Background Rest Tree_topology Background_count P_value Result_file K_value1 K_value2 Background_count_dup" >../"$i"_merged_results.txt

for j in `ls -1 *.txt`
do
pval=`grep "^Like" $j|awk '{print $6}'|sed 's/\*\*\.//g'`
kval1=`grep "Relaxation/intensification" $j|awk '{print $6}'|head -1`
kval2=`grep "Relaxation/intensification" $j|awk '{print $6}'|tail -1`
test=`grep "_test_ set:" $j|awk '{print $9}'|sed 's/\`//g'`
ref=`grep "_reference_ set:" $j|sed 's/\, /\,/g'|awk '{print $9}'|sed 's/\`//g'`
refcount=`echo $ref|tr "," "\n"|wc -l`
other=`grep "unclassified (nuisance) set:" $j|sed 's/\, /\,/g'|awk '{print $10}'|sed 's/\`//g'`
tree=`echo $j|cut -f 2 -d '.'|sed 's/tree_//g'`
comb=`echo $j|cut -f 4 -d '.'|sed 's/comb_//g'`
echo $test $ref $other $tree $comb $pval $i $kval1 $kval2 $refcount|awk 'NF==10{print $0}' >>../"$i"_merged_results.txt
done
