#export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
#export PATH=$PATH:$HOME/.cabal/bin
#export PATH=$PATH:/opt/ghc/7.8.4/bin
#
#export CUDA_HOME=/usr/local/cuda-7.5
#export LD_LIBRARY_PATH=${CUDA_HOME}/lib64
#
#PATH=${CUDA_HOME}/bin:${PATH}
#export PATH


#export HISTTIMEFORMAT="%y-%m-%d %T "
#export HISTSIZE=-1
#export HISTFILESIZE=-1

# Avoid duplicates
#export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
#shopt -s histappend

# After each command, append to the history file and reread it
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export VISUAL=vim;
export EDITOR="$VISUAL";

export PATH=$PATH:~/.bash/functions/;

export RABBITMQ_STAGING="64.225.66.122 8080 9988"
export POSTGRES_STAGING="178.62.216.131 5000 5000"
export REDIS_STAGING="134.122.56.109 6579 6579"

export RABBITMQ_PRODUCTION="161.35.158.245 8080 9988"
export POSTGRES_PRODUCTION="64.225.75.3 5000 5000"
export REDIS_PRODUCTION="157.245.67.127 6579 6579"
