#!/bin/bash

filename="$1"
outfile="out_lem_paramtest.txt"
rm $outfile
while read -r line
do
	echo $line>tmp.txt
	python LEMONmod.py -f ./bohs_twohcut_hashed_space.txt --sd ./tmp.txt --out $outfile
done < "$filename"
rm tmp*