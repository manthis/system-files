set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'klen/python-mode'

" To install vundle use the following command
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jmcantrell/vim-virtualenv'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable syntax coloration
syntax on

" Enable search highlightning
set hlsearch

" Enable folding with the spacebar
nnoremap <space> za
let python_highlight_all=1
let g:SimpylFold_docstring_preview=1

" PEP8 options (syntastic does check the syntax in real time while pymode does
" it on save)
let g:syntastic_python_checkers=["flake8"]
let g:syntastic_python_flake8_args="--ignore=E501"
let g:pymode_lint_ignore="E501"

" Airline
set t_Co=256
set laststatus=2
let g:airline_theme='dark'

" Jedi-vim
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = 1
let g:jedi#completions_enabled = 1
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>a"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<Tab>"
let g:jedi#rename_command = "<leader>r"

" Disable Preview during auto-completion
autocmd FileType python setlocal completeopt-=preview

" We enable the different options depending on the file type
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=140 nu expandtab autoindent fileformat=unix encoding=utf-8
au BufNewFile,BufRead *.sh set tabstop=4 softtabstop=4 shiftwidth=4 nu expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.js set tabstop=2 softtabstop=2 shiftwidth=2 nu
au BufNewFile,BufRead *.html set tabstop=2 softtabstop=2 shiftwidth=2 nu
au BufNewFile,BufRead *.css set tabstop=2 softtabstop=2 shiftwidth=2 nu

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>

" Parcel.js
set backupcopy=yes

