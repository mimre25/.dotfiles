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

export CMAKE_PREFIX_PATH="/usr/bin/qmake"
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}/usr/local/cuda-8.0/extras/CUPTI/lib64:/usr/local/cuda-8.0/lib64/;
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda-8.0;
export CUDA_HOME=/usr/local/cuda-8.0;