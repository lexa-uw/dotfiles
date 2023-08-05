export CLICOLOR=1
export DISPLAY=":0"
export EDITOR=vim
export LSCOLORS=ExFxBxDxCxegedabagacad
export PATH="${PATH}:${HOME}/bin:/opt/homebrew/bin" 
export PS1='\[\033[${USER_COLOR}m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]$(p=${PWD/#"$HOME"/~};((${#p}>30))&&echo "${p::10}…${p:(-19)}"||echo "\w")]\[\033[m\]\$ '

if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

# Customize bash
PROMPT_DIRTRIM=5

less () {
    /usr/share/vim/vim*/macros/less.sh "$*"
}

# History settings
HISTCONTROL=erasedups:ignoreboth:ignoredups:ignorespace

USER_COLOR=101
if [[ $EUID -ne 0 ]]; then
      USER_COLOR=96
fi

