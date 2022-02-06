#export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
#export PATH=$PATH:$HOME/.cabal/bin
#export PATH=$PATH:/opt/ghc/7.8.4/bin
#
#export CUDA_HOME=/usr/local/cuda-7.5 
#export LD_LIBRARY_PATH=${CUDA_HOME}/lib64 
# 
#PATH=${CUDA_HOME}/bin:${PATH} 
#export PATH


export HISTTIMEFORMAT="%y-%m-%d %T "
export HISTSIZE=-1
export HISTFILESIZE=-1

# Avoid duplicates
#export HISTCONTROL=ignoredups:erasedups  
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export VISUAL=vim;
export EDITOR="$VISUAL";

export PATH=$PATH:~/.bash/functions/;
