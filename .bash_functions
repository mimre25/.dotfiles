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
