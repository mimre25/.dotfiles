#!/bin/bash
op() {
  for i in *.pdf;
  do
    xdg-open "`echo ${i} | sed 's/ /\\ /g'`";
  done
}

rp() {
  for file in *.pdf;
  do 
    mv "$file" `echo $file | tr '[:upper:] ' '[:lower:]-'`; 
  done
}

compress-pdf() {
  gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$1 $2; 

}

convertToEps() {
  for i in `ls *.$1`
  do
    j=`basename -s $1 ${i}`;
    convert ${i} ${j}eps;
  done
}

pngToEps() {
  for i in `ls`; 
    do 
      j=`basename -s '.png' $i`;
      convert -density 300 $i $j.eps;
  done
}

epsToJpg() {
  i=$(basename -s '.eps' $1);
  convert -density 300 $1 -resize 1024x1024 $i.jpg;
}


svgToEps()
{
  inkscape $1 -E $2 --export-ignore-filters --export-ps-level=3
}

trimImage()
{
  filename=$(basename -- "$1");
  extension="${filename##*.}";
  filename="${filename%.*}";
  convert $1 -trim out.${extension};
  mv out.${extension} $1; 
}


function openWebloc()
{
  # Test to be sure user supplied a parameter; error if not
  if [ $# -eq 0 ]; then
        echo "Please supply the name of a .webloc file to open"
            exit
            fi
  
  # Extract URL from webloc file
  URL=$(xmllint --xpath "string(//string)" "$1")
  
  echo $URL;
  # Open $URL in Firefox
  google-chrome-stable $URL &
}

clearLatex()
{
  rm $1.aux $1.bbl $1.blg $1.out $1.log $1.pdf $1.synctex.gz $1.glsdefs $1.lof $1.lot $1.toc;
}


function csvAverage()
{

    awk -F ',' -v col=$1 '{x+=$col; next} END{print x/NR}' $2;
}

function average()
{
    awk -v col=$1 '{x+=$col; next} END{print x/NR}' $2;
}

