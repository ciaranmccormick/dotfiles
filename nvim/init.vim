source ~/.config/nvim/plugins.vim
source ~/.config/nvim/mappings.vim

" Show line numbers and make relative
set number
set relativenumber
set numberwidth=2
set tabstop=4
set softtabstop=4
set expandtab
syntax enable
colorscheme badwolf
let g:airline_theme = 'badwolf'

" set python version
"let g:python3_host_prog = '/home/ciaran/.pyenv/versions/neovimpy/bin/python'
let g:python3_host_prog = '~/.pyenv/versions/3.6.9/bin/python3.6'
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Disables the searching for env on the airline
let g:airline#extensions#coc#enabled ='0'
let g:airline_section_c= '%<%t%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#%#__accent_bold#%#__restore__#'
" remove the file encoding section
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" customize file location section
let g:airline_section_z = "%l/%L col:%c"
" remove separators for empty sections
let g:airline_skip_empty_sections = 1

let g:airline#extensions#fugitiveline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#format = 2

" Neomake allows plugins like Syntastic work asynchronously
" When writing a buffer no delay, and when on normal mode changes afer delay
" call neomake#configure#automake('nw', 750)

" For coc: TextEdit might fail if hidden is not set.
set hidden
" For coc: Some  language servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" For coc: Give more space for displaying messages.
set cmdheight=2
" updatetime dictates how long vim waits before triggering plugins.
" The vim default is 4000ms, 300ms is recommended by coc pages
set updatetime=300

" This option allows you to specify short messages in vim
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" This is the little strip down the left hand side of the window
set signcolumn=yes

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" So that the coc-git gutter refreshed automatically
autocmd CursorHold * CocCommand git.refresh

" Fold XML files
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Coc extensions
let g:coc_global_extensions = [
        \ 'coc-pyright',
        \ 'coc-git',
        \ 'coc-snippets',
        \ 'coc-markdownlint', 
        \ 'coc-actions', 
        \ 'coc-tsserver',
        \ 'coc-json',
        \ 'coc-prettier',
        \ ]

" SimpylFold settings
let g:SimpylFold_fold_import = 0

" Setup Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" identLine.vim plugin
let g:indentLine_setConceal = 0
