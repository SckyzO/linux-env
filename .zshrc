# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/tom/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=powerlevel10k/powerlevel10k
#ZSH_THEME="robbyrussell"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aws fzf vagrant git colorize colored-man-pages terraform thefuck)

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


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
#shopt -s checkwinsize
# Ajoute au fichier, ne l'écrase pas
#shopt -s histappend
PROMPT_COMMAND='history -a'
# Active ctrl+S pour la navigation dans l'historique (avec crtl+R)
#stty -ixon
# Log les commandes sudo
# export HISTFILE=/var/log/sudousers_historylogs/root_history-$(who am i | awk '{print $1}';exit)

# Colorisation des manpages
#man() {
#    env \
#    LESS_TERMCAP_mb=$'\E[01;31m' \
#    LESS_TERMCAP_md=$'\E[01;31m' \
#    LESS_TERMCAP_me=$'\E[0m' \
#    LESS_TERMCAP_se=$'\E[0m' \
#    LESS_TERMCAP_so=$'\E[01;31m' \
#    LESS_TERMCAP_ue=$'\E[0m' \
#    LESS_TERMCAP_us=$'\E[01;32m' \
#    man "$@"
#}

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

source <(kubectl completion zsh)

