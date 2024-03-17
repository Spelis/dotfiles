# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.p10k.zsh

# Download Znap, if it's not there yet.
[[ -r ~/Documents/Git/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Documents/Git/znap
source ~/Documents/Git/znap/znap.zsh  # Start Znap

alias nf='neofetch | lolcat'
alias cls='clear'
alias pacman='sudo pacman'
alias nv='nvim'
alias z='cd'
alias x='exit'

zstyle ':znap:*' repos-dir ~/Documents/Zsh/
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-syntax-highlighting
znap source skywind3000/z.lua
znap source zsh-users/zsh-autosuggestions
znap source romkatv/zsh-defer
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

setopt correct
export DRI_PRIME=1
export PATH=$PATH:./node_modules/.bin
