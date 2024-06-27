#!/bin/zsh

source ~/scripts/env_vars.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zstyle ':omz:update' mode disabled  # OMZ is installed with the -git AUR package, so this is unnecessary
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
plugins=(git python)
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ "$TERM" == "linux" ]] ; then
  p10k="$ZDOTDIR/.p10k-tty.zsh"
else
  p10k="$ZDOTDIR/.p10k.zsh"
fi
[[ ! -f "$p10k" ]] || source "$p10k"

MATRIX="neo-matrix -a -D -f 60 -s -m $(date +%y/%m/%d)"
FANCYCLEAR="clear && echo && fastfetch && echo"

alias clera="clear"
alias cealr="clear"
alias cearl="clear"
alias clare="clear"
alias celar="clear"
alias clrae="clear"
alias cclear="clear"
alias caerl="clear"
alias caelr="clear"
alias cleear="clear"
alias dlear="clear"
alias cleat="clear"
alias clewar="clear"
alias c=$FANCYCLEAR
alias m=$MATRIX
alias f="fastfetch"
alias q="exit"
alias e="exit"
alias cm="$FANCYCLEAR && $MATRIX"
alias ls="lsd"
alias grep="rg"
alias fdisk="sudo fdisk"
alias gdisk="sudo gdisk"
alias mount="sudo mount"
alias umount="sudo umount"

alias wifi="nmtui"
alias pacman="sudo pacman"
alias quit="exit"
alias please="sudo"
alias pyhton="python"
alias nordpvn="nordvpn"
alias 1p='eval $(op signin)'
alias reset="source .zshrc"
alias audio="ncpamixer"
alias showpic="kitty +kitten icat"
#alias python="ipython"
alias cleanbranches='git branch -l | rg -v "(^\*|master)" | xargs git branch -d'

LAST_REPO=""
cd() {
  builtin cd "$@"
  git rev-parse 2>/dev/null
  if [ $? -eq 0 ]; then
    if [ "$LAST_REPO" != $(basename $(git rev-parse --show-toplevel)) ]; then
      onefetch
      LAST_REPO=$(basename $(git rev-parse --show-toplevel))
    fi
  fi
}

alias cat='bat --paging=never'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
help() {
  "$@" --help 2>&1 | bat --plain --language=help
}

alias n="nvim"
if [[ "$TERM" == "linux" ]] ; then
  export EDITOR="vim"
else
  export EDITOR="lvim"
fi
alias v="$EDITOR"
alias sv="sudo vim"
#alias sv="sudoedit"
export VISUAL=$EDITOR

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

#autoload -Uz compinit
#compinit

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

