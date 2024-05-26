source /home/martin/antigen.zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/martin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=1000000

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf command-not-found colored-man-pages timer conda-zsh-completion)
TIMER_FORMAT='[%d]';
TIMER_PRECISION=2
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

PATH=$PATH:/snap/bin

export VISUAL=vim;
export EDITOR="$VISUAL";



PATH=$PATH:/usr/share/applications
PATH=$PATH:/var/lib/snapd/desktop/applications
source /etc/profile.d/apps-bin-path.sh
PATH=$PATH:/home/martin/.local/bin


load_nvm() {
  unalias nvm;
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  unfunction load_nvm;
}
alias nvm="load_nvm && nvm";



if [ -f ~/.bash/.bashrc ]; then
    . ~/.bash/.bashrc
fi

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export TOX_DISCOVER="/home/martin/micromamba/envs/py37/bin /home/martin/micromamba/envs/py38/bin /home/martin/micromamba/envs/py39/bin /home/martin/micromamba/envs/py310/bin /home/martin/micromamba/envs/py311/bin /home/martin/micromamba/envs/py312/bin"


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/martin/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/martin/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

antigen bundle esc/conda-zsh-completion
antigen apply



export XDG_CONFIG_HOME=/home/martin;
alias vim=nvim;
alias vim!=/usr/bin/vim;

export PATH=$PATH:/home/martin/.cargo/bin
export PATH=$PATH:/home/martin/Tools/nvim-linux64/bin
export PATH=$PATH:/home/martin/micromamba/bin

find_in_micromamba_env(){
    micromamba env list | grep "  ${@} " >/dev/null 2>/dev/null
}

post_cd_hook() {
    env_name=$(echo $(basename $(pwd)) | sed 's/\./_/g')

    if find_in_micromamba_env ${env_name}; then
        if [[ -z "${TMUX}" ]]; then
            tmux new-session -A -s ${env_name}
        fi
        micromamba activate ${env_name}
    fi
}

add-zsh-hook chpwd post_cd_hook;
if [ -f ~/.env ]; then
    . ~/.env
fi


if [[ -n "${TMUX}" ]]; then
    # Prevent CTRL+D to send EOF to exit terminal when in tmux
    setopt IGNORE_EOF;
fi

ctrl_d() {
    if [[ -n "${TMUX}" ]]; then
        num_panes=$(tmux list-panes | wc -l);
        num_windows=$(tmux list-windows | wc -l);
        if [[ $num_panes -eq 1 ]] && [[ $num_windows -eq 1 ]]; then
            tmux detach;
        else
            exit;
        fi
    else
        exit;
    fi
}
zle -N ctrl_d; # register as "widget"
bindkey '^D' ctrl_d;


## automatically activate micromamba envs when starting a new terminal
# for example when opening a new tmux pane or window
post_cd_hook;


flip() {
    command=$(history | tail -n1 | cut -d ' ' -f '6-');
    num_args=$(($(echo ${command} | tr -c -d ' ' | wc -m) + 1));
    base_command=$(echo ${command} | cut -d ' ' -f -$(( num_args - 2)));
    last_two_args=$(echo ${command} | cut -d ' ' -f $(( num_args - 1))-);
    last_arg=$(echo ${last_two_args} | awk '{print $2}');
    penultimate_arg=$(echo ${last_two_args} | awk '{print $1}');
    flipped_command=($(echo "${base_command} ${last_arg} ${penultimate_arg}"));
    echo ${flipped_command};
    "${flipped_command[@]}";
}


_notes() {
    if [[ -z "${TMUX}" ]]; then
        tmux new-session -A -s notes -c ~ nvim notes.txt;
    else
        tmux switch-client -t notes;
        if [[ $? -eq 1 ]]; then
            tmux new-session -d -s notes -c ~ nvim notes.txt;
            tmux switch-client -t notes;
        fi
    fi

}
alias notes=_notes;


## from https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
alias path='echo -e ${PATH//:/\\n}'
## from https://www.digitalocean.com/community/questions/what-are-your-favorite-bash-aliases
alias sudo='sudo '



alias gpsuf='git push --set-upstream fork $(git_current_branch)'
alias cat='bat'
