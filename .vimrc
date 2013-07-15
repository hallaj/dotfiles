" Hallaj's .vimrc
" https://github.com/hallaj/dotfiles

" vim auto-commands
autocmd BufWritePre * :%s/\s\+$//e

" base configurations
filetype indent plugin on

set history=80
set ignorecase
set ruler
set smartcase

" use 4 spaces to replace tabs by default
set expandtab
set shiftwidth=4
set softtabstop=4

syntax enable

" I'm using pathogen, so what?
execute pathogen#infect()

" syntastic (https://github.com/scrooloose/syntastic)
let g:syntastic_python_checkers=['flake8']
let g:syntastic_check_on_wq=1

" snippets
let g:snippets_dir = $HOME . "/.vim/snippets"

" NERDTree
" autoclose if NERDTree is the only one left
" taken from https://github.com/scrooloose/nerdtree/issues/21#issuecomment-3348390
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" vim-solarized (https://github.com/altercation/vim-colors-solarized)
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" devbox-dark-256 (https://github.com/vim-scripts/devbox-dark-256)
"set t_Co=256
"set background=dark
"colorscheme devbox-dark-256
