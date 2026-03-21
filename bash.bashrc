# ubuntu
alias sau='sudo apt-get update'
alias sug='sudo apt-get upgrade'
alias sn='sudo nano'
alias zz='sudo nano ~/.bashrc'
alias cx='chmod +x'
alias 1c='warp-cli connect'
alias 1d='warp-cli disconnect'
alias 1s='warp-cli status'
alias v1='vnstat -i CloudflareWARP -d'
alias v2='vnstat -i eno1 -d'
alias sauu='sudo apt update && sudo apt upgrade '

alias rgui='rclone rcd --rc-web-gui'


# HDMI
# Dynamic HDMI detection
alias x1='xrandr | grep "HDMI" | awk "{print \$1}" | xargs -I {} xrandr --output {} --off'
alias x2='xrandr | grep "HDMI" | awk "{print \$1}" | xargs -I {} xrandr --output {} --auto'

# python
alias py1='python3 -m venv venv'
alias py2='source venv/bin/activate'

# code 
alias clocn='cloc . --include-ext=ts,tsx --exclude-dir=node_modules,.next,dist,.open-next'

alias c='cursor .'
alias uc='sudo apt upgrade cursor'
alias ag='antigravity .'

# added by me 
alias nenv='node --env-file=.env'
alias nd='npm run dev'
alias ns='npm start'
alias nb='npm run build'
alias np='npm run preview'
alias nl='npm run lint'
alias nlf='npm run lint:fix'
alias ndbg='npx drizzle-kit generate'
alias ndbm='npx drizzle-kit migrate'
alias ndbs='npx drizzle-kit studio'
alias ndkp='npx drizzle-kit push'

# pnpm

alias pdbg='pnpm dlx drizzle-kit generate'
alias pdbm='pnpm dlx drizzle-kit migrate'
alias pdbs='pnpm dlx drizzle-kit studio'

alias pr='pnpm run'
alias pd='pnpm run dev'
alias pdf='pnpm run dev:frontend'
alias pdb='pnpm run dev:backend'
alias ps='pnpm start'
alias pb='pnpm run build'
alias pp='pnpm run preview'
alias pl='pnpm run lint'
alias plo='pnpm run lint:ox'
alias plf='pnpm run lint:fix'
alias pf='pnpm run format'
alias pfo='pnpm run format:ox'

# git
alias gi='git init'
alias gadd='git add'
alias ga='git add -A'
alias gap='git add -p'
alias gc='git commit -m'
alias gcm='git commit -m'
alias gb='git branch'
alias gbmm='git branch -M main'
alias gf='git fetch'
alias grv='git remote -v '
alias gra='git remote add '
alias grao='git remote add origin'
alias grsuo='git remote set-url origin'
alias gp='git push'
alias gpo='git push origin'
alias gpoh='git push origin HEAD'
alias gco='git checkout'
alias gpuom='git push -u origin main'
alias gcb='git checkout -b'
alias glo='git log --oneline'
alias gst='git status'
alias gcl='git clone'


gz() {
  echo "Enter commit message: "
  read -r msg
  git add -A
  git commit -m "$msg"
  git push
}

gx() {
  echo "Enter commit message (no push) : "
  read -r msg
  git add -A
  git commit -m "$msg"
}
\

alias pi='pnpm i'
alias pio='pnpm i --offline'
alias pipo='pnpm i --prefer-offline'
alias pr='pnpm run'
alias pab='pnpm approve-builds'

alias ndp='netlify deploy --prod'
alias vp='vercel --prod'

alias x='rm -rf'


# wrangler 

alias wd='wrangler deploy'
alias wsp="wrangler secret put"


# docker 
alias dcd='docker compose down'
alias dcu='docker compose up'
alias dcup='docker compose up -d'

alias gtp='npx gitpick'

# linux

zzip() {
  unzip "$1" -d "${1%.zip}"
}

cd() {
    if [[ "$1" =~ ^-[0-9]+$ ]]; then
        local n=${1#-}
        local path=""
        for ((i=0; i<n; i++)); do
            path+="../"
        done
        builtin cd "$path"
    else
        builtin cd "$@"
    fi
}


# Ibus Cinnamon
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/z/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
