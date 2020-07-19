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
'

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

" Fold XML files
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

