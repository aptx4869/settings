# .bash_aliases

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

alias pp='ps aux'
#alias vi='gvim'
alias pe='ps -e'
alias bc='bc -l'
alias ll='ls $LS_OPTION -l'
alias la='ls $LS_OPTION -la'
alias l='ls $LS_OPTIONS -lA | less'
alias locate='locate -r'
alias dstat='dstat -cdlmnpsy'
alias key-mon='key-mon -m -t modern'
alias top="htop"

alias ..='cd ..'
alias rm='rm -i'
alias ACS='apt-cache search'
alias ABI='sudo apt-build --remove-builddep install'
alias iconva='iconv -f GBK -t UTF-8 $FILE -o'
alias iconvb='iconv -f UTF-8 -t GBK $FILE -o'
alias radio='screen -t radio mplayer mms://211.148.197.132/szr_2'
