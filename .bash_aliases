alias sp="ls | grep pdf"
alias xo="xdg-open"
alias make="/usr/bin/make -j8"


function cd_history { BACK=`pwd`; cd $1; }
alias cd=cd_history
