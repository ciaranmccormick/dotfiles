let g:airline_theme = 'badwolf'
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
