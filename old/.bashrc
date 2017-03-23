#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export XDG_CONFIG_HOME="$HOME/.config"
alias mountf='mount -t vmhgfs .host:/F ~/shares'
alias sudo='sudo '
alias scr='scrot screen.png && imgurbash screen.png'
alias testkeys='xev | grep -A2 --line-buffered '\''^KeyRelease'\'' | sed -n '\''/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'\'''
alias fehbg='feh --no-xinerama --bg-fill ~/wall.jpg'
alias listpackages='pacman -Qei | awk '\''/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 != "base-devel" ) { print name } }'\'''


function lazygit() {
    git add .
    git commit -a -m "$1"
    git push origin master
}

function configcopy() {
    conf="/home/chris/i3-config/"
    cp ~/.i3/config $conf.i3
    cp ~/.Xresources $conf
    cp ~/.bashrc $conf
    cp ~/.i3blocks.conf $conf
    cp ~/.vimrc $conf
}

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-flat.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL ]]

# Note: ~/.ssh/environment should not be used, as it
#       already has a different purpose in SSH.

env=~/.ssh/agent.env

# Note: Don't bother checking SSH_AGENT_PID. It's not used
#       by SSH itself, and it might even be incorrect
#       (for example, when using agent-forwarding over SSH).

agent_is_running() {
    if [ "$SSH_AUTH_SOCK" ]; then
        # ssh-add returns:
        #   0 = agent running, has keys
        #   1 = agent running, no keys
        #   2 = agent not running
        ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
    else
        false
    fi
}

agent_has_keys() {
    ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
    . "$env" >/dev/null
}

agent_start() {
    (umask 077; ssh-agent >"$env")
    . "$env" >/dev/null
}

if ! agent_is_running; then
    agent_load_env
fi

# if your keys are not stored in ~/.ssh/id_rsa or ~/.ssh/id_dsa, you'll need
# to paste the proper path after ssh-add
if ! agent_is_running; then
    agent_start
    ssh-add
elif ! agent_has_keys; then
    ssh-add
fi

unset env

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/home/chris/.gvm/bin/gvm-init.sh" ]] && source "/home/chris/.gvm/bin/gvm-init.sh"

JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/"
