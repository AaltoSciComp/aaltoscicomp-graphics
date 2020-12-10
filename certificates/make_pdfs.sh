#!/bin/bash

# get num of lines of file
N=$(cat users.csv|wc -l)
# get headers to replace
line=$(sed "1q;d" users.csv)
h1=$(echo $line|cut -d, -f1)
h2=$(echo $line|cut -d, -f2)
h3=$(echo $line|cut -d, -f3)

echo $h1
echo $h2
echo $h3
OS=$(uname -o)
if [ $OS == "Msys" ]; then
	# we are on windows
	alias inkscape="/c/Program\ Files/Inkscape/inkscape.exe"
fi

for n in $(seq 2 $N); do
	# get strings to replace
	templine=$(sed "${n}q;d" users.csv)

	d1=$(echo $templine|cut -d, -f1)
	d2=$(echo $templine|cut -d, -f2)
	d3=$(echo $templine|cut -d, -f3)
	

	# make output file
	mkdir -p outputsvg
	mkdir -p outputpdf
	outfile=$(echo $d1"_"$d3|sed 's/ /_/g' |sed 's/(//g'|sed 's/)//g');
	echo "cat certificate.svg | sed 's/$h1/$d1/'| sed 's/$h2/$d2/' | sed 's/$h3/d3/' > "outputsvg/"$outfile".svg"" 
	cat certificate.svg | sed "s/$h1/$d1/"| sed "s/$h2/$d2/" | sed "s/$h3/$d3/" > "outputsvg/"$outfile".svg" 
	inkscape --without-gui --export-pdf="outputpdf/"$outfile".pdf" "outputsvg/"$outfile".svg" 
done
