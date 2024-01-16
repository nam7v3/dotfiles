. "$HOME/.profile"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ -x $(command -v vivid) ]]; then
  export LS_COLORS="$(vivid generate gruvbox-dark-soft)"
else
  eval "$(dircolors)"
fi

# Useful aliases
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias nv='nvim'
alias c=clear
alias rm='rm -i'
alias tm=tmux
alias ta='tmux attach'

# Shell options
shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s no_empty_cmd_completion
shopt -s histappend

# readline settings
bind "set colored-completion-prefix on"
bind "set colored-stats on"
bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set enable-keypad on"

# terminal keybinding
stty werase undef
bind '"\C-w": kill-region'
bind '"\C- ": set-mark'
bind '"\ew": copy-region-as-kill'

for sh in ~/.bash/* ; do
	[[ -r ${sh} ]] && source "${sh}"
done

# Prompt
## user
PS1='\[\033[01;32m\][\u]\[\033[01;34m\]'

## cwd
if [[ -n $(command -v __limit_path_ps1) ]]; then
  PS1=$PS1'\[\033[01;33m\][$(__limit_path_ps1 3)]\[\033[01;34m\]'
else
  PS1=$PS1'\[\033[01;33m\][\W]\[\033[01;34m\]'
fi

## Jobs
PS1=$PS1'$([ \j -gt 0 ] && echo [\j])'
if [[ -n $(command -v __git_ps1) ]]; then
  PS1=$PS1'\[\033[1;36m$(__git_ps1 "[%s]")\033[0m\]'
fi

PS1=$PS1'$ '
