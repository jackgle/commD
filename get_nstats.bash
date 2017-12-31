#!/bin/bash

filename="$1"
outfile="out_n_twoh_bohs.txt"
rm $outfile
while read line
do
	echo $line>tmp.txt
	echo -n $line>>$outfile
	echo -n " ">>$outfile
	(java -jar localCommunityFinderApp.jar ./bohs_twohcut_hashed_tab.txt $line 10 100 true tmp2.txt) > tmp.txt;
	awk '$1=="conductance:" {printf "%.12f",$2}' tmp.txt >> $outfile
	echo -n " ">>$outfile
	while read line
	do
		echo -n "$line " >> $outfile
	done < tmp2.txt
	printf '\n' >> $outfile

done < $filename
rm tmp*