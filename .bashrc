[ -z "$PS1" ] && return

# Affichage du prompt personnalisé sur 2 lignes, avec couleur root & user
PS1="\n\$(if [[ \$EUID == 0 ]]; then echo \"\[\033[0;31m\]\"; else echo \"\[\033[0;33m\]\"; fi)\342\226\210\342\226\210 [ \u@\h ] [ \w ] [ \t ]\n\[\033[0m\]\342\226\210\342\226\210 "

# Source des différents profils
# source alias définitions
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

# source /etc/bashrc
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Meilleure completion du bash
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
fi

# source admin bash.profile
if [ -f /admin/etc/bash.profile ]; then
        . /admin/etc/bash.profile
fi

# Gestion de l'historique
# Permet de ne pas afficher les commandes en double et les commandes vides
export HISTCONTROL=ignoredups:ignorespace
# Lignes de l'historique par session bash
export HISTSIZE=5000
# Lignes de l'historique conservées
export HISTFILESIZE=20000
# Format de l'historique : jour/mois/année - heure :
export HISTTIMEFORMAT="%d/%m/%Y - %T : "
# Support des terminaux redimensionnables (xterm et screen -r)
shopt -s checkwinsize
# Ajoute au fichier, ne l'écrase pas
shopt -s histappend
PROMPT_COMMAND='history -a'
# Active ctrl+S pour la navigation dans l'historique (avec crtl+R)
stty -ixon
# Log les commandes sudo
# export HISTFILE=/var/log/sudousers_historylogs/root_history-$(who am i | awk '{print $1}';exit)

# Colorisation des manpages
man() {
    env \
    LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;31m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[01;31m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[01;32m' \
    man "$@"
}


# rendre "less" plus convivial pour les fichiers d'entrés non-textuels, voir lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Afficher les couleurs pour certaines commandes
# dircolors est un theme "dark solarized"
if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
else
        echo "Please : Install dircolors package"
fi

# Alias BASHRC
alias rm='rm -i' # -i -> demande de confirmation
alias cp='cp -i' # -i -> demande de confirmation
alias mv='mv -i' # -i -> demande de confirmation

# Alias LS
alias ls='ls -aFh --color=auto' # add colors and file type extensions
alias la='ls -Alh --color=auto' # show hidden files
alias ll='ls -alFh --color=auto' # ls + la
alias lx='ls -lXBh --color=auto' # sort by extension
alias lk='ls -lSrh --color=auto' # sort by size
alias lc='ls -lcrh --color=auto' # sort by change time
alias lu='ls -lurh --color=auto' # sort by access time
alias lart='ls -larth --color=auto' #s sort by modify time
alias lr='ls -lRh --color=auto' # recursive ls

# Alias GREP
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Alias DU
alias du='du -h --max-depth=1'
alias du+='du -h --max-depth=1 | sort -h -r | less'
alias dusort='du -x --block-size=1048576 | sort -nr'
alias df='df -h'

# Si la distribution est debian-like
# alias miseajour='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo  apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove'
# Si la distribution est redhat-like
# alias miseajour='sudo yum update'

# Alias APP
command -v htop  >/dev/null 2>&1 && alias htop='sudo htop'
# Améliore diff avec des couleurs
command -v colordiff  >/dev/null 2>&1 && alias diff='colordiff'

# Mes exports
export EDITOR=vim
export VISUAL=vim


# Mes Fonctions

# lecture colorée de logs
function logview() {
        command -v ccze  >/dev/null 2>&1 && ccze -A < $1 | less -R
}

# lecture colorée de logs en direct logview()
function logtail() {
        command -v ccze  >/dev/null 2>&1 && tail -f $1 | ccze
}

# Extracts any archive(s) (if unp isn't installed)
function extract () {
        for archive in $*; do
                if [ -f $archive ] ; then
                        case $archive in
                                *.tar.bz2)   tar xvjf $archive    ;;
                                *.tar.gz)    tar xvzf $archive    ;;
                                *.bz2)       bunzip2 $archive     ;;
                                *.rar)       rar x $archive       ;;
                                *.gz)        gunzip $archive      ;;
                                *.tar)       tar xvf $archive     ;;
                                *.tbz2)      tar xvjf $archive    ;;
                                *.tgz)       tar xvzf $archive    ;;
                                *.zip)       unzip $archive       ;;
                                *.Z)         uncompress $archive  ;;
                                *.7z)        7za x $archive        ;;
                                *)           echo "don't know how to extract '$archive'..." ;;
                        esac
                else
                        echo "'$archive' is not a valid file!"
                fi
        done
}

