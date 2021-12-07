#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 5)\]\[$(tput setaf 4)\]\h \W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"


#Display ISO version and distribution information in short
alias version="sed -n 1p /etc/os-release && sed -n 11p /etc/os-release && sed -n 12p /etc/os-release"

#Pacman Shortcuts
alias sync="sudo pacman -Syyy"
alias install="sudo pacman -S"
alias update="sudo pacman -Syyu"
alias search="sudo pacman -Ss"
alias search-local="sudo pacman -Qs"
alias pkg-info="sudo pacman -Qi"
alias local-install="sudo pacman -U"
alias clr-cache="sudo pacman -Scc"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias remove="sudo pacman -R"
alias autoremove="sudo pacman -Rns"


type nvim >/dev/null &&
    alias vi=nvim &&
    alias vim=nvim

### SET VI MODE ###
# Comment this line out to enable default emacs-like bindings
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

alias vimrc='vim ~/.config/nvim/init.vim'
alias rc="vim ~/.bashrc && source ~/.bashrc"
alias kt='vim ~/.config/kitty/kitty.conf'
#alias vimrc=' vim ~/.vimro

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'

export EDITOR=nvim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/balde/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
    # eval "$__conda_setup"
# else
    if [ -f "/home/balde/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/balde/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/balde/anaconda3/bin:$PATH"
    fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

alias jnb="jupyter notebook"
alias jl="jupyter lab"
alias ca="conda activate"
alias da="conda deactivate"
alias mp='makepkg -si'
alias sv='sudo nvim'
alias v='nvim'


alias rm='rm -rf'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# export PATH="$HOME/.local/bin/:$PATH"


# git
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'
