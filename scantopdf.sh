#!/bin/bash
# Works around ImageMagick's stupid "NOMNOMNOM MEMORY" problem.

if [ -e "*.jpg" ]
then
    echo WARNING: This directory contains existing JPEGs. Quitting.
    exit
fi
if [ -e "output.pdf" ]
then
    echo WARNING: Output.pdf already exists. Quitting.
    exit
fi
for i in `ls *.png`
do
    echo Converting and resizing $i...
    convert -resize 50% $i `echo $i | cut -d"." -f 1`.jpg
done
echo Conversion complete. Creating PDF at 300DPI...
convert -density 300 *.jpg unoptimised.pdf
echo PDF created. Optimising PDF...
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf unoptimised.pdf
echo PDF optimised. Tidying temporary files...
rm *.jpg unoptimised.pdf
echo Finished. Final PDF file size: `ls -lh output.pdf | cut -d" " -f 5`
