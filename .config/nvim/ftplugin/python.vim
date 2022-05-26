nnoremap <leader>f8 :!poetry run flake8 %<CR>
nnoremap <leader>fb :!poetry run black %<CR>
nnoremap <leader>ff :!poetry run black %<CR>
nnoremap <leader>ff :!poetry run blue %<CR>
nnoremap <leader>fs :!poetry run isort %<CR>
nnoremap <leader>fm :!poetry run mypy %<CR>

" Pytest
nmap <silent><leader>ta <Esc>:Pytest file<CR>
nmap <silent><leader>tc <Esc>:Pytest class<CR>
nmap <silent><leader>tf <Esc>:Pytest function<CR>
nmap <silent><leader>tm <Esc>:Pytest method<CR>
nmap <silent><leader>tp <Esc>:Pytest project<CR>
