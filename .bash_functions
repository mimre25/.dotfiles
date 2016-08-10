op() {
  for i in `ls | grep pdf`;
  do
    xdg-open ${i};
  done
}