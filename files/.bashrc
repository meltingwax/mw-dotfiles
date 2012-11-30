#########################################################
# MeltingWax's ~/.bashrc
# By: MeltingWax <daniel@meltingwax.net>
#########################################################

# --------------------- Personal Aliases/Exports ------------------------- #

alias emaf="emacs -nw"
alias git_untracked='git ls-files . --exclude-standard --others'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias ll="ls -l"

export PATH=$HOME/bin:$HOME/Bin:$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib/:$LD_LIBRARY_PATH
export Y_DEV_KEY="AI39si4J3y3x67SL4SOyCSKUTQ9lk6r-taAoWd9oCars9G7COACM2QVIquCFm1om9NHBYsSBGmWeqeRU_30XkJuvVW68AJC3nQ"


# ---------------- Stop Here if not running interactively ---------------- #

[ -z "$PS1" ] && return

# ----------------------------- Misc Settings ---------------------------- #

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# -------------------- Determine Terminal coloring ----------------------- #

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
else
    case "$TERM" in
	xterm-color) color_prompt=yes;;
	*) color_prompt=;;
    esac
fi

# -------------------- Set up $PS1 (Shell Prompt) ----------------------- #

if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ "$color_prompt" = yes ]; then
    case $(hostname) in
	# Desktops
	verlaine)
	    PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ";;

	# Personal Servers
	rainbowroad.org | meltingwax.xen.prgmr.com | rapids)
	    PS1='\[\033[01;35m\]\u@\h\[\033[01;30m\] \w \$\[\033[00m\] ';;
	
	# Work Servers
	s4pt | gsocial)
	    PS1="\[\033[01;33m\]\h\[\033[00;36m\]:\w \[\033[00m\]$ ";;

	# Default
	*)
	    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\] \w $\[\033[00m\]\ ';;
    esac
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt



