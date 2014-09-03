# hallaj's .zshrc

## variables
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000

## autoload items
autoload -U colors              # colors
autoload -U compinit            # completion
autoload -U promptinit          # prompts
autoload -U select-word-style   # changes the select way word keymap
autoload -U vcs_info            # version control

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
setopt correctall               # enable correction on typos
setopt histignoredups           # ignore duplicates from being saved into
                                # history
setopt histignorespace          # we're not recording stuffs that starts with
                                # space
setopt nonomatch                # disables stopping on failed globbing
                                # I need this for `git reset --soft HEAD^`
                                # since I'm lazy to escape it
setopt promptsubst              # allows prompt substitution
setopt pushdignoredups          # ignore duplicate directories being generated
                                # in pushd
setopt sharehistory             # share history between sessions

## precmd
precmd() { vcs_info }

## zstyle parameters
zstyle ':vcs_info:*' enable
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}✔%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}✘%f'
zstyle ':vcs_info:*' formats ' :: %b@%r %c%u'
zstyle ':vcs_info:*' actionformats ' - '

PROMPT='[ %~ %${vcs_info_msg_0_} ] > '
RPROMPT='[ %n@%l on %m ]'

## misc autoload applications
if [ ! -x $(which keychain 2>&1) ]; then
    echo "Missing keychain!"
else
    eval $(keychain --quick --quiet id_dsa)
fi
