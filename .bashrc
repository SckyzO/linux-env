[ -z "$PS1" ] && return
 
# source du bashrc système
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
 
# source du fichier des alias personnalisé
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi
 
# Meilleure completion du bash
# Installer le package bash-completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
fi
 
# n'affiche pas les commandes tapées en double dans l'historique.
export HISTCONTROL=ignoredups:ignorespace
# nombre de lignes dans l'historique, par session bash
export HISTSIZE=5000
# nombre de lignes conservées dans l'historique
export HISTFILESIZE=20000
# ajout de la date et de l'heure dans l'historique
export HISTTIMEFORMAT="%d/%m/%Y - %T : "
# supporte des terminaux redimensionnables (xterm et screen -r)
shopt -s checkwinsize
 
# lesspipe.sh is an input filter for the pager less as described in less's man page.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
 
# ajout de la colorisation syntaxique
if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
 
# Mes alias BASHRC
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alFh --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias miseajour='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo  apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove'
alias saidar='sudo saidar -c -d 1'
alias htop='sudo htop'
alias calendrier='var=$(cal); echo "${var/$(date +%-d)/$(echo -e "\033[1;31m$(date +%-d)\033[0m")}"'
alias du='du -h --max-depth=1'
alias dusort='du -x --block-size=1048576 | sort -nr'
alias df='df -h'
alias passgen='pwgen  -y -n  20 1'
 
 
# Mes exports
export EDITOR=vim
export VISUAL=vim
 
# Affichage du prompt
PS1="\n\$(if [[ \$EUID == 0 ]]; then echo \"\[\033[0;31m\]\"; else echo \"\[\033[0;33m\]\"; fi)\342\226\210\342\226\210 [ \u@\h ] [ \w ] [ \t ]\n\[\033[0m\]\342\226\210\342\226\210 "
 
# lecture colorée de logs
# installer le package ccze
logview()
{
        ccze -A < $1 | less -R
}
 
# lecture colorée de logs en direct logview()
logtail()
{
        tail -f $1 | ccze
}
