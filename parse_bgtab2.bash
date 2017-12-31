#!/bin/bash

outfile_name="parsed_$1"
# Extract columns for BioGRID ID A, BioGRID ID B, Official Symbol A, Official Symbol B, Experimental System Name 
cut -f4,5,8,9,12 $1 > tmp.txt 
# Extract rows for given methods
grep 'Two-hybrid' tmp.txt > tmp2.txt
# Extract columns for IDs only
cut -f1,2 tmp2.txt > tmp3.txt
# Remove duplicate rows
awk '!seen[$0]++' tmp3.txt > tmp4.txt 
# Remove rows with equal IDs (self-loops)
awk '$1!=$2 {print $0}' tmp4.txt > tmp5.txt
# Replace tabs with spaces
sed 's/	/ /g' tmp5.txt > tmp6.txt
# Sort the columns
sort -nk1 tmp6.txt > tmp7.txt
# Move output file to ~/Desktop/LEMON-master/LEMON
mv tmp7.txt ../LEMON-master/LEMON/$outfile_name
rm tmp*.txt
