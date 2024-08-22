export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

#export HISTFILE="$XDG_STATE_HOME/bash/history"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export GHCUP_USE_XDG_DIRS=true
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export RECOLL_CONFDIR="$XDG_CONFIG_HOME/recoll"
#export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export ZSH="$XDG_DATA_HOME/oh-my-zsh"
export RANDFILE="$XDG_CACHE_HOME/.rnd"
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.vim" | so $MYVIMRC'
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
export W3M_DIR="$XDG_DATA_HOME/w3m"
export NUGET_PACKAGES="$XDG_CACHE_HOME/NuGetPackages"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export TF_CPP_MAX_VLOG_LEVEL=-1

export PATH="$PATH:/home/mbradley/.local/share/JetBrains/Toolbox/scripts:/home/mbradley/scripts:/home/mbradley/.local/bin:/home/mbradley/.local/share/cargo/bin/"
