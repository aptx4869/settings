# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# color definitions.
sh_norm="\[\033[0m\]"
sh_black="\[\033[0;30m\]"
sh_darkgray="\[\033[1;30m\]"
sh_blue="\[\033[0;34m\]"
sh_light_blue="\[\033[1;34m\]"
sh_green="\[\033[0;32m\]"
sh_light_green="\[\033[1;32m\]"
sh_cyan="\[\033[0;36m\]"
sh_light_cyan="\[\033[1;36m\]"
sh_red="\[\033[0;31m\]"
sh_light_red="\[\033[1;31m\]"
sh_purple="\[\033[0;35m\]"
sh_light_purple="\[\033[1;35m\]"
sh_brown="\[\033[0;33m\]"
sh_yellow="\[\033[1;33m\]"
sh_light_gray="\[\033[0;37m\]"
sh_white="\[\033[1;37m\]"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color) color_prompt=yes;;
	screen-*color) color_prompt=yes;;
# in .tmux.conf 
# set -g default-terminal "screen-256color"
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

PROMPT_COMMAND='if [ $? -ne 0 ]; then ERROR_FLAG=1; NORMAL_FLAG=; else ERROR_FLAG=; NORMAL_FLAG=1; fi; '

case `hostname` in
	"livehost"|"production_server"|"sauron")
		HOSTCOLOUR=${sh_red}
		;;
	#"staging-node") HOSTCOLOUR=${sh_yellow} ;;
"debian") HOSTCOLOUR=${sh_yellow} ;;
	*) HOSTCOLOUR=${sh_green} ;;
esac

case $USERNAME in
	"root")	USERCOLOR=${sh_light_red} ;;
*)	USERCOLOR=${sh_green} ;;
	#*) USERCOLOR=${sh_white} ;;
esac

error_face=' ψ(ﾟдﾟ#)'
ERROR_FACE='${ERROR_FLAG:+'${sh_light_red}${error_face}'}'
happy_face=' ψ(‧_‧?)'
HAPPY_FACE='${NORMAL_FLAG:+'$happy_face'}'
chroot_prompt=${debian_chroot:+($debian_chroot)}
user_prompt=$USERCOLOR'\u'$sh_norm
host_prompt=$HOSTCOLOUR'\h'$sh_norm
face_prompt=${ERROR_FACE}${HAPPY_FACE}' '$sh_norm

if [ "$color_prompt" = yes ]; then
	export PS1=${chroot_prompt}${user_prompt}'@'$host_prompt' \w\n$(git branch &>/dev/null;\
		if [ $? -eq 0 ]; then
		  echo "$(echo `git status` | grep "无须提交" > /dev/null 2>&1;
		  if [ "$?" -eq "0" ]; then
			# @4 - Clean repository - nothing to commit
			case "$(__git_ps1 "%s")" in
				master) echo $(__git_ps1 " ('$sh_light_purple'%s'$sh_norm')");;
				*) echo $(__git_ps1 " ('$sh_green'%s'$sh_norm')");;
			esac;
		  else
			# @5 - Changes to working tree
			case "$(__git_ps1 "%s")" in
				master) echo $(__git_ps1 " {'$sh_light_red'%s'$sh_norm'}");;
				*) echo $(__git_ps1 " {'$sh_light_cyan'%s'$sh_norm'}");;
			esac;
		  fi)";
		fi)'${sh_norm}${face_prompt} 
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
		;;
	*)
		;;
esac

#export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
#PS1="\n$TITLEBAR$LIGHTGREEN[ $RED$IS_REMOTE$IS_SCREEN$LIGHTGREEN\u@\h ]\n\\\$$NO_COLOUR "

#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=xim
#export XMODIFIERS="@im=fcitx"

export XMODIFIERS="@im=fcitx"
export XIM=fcitx
export XIM_PROGRAM=fcitx
export QT_IM_MODULE=xim
export GTK_IM_MODULE=xim

export CFLAGS='-march=native -O3 -pipe -fomit-frame-pointer'
export CXXFLAGS=$CFLAGS
export JAVA_HOME=/usr/lib/jvm/java-6-sun
#figlet '   A P T X  4 8 6 9 ';
linuxlogo -f -u -L random_xy
fortune-zh
echo

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
# enable rails completion
if [ -f ~/.rails_completion/rails.bash ] && ! shopt -oq posix; then
	source ~/.rails_completion/rails.bash
fi

bind '"\C-x":"cd ~/workshop/caterpie/ \
	tmux neww -dk -n testing -t :3 '\''rails s'\'' \\; splitw -dh -p 62 -t :3 autotest \\; splitw -dv -p 38 -t :3 spork\C-m"'
export ROS_PACKAGE_PATH=~/ros:$ROS_PACKAGE_PATH
eval `dbus-launch --sh-syntax --exit-with-session`
