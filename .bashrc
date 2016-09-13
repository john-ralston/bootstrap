# Extract any compressed file

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }
 
# Change color of prompt command depending on the success of the last command
PROMPT_COMMAND='if [ $? = 0 ]; then PS1="\[\e[32;1m\]\u@\[\e[0m\e[30;47m\]\H\[\e[0m\]:\[\e[34;1m\]\w\[\e[0m\]$ "; else PS1="\[\e[31;1m\]\u@\[\e[0m\e[31;47m\]\H\[\e[0m\]:\[\e[31;1m\]\w\[\e[0m\]$ "; fi'

# Go up x directories
up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; }

# Similarly...
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
HISTCONTROL=ignoreboth

# ls aliases
alias ls='ls -F --color=auto'
alias l='ls'
alias ll='ls -ahl'

# Make a directory and cd to it!
mkcd() {
        if [ $# != 1 ]; then
                echo "Usage: mkcd <dir>"
        else
                mkdir -p $1 && cd $1
        fi
}

# Git related
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'

# backup a file
bu () { cp $1 ~/.backup/`basename $1`-`date +%Y%m%d%H%M`.backup ; }
