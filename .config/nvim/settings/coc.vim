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
        \ 'coc-html',
        \ ]
