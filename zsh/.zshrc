# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=custom_avit

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git fabric pip pyenv django python sublime web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin"
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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Editor
export EDITOR="vim"

# Solarized
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi



export PATH="$HOME/anaconda/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Aliases
alias "teamspeak_run_bg=bash $HOME/installed_programs/TeamSpeak*/ts3client_runscript.sh &"

alias "matlab_run=sudo bash $HOME/installed_programs/matlab*/bin/matlab &"

alias "pycharm=$HOME/installed_programs/pycharm*/bin/pycharm.sh"
alias "pycharm_run=pycharm &"

alias "smartgit_run=sudo bash $HOME/installed_programs/smartgithg*/bin/smartgithg.sh &"

alias "android_studio_run=sudo bash $HOME/installed_programs/android-studio/bin/studio.sh &"


alias "lsh=ls -human"
alias "clc=clear"

# Vim aliases
alias "vim_plugin_install_and_quit=vim +PluginInstall +:q +:q"
alias "vim_plugin_update_and_quit=vim +PluginUpdate +:q +:q"

export SETUP_PATH="$HOME/setup"

export DEBIAN_PKG_PATH="$HOME/setup/deb"

export PROGRAMS_PATH="$HOME/installed_programs"

export CONFIG_PATH="$HOME/Dropbox/configuration"

# www.gitignore.io command line. Use it like gi python,pycharm,git >> .gitignore
function gi() { wget -qO- https://www.gitignore.io/api/$@ ;}

# mkdir and cd into it. Use it like mkcdir path/to/folder
function mkcdir() { mkdir -p -- "$1" && cd -P -- "$1" }
