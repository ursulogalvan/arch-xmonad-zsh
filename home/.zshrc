# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="beloglazov"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux history-substring-search svn)

# Add custom completion scripts
fpath=(~/.zsh/completion $fpath)

source $ZSH/oh-my-zsh.sh

# Disable auto-correction
unsetopt correct_all

# To enable autojump
# source /etc/profile

# To enable fasd
eval "$(fasd --init auto)"

# Colorized ls
eval `dircolors -b`

export EDITOR="vim"

# Key Bindings

bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
bindkey "^[[3^" delete-word # C-Del
bindkey "^H" backward-delete-word # C-BackSpace

bindkey '^K' up-line-or-search
bindkey '^J' down-line-or-search

# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# fasd
bindkey '^X^A' fasd-complete    # C-x C-a to do fasd-complete (fils and directories)
bindkey '^X' fasd-complete-f  # C-x to do fasd-complete-f (only files)
bindkey '^Z' fasd-complete-d  # C-z to do fasd-complete-d (only directories)

# Functions

function svnd () {svn diff $* | colordiff}
function top10 () {history | awk '{print $2}'|awk 'BEGIN {FS="|"} {print $1}' | sort | uniq -c | sort -rn | head -10}

unalias f
function f() {find ./ -iname "*$1*" 2>/dev/null | grep -i $1}

# unalias g
# function g () {git ca $*; git push}

unalias yain
function yain () {yaourt -S $*; rehash}

# Aliases

alias ll='ls -lah'
alias l='ls -lh'
alias lltime='ll -tr'
alias llsize='l --group-directories-first -S'
alias lld='ls -lhd *(-/DN)'
alias llh='ls -lhd .*'
alias df='pydf'
alias du='du -hs'
alias mkdirs='mkdir -p'
alias n='nano'
#alias shutdown='sudo shutdown -Hh now'
#alias reboot='sudo reboot'
alias xbox='lftp xbox:xbox@xbox'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias bc='bc -l'
alias psg='ps aux | grep'
alias emacs-restart='pkill emacs; emacs --daemon'
alias g='grep -i'
alias x='dtrx'
alias le='less'
alias diff='colordiff'
alias za='zathura'
alias v='vim --servername vim'
alias view='vim -R -'

# fasd aliases
alias ee='fasd -ae e'
alias ed='fasd -de e'
alias ef='fasd -fe e'
alias vd='fasd -de vim'
alias vf='fasd -fe vim'

# SVN aliales
alias svn='colorsvn'
alias svnc='svn ci -m'
alias svnl='svn up -q; colorsvn log -l 10'
alias svns='svn st'

# Git aliases
alias gits='git s'
alias gitc='git ci'
alias gitca='git ca'
alias gitl='git l'
alias gitco='git co'
alias gitb='git b'
alias gitd='git diff'
alias gitp='git p'
alias gitpu='git pu'

# Eclipse aliases
alias eclipse-clojure='silent ~/soft/eclipse/eclipse-clojure-indigo/eclipse'
alias eclipse-java='silent ~/soft/eclipse/eclipse-java-indigo/eclipse'
alias eclipse-jee='silent ~/soft/eclipse/eclipse-jee-indigo/eclipse'

# Set up auto extension stuff
#alias -s html=$BROWSER
#alias -s org=$BROWSER
#alias -s php=$BROWSER
#alias -s com=$BROWSER
#alias -s net=$BROWSER
#alias -s png=feh
#alias -s jpg=feh
#alias -s gif=feg
#alias -s sxw=soffice
#alias -s doc=soffice
#alias -s gz='tar -xzvf'
#alias -s bz2='tar -xjvf'
#alias -s java=$EDITOR
#alias -s txt=$EDITOR
#alias -s PKGBUILD=$EDITOR

# Other aliases
alias ff='find |grep'
# alias c="clear"

# Don't share history between terminals
unsetopt APPEND_HISTORY
unsetopt SHARE_HISTORY

export PERL_LOCAL_LIB_ROOT="/home/anton/perl5";
export PERL_MB_OPT="--install_base /home/anton/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/anton/perl5";
export PERL5LIB="/home/anton/perl5/lib/perl5/i686-linux-thread-multi:/home/anton/perl5/lib/perl5";
export PATH="/home/anton/perl5/bin:$PATH";
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/jvm/java-7-openjdk/jre/lib/i386:/usr/lib/jvm/java-7-openjdk/jre/lib/i386/client"

stty -ixon

source ~/.zshenv
