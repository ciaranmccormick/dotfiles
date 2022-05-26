source ~/.config/nvim/plugins.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/settings/airline.vim
source ~/.config/nvim/settings/coc.vim

syntax enable
colorscheme badwolf

" Show line numbers and make relative
set number
set relativenumber
set numberwidth=2
set tabstop=4
set softtabstop=4
set expandtab
set spell spelllang=en_gb
set clipboard=unnamedplus

" set python version
let g:python3_host_prog = '~/.pyenv/versions/nvimenv/bin/python3'

" Fold XML files
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" SimpylFold settings
let g:SimpylFold_fold_import = 0

" Setup Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" identLine.vim plugin
let g:indentLine_setConceal = 0

augroup XSD
    autocmd!
    autocmd FileType xsd setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END
