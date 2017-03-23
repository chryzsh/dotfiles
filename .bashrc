#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

setxkbmap no

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
    cp ~/.config/i3/config $conf
    cp ~/.bashrc $conf
    cp ~/.i3blocks.conf $conf
    cp ~/.vimrc $conf
    cp ~/.config/termite/config $conf
    cp ~/.config/gtk* -r $conf
    cp ~/.gtk* $conf
    cp ~/.config/redshift.conf $conf
}


export EDITOR=vim

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

alias cif='sudo mount -t cifs //10.0.0.2/d /mnt/d -o user=chris,password=hanna'
