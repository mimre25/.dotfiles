export MAMBA_EXE='/home/martin/.local/bin/micromamba';

# export XDG_CONFIG_HOME=/home/martin/
# alias nvim=/home/martin/Tools/nvim-linux64/bin/nvim
alias vim=nvim
alias vim!=/usr/bin/vim
. "$HOME/.cargo/env"
export DENO_INSTALL="/home/martin/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"


_lazy_load_npm() {
    unalias npm;
    load_nvm;
    unfunction _lazy_load_npm;
}

alias npm="_lazy_load_npm && npm";
