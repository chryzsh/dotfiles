#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)


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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

DEFAULT_USER=chris
# The following lines were added by compinstall
zstyle :compinstall filename '/home/chris/.zshrc'

autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

setxkbmap no
xmodmap ~/.Xmodmap

function res() {
xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode Virtual-1 1920x1080
xrandr --output Virtual-1 --mode 1920x1080
}

function lazygit() {
    git add .
    git commit -a -m "$1"
    git push origin master
}

function configcopy() {
    conf="/home/chris/dotfiles/"
    mkdir -p /home/chris/dotfiles/config/
    dotconf="/home/chris/dotfiles/config"
    cp ~/.bashrc $conf
    cp ~/check.sh $conf
    cp ~/.colortest.sh $conf
    cp ~/.compton.conf $conf
    cp ~/.gtkrc-2.0 $conf
    cp ~/.i3blocks.conf $conf
    cp ~/.vimrc $conf
    cp ~/.xbindkeysrc $conf
    cp ~/.xinitrc $conf
    cp ~/.Xresources $conf
    cp ~/.Xmodmap $conf
    cp ~/.zshrc $conf

    mkdir -p $dotconf/fontconfig
    mkdir -p $dotconf/rofi
    mkdir -p $dotconf/polybar
    mkdir -p $dotconf/termite
    mkdir -p $dotconf/zathura
    mkdir -p $dotconf/i3
    mkdir -p $dotconf/gtk-3.0
    cp ~/.config/fontconfig/fonts.conf $dotconf/fontconfig
    cp ~/.config/redshift.conf $dotconf
    cp ~/.config/rofi/config $dotconf/rofi
    cp ~/.config/polybar/ $dotconf/ -r
    cp ~/.config/termite/config $dotconf/termite
    cp ~/.config/gtk-3.0/settings.ini $dotconf/gtk-3.0
    cp ~/.config/i3/config $dotconf/i3
    cp ~/.config/zathura/zathurarc $dotconf/zathura
}


export EDITOR=vim

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"


function mntshr() {
   sudo mount -t cifs //10.0.0.2/"$1" /home/chris/mnt/"$2" -o credentials=/home/chris/.share,uid=chris,gid=wheel
}
alias tw='teamviewer --daemon start'
alias ki="killall compton && compton -b"

export LFS=/mnt/lfs

alias update='sudo pacman -Syu'
alias feh='feh --scale-down --auto-zoom '

export LANG=en_US.UTF-8
