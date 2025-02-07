# add ons for .bashrc, to have on all computers

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.




if [ -f ~/.bash/.bash_aliases ]; then
    . ~/.bash/.bash_aliases
fi


# load environment variables
if [ -f ~/.bash/.bash_profile ]; then
    . ~/.bash/.bash_profile
fi


# load bash functions
#if [ -f ~/.bash/.bash_functions ]; then
#    . ~/.bash/.bash_functions
#fi
export PATH=$PATH:~/.bash/functions/;
