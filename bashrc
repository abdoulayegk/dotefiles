#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

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


type vim >/dev/null &&
    alias vi=vim &&
    alias vim=vim


export EDITOR=vim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/balde/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
  #  eval "$__conda_setup"
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
neofetch
alias ca="conda activate"
alias da="conda deactivate"
