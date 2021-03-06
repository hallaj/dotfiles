# hallaj's .zshrc

## variables
HISTFILE=~/.history
HISTSIZE=100000
SAVEHIST=100000

## autoload items
autoload -U colors                          # colors
autoload -U compinit                        # completion
autoload -U promptinit                      # prompts
autoload -U select-word-style               # changes the select way word keymap
autoload -U vcs_info                        # version control
autoload -U up-line-or-beginning-search     # history completion c<up> to complete \
                                            # history that starts with the letter c
autoload -U down-line-or-beginning-search   # history completion c<down> to complete \
                                            # history that starts with the letter c

## init items
colors
compinit
promptinit
select-word-style bash          # I still enjoy using Alt+Backspace for
                                # deleting words from /path/separators

## set options
setopt appendhistory            # append history instead of replacing them
setopt autocd                   # auto change directory, without using cd
setopt autopushd                # pushd for every directory change
                                # list with dirs -v
                                # access via ~<number>
setopt correct                  # correct's only some of the things
setopt histignoredups           # ignore duplicates from being saved into
                                # history
setopt histignorespace          # we're not recording stuffs that starts with
                                # space
setopt interactivecomments      # enable inline comments
setopt nonomatch                # disables stopping on failed globbing
                                # I need this for `git reset --soft HEAD^`
                                # since I'm lazy to escape it
setopt promptsubst              # allows prompt substitution
setopt pushdignoredups          # ignore duplicate directories being generated
                                # in pushd
setopt sharehistory             # share history between sessions

## ZLE
zle -N up-line-or-beginning-search    # Move cursor back to the end of the line in history
zle -N down-line-or-beginning-search  # Move cursor back to the end of the line in history

## keybinding
bindkey "^[[A"  up-line-or-beginning-search
bindkey "^[[B"  down-line-or-beginning-search
bindkey "^[[1~" beginning-of-line
bindkey "^[[7~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[8~" end-of-line
bindkey "^[[3~" delete-char

## precmd
precmd() { vcs_info }

## zstyle parameters
zstyle ':vcs_info:*' enable
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}✔%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}✘%f'
zstyle ':vcs_info:*' formats ' :: %b - %r %c%u'
zstyle ':vcs_info:*' actionformats ' - '

## exports
export TERM="screen-256color"

## aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias view='vim -R'

## autoload .zshrc.d files
if [ -d "$HOME/.zshrc.d" ]; then
  for file in $HOME/.zshrc.d/*.sh; do
    source $file
  done
fi
