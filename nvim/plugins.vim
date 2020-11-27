call plug#begin()

" Make vim obey editorconfig
Plug 'editorconfig/editorconfig-vim'

" Gitignore file generation
Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}

" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" UI and Color Schemes
Plug 'sjl/badwolf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Easy code commenting
Plug 'tpope/vim-commentary'
" Unix shell commands
Plug 'tpope/vim-eunuch'
" Git commands
Plug 'tpope/vim-fugitive'
" Surrounding text
Plug 'tpope/vim-surround'

" Folds
Plug 'tmhedberg/SimpylFold'

" Tagbar replacement
Plug 'liuchengxu/vista.vim'

Plug 'Yggdroot/indentLine'

" Pytest
Plug 'alfredodeza/pytest.vim'

" Emmet plugin
Plug 'mattn/emmet-vim'

" Typescript Syntax Highlighting
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

