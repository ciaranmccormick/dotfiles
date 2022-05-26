" ------------- Personal Mappings --------------
" Disable arrow keys
let mapleader = ","
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" escape insert mode using jk
inoremap jk <esc>
" disable esc key to learn to use jk
inoremap <esc> <nop>
nnoremap <leader>sv :source $MYVIMRC<cr>

" execute visual selection with python
vnoremap r :w !python<CR>

" --------------- Plugin Mappings ---------------

" FZF mappings
nnoremap <silent> <leader>n :Files<CR>

" Rg mappings
nnoremap <silent> <leader>b :Rg<CR>

nnoremap <leader>fx :!xmllint --format % --output %<CR>

" Coc-snippets complete mapping
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use Q to show documentation in preview window.
nnoremap <silent> Q :call <SID>show_quickfix()<CR>
function! s:show_quickfix()
        call CocAction('doQuickfix')
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Unix commands
nmap <silent><leader>ls <Esc>:!ls %:h<CR>
