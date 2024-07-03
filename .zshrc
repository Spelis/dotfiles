cat ~/.cache/wal/sequences
pokemon-colorscripts -r
setopt autocd
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

openclose() {
    "$@" &
    disown
    exit
}

alias nf='pokemon-colorscripts -r'
alias cls='clear'
alias pacman='sudo pacman'
alias yoink='paru -S'      # install package
alias yeet='paru -R'         # delete package
alias overhaul='sudo pacman -Syyuu && paru -Syyuu' # update system
alias nv='nvim'
alias z='cd'
alias x='exit'
alias kys='exit' #hey, i mean it literally kills itself
alias code='openclose code' # visual studio code
alias firefox='openclose firefox' # firefox
alias ls='eza --icons=always --no-quotes --group-directories-first --hyperlink'
alias py='python'
alias bind='python $HOME/.config/hypr/binds.py'
alias grassfetch="kitty +kitten icat 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmedia.tenor.com%2FNVtF-8Ckz68AAAAC%2Fgrass-touch.gif&f=1&nofb=1&ipt=03726cb8e9306190dfd975c80ca198eec810d790d0f2486db5bcff4c877a5ee9&ipo=images'"

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

