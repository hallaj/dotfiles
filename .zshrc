# hallaj's .zshrc

## variables
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000

## autoload items
autoload -U compinit        # completion
autoload -U promptinit      # prompts

## init items
compinit
promptinit

## set options
setopt appendhistory        # append history instead of replacing them
setopt autocd               # auto change directory, without using cd
setopt autopushd            # pushd for every directory change
                            # list with dirs -v
                            # access via ~<number>
setopt hist_ignore_dups     # ignore duplicates from being saved into history
setopt hist_ignore_space    # we're not recording stuffs that starts with space
setopt pushdignoredups      # ignore duplicate directories being generated
                            # in pushd

prompt elite                # use the existing elite prompt

## misc autoload applications
if [ ! -x $(which keychain 2>&1) ]; then
    echo "Missing keychain!"
else
    eval $(keychain --quick --quiet id_dsa)
fi
