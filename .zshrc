# hallaj's .zshrc

## history
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000

setopt hist_ignore_dups
setopt hist_ignore_space
setopt appendhistory

## keybinding
bindkey -v
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

## autocomplete
autoload -Uz compinit
compinit

## prompt
autoload -Uz promptinit
promptinit

## autocd if path is a directory
setopt autocd

## loading vcs_info
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr 'S'
zstyle ':vcs_info:*' unstagedstr 'M'
zstyle ':vcs_info:*' formats '%F{124}[%f%F{245} %b@%r %f%F{124}]%f (%c%u)'

precmd() { vcs_info }

setopt promptsubst

PROMPT='%n@%m:%~: %% '
RPROMPT='${vcs_info_msg_0_}'

## funtoo's keychain
test -x $(which keychain 2>&1) && eval $(keychain --quick --quiet id_dsa)
