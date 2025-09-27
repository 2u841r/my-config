# added by me 
alias nrd='npm run dev'
alias nrs='npm start'
alias nrb='npm run build'
alias nrp='npm run preview'
alias nrl='npm run lint'
alias nrlf='npm run lint:fix'
alias nrdbg='npx drizzle-kit generate'
alias nrdbm='npx drizzle-kit migrate'
alias nrdbs='npx drizzle-kit studio'

alias pr='pnpm run'
alias prd='pnpm run dev'
alias prs='pnpm start'
alias prb='pnpm run build'
alias prp='pnpm run preview'
alias prl='pnpm run lint'
alias prlf='pnpm run lint:fix'
alias prdbg='pnpm dlx drizzle-kit generate'
alias prdbm='pnpm dlx drizzle-kit migrate'
alias prdbs='pnpm dlx drizzle-kit studio'

alias pr='pnpm run'
alias pd='pnpm run dev'
alias pdf='pnpm run dev:frontend'
alias pdb='pnpm run dev:backend'
alias ps='pnpm start'
alias pb='pnpm run build'
alias pp='pnpm run preview'
alias pl='pnpm run lint'
alias pf='pnpm run lint:fix'

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

alias wd='wrangler deploy'

alias pi='pnpm i' 
alias pio='pnpm i --offline' 
alias pipo='pnpm i --prefer-offline'
alias pr='pnpm run' 
alias pab='pnpm approve-builds' 

alias x='rm -rf' 

alias dcd='docker compose down'
alias dcu='docker compose up'
alias dcup='docker compose up -d'


eval "$(fnm env --use-on-cd --shell bash)"

# Add fnm to PATH
export PATH=$PATH:/c/Users/Zubair/AppData/Local/Microsoft/WinGet/Packages/Schniz.fnm_Microsoft.Winget.Source_8wekyb3d8bbwe

# Initialize fnm
eval "$(fnm env --use-on-cd --shell bash)"

export PATH=$PATH:/c/Users/Zubair/.bun/bin
export PATH=$PATH:/c/Users/Zubair/.fastly
export PATH=$PATH:/c/Users/Zubair/.fastly.exe
export PATH=$PATH:/c/Users/Zubair/.cargo/bin
export PATH=$PATH:/c/mkcert
# export NVM_DIR="/c/Users/Zubair/AppData/Local/nvm"
# export PATH="$NVM_DIR/$(nvm version)/bin:$NVM_DIR:$PATH"
export PATH=$PATH:/c/php

# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <https://creativecommons.org/publicdomain/zero/1.0/>. 

# /etc/bash.bashrc: executed by bash(1) for interactive shells.

# System-wide bashrc file

# Check that we haven't already been sourced.
([[ -z ${CYG_SYS_BASHRC} ]] && CYG_SYS_BASHRC="1") || return

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# If started from sshd, make sure profile is sourced
if [[ -n "$SSH_CONNECTION" ]] && [[ "$PATH" != *:/usr/bin* ]]; then
    source /etc/profile
fi

# Warnings
unset _warning_found
for _warning_prefix in '' ${MINGW_PREFIX}; do
    for _warning_file in ${_warning_prefix}/etc/profile.d/*.warning{.once,}; do
        test -f "${_warning_file}" || continue
        _warning="$(command sed 's/^/\t\t/' "${_warning_file}" 2>/dev/null)"
        if test -n "${_warning}"; then
            if test -z "${_warning_found}"; then
                _warning_found='true'
                echo
            fi
            if test -t 1
                then printf "\t\e[1;33mwarning:\e[0m\n${_warning}\n\n"
                else printf "\twarning:\n${_warning}\n\n"
            fi
        fi
        [[ "${_warning_file}" = *.once ]] && rm -f "${_warning_file}"
    done
done
unset _warning_found
unset _warning_prefix
unset _warning_file
unset _warning

# If MSYS2_PS1 is set, use that as default PS1;
# if a PS1 is already set and exported, use that;
# otherwise set a default prompt
# of user@host, MSYSTEM variable, and current_directory
[[ -n "${MSYS2_PS1}" ]] && export PS1="${MSYS2_PS1}"
# if we have the "High Mandatory Level" group, it means we're elevated
#if [[ -n "$(command -v getent)" ]] && id -G | grep -q "$(getent -w group 'S-1-16-12288' | cut -d: -f2)"
#  then _ps1_symbol='\[\e[1m\]#\[\e[0m\]'
#  else _ps1_symbol='\$'
#fi
case "$(declare -p PS1 2>/dev/null)" in
'declare -x '*) ;; # okay
*)
  export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[35m\]$MSYSTEM\[\e[0m\] \[\e[33m\]\w\[\e[0m\]\n'"${_ps1_symbol}"' '
  ;;
esac
unset _ps1_symbol

# Uncomment to use the terminal colours set in DIR_COLORS
# eval "$(dircolors -b /etc/DIR_COLORS)"

# Fixup git-bash in non login env
shopt -q login_shell || . /etc/profile.d/git-prompt.sh
