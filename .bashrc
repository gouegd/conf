# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1='\[\e[7;33m\]$(__git_ps1 "%s")\[\e[0;36m\] \w\[\e[0m\] $ '


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#Java dev
export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_26
export M2_HOME=/usr/local/java/maven3
export MAVEN_OPTS="-Xms256m -Xmx512m"
export REBEL_HOME=/usr/local/java/eclipse-4.2/plugins/org.zeroturnaround.eclipse.embedder_5.3.0.RELEASE-201305281235/jrebel/
export SITE_NAME=case_7722
export LANG=en_NZ.UTF-8
export LC_ALL=en_NZ.UTF-8
export LC_TYPE=en_NZ.UTF-8

PATH=$M2_HOME/bin:/home/greg.desfour/projects/maven-misc/bin:$PATH

#Kiwiplan framework
KIWI=/kiwi
DATA=$KIWI/data
PROGS=$KIWI/progs
SQL=$KIWI/sql
SCP=$KIWI/scp
BIN=$KIWI/bin
KIWISEA=$DATA:$PROGS:$SQL:$SCP:$BIN
LD_LIBRARY_PATH=/kiwi/progs
PATH=$KIWISEA:$PATH
export PATH
export LD_LIBRARY_PATH
export KIWI DATA PROGS SQL SCP BIN KIWISEA

#MySQL
KWSQL_USER=test
KWSQL_PASS=test
export KWSQL_USER KWSQL_PASS

#Add Ctrl+] shortcut to copy the current bash command
bind '"\C-]":"\C-e\C-u xclip <<"EOF"\n\C-y\nEOF\n"'
#Ctrl+G launches lfm
bind '"\C-G":"\C-e\C-ulfm\n"'

# Last file manager: stay in browsed directory on quit
lfm()
{
/usr/bin/lfm "$*"
LFMPATHFILE=/tmp/lfm-$$.path
cd "`cat $LFMPATHFILE`"
rm -f $LFMPATHFILE
}
