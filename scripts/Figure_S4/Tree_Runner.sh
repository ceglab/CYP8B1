#!/bin/bash

#tree running wrapper used for chicken

treecount=$1
taxcount=`grep ">" PRANK.aln|wc -l`
for tree in `cat 10per_more.txt|head -n $treecount|tail -n 1`
do
for focal in `cat taxlist.txt`
do
loopend=`echo $taxcount|awk '{print $1-2}'`
backtaxlist=`grep -v "$focal" taxlist.txt|tr "\n" " "`
for count in $(seq 1 $loopend);
do
echo $count
combcount=1
for back in `getCombs.pl $count $backtaxlist|tr " " "-"`
do
echo $tree|sed "s/$focal/$focal{foreg}/g" > temp.tree
#for each set of background species create a tree file
for backs in `echo $back|tr "-" "\n"`
do
sed -i "s/$backs/$backs{back}/g" temp.tree
done
cat PRANK.aln > tree_"$treecount".focal_"$focal".comb_$count.comback_"$combcount"_raxml_tree_labelled
cat temp.tree >> tree_"$treecount".focal_"$focal".comb_$count.comback_"$combcount"_raxml_tree_labelled
workdir=`pwd`
echo -e "14\n9\n1\n"$workdir"/tree_"$treecount".focal_"$focal".comb_$count.comback_"$combcount"_raxml_tree_labelled\nY\n3\n2\n1" > relax"$treecount".config
HYPHYMP < relax"$treecount".config > "$workdir"/results/results.tree_"$treecount".focal_"$focal".comb_$count.comback_"$combcount"_.txt
combcount=`echo $combcount|awk '{print $1+1}'`
done
done
done
treecount=`echo $treecount|awk '{print $1+1}'`
done
