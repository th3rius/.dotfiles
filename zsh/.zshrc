## Options section
setopt correct
setopt extendedglob
setopt nocaseglob
setopt rcexpandparam
setopt nocheckjobs
setopt numericglobsort
setopt nobeep
setopt appendhistory
setopt histignorealldups
setopt autocd
setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':vcs_info:git:*' formats '%b '

## Key bindings
bindkey "^[[1;5C" forward-word # Ctrl + Right arrow
bindkey "^[[1;5D" backward-word # Ctrl + Left arrow
bindkey '^H' backward-kill-word # Ctrl + Backspace
bindkey '^[[3;5~' kill-word # Ctrl + Delete

## History
HISTFILE=~/.cache/zhistory
HISTSIZE=1000
SAVEHIST=500

## Aliases
alias ls="ls --color=auto"

## Vars
export EDITOR="nvim"
export LESS=-r
export PATH="$PATH:~/.npm/bin"
export MANPATH="${MANPATH-$(manpath)}:~/.npm/share/man"

## Colors
autoload -U compinit colors zcalc
autoload -Uz compinit && compinit
compinit -d
colors

## Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

## Prompt
PROMPT='%{$fg_bold[red]%}%~%{$reset_color%} %{$fg[green]%}${vcs_info_msg_0_}%{$reset_color%}%(!.#.$) '
RPROMPT='%(?..%F{red}:()%f'

## Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/nvm/init-nvm.sh
