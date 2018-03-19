op() {
  for i in *.pdf;
  do
    xdg-open `echo ${i} | sed 's/ /\\ /g'`;
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

