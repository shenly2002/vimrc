set nocompatible              " be iMproved, required

"==================================================
" Automatic installaion of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"==================================================
" Plugins,managed by vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'jstemmer/gotags'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts', { 'do': './install.sh' }
Plug 'fatih/molokai'
call plug#end()

"==================================================
" Vim settings and mappings
set autoread                              " Automatically read changed files
set autoindent                            " Enabile Autoindent
set autowrite                             " Automatically save before :next, :make etc.
set backspace=indent,eol,start            " Makes backspace key more powerful.
set incsearch                             " Shows the match while typing
set hlsearch                              " Highlight search results
set ignorecase                            " Set search/replace pattern to ignore case
set smartcase                             " Be sensitive when there's a capital letter
set noerrorbells                          " No beeps
set noswapfile                            " Don't use swapfile
set nobackup                              " Don't create annoying backup files
set ttyfast                               " Indicate fast terminal conn for faster redraw
set updatetime=100
set hidden                                " Buffer should still exist if window is closed
set backspace=2                           " Make backspace work like most other apps
set backspace=indent,eol,start            " Makes backspace key more powerful.

set encoding=utf-8                        " Set default encoding to UTF-8
set fileencodings=ucs-bom,utf-8,gb18030
set fileencoding=utf-8
set termencoding=utf-8

set showcmd                               " Show me what I'm typing
set number                                " Show line numbers
set relativenumber                        " Do relative numbering
set laststatus=2                          " Show status line always
set t_Co=256
colorscheme molokai
let g:rehash256 = 1
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1

let mapleader = ","                      " Set leader shortcut to a comma ','. Default: backslash
inoremap jk <esc>

"==================================================
" Plugins settings and mappings

" nerdtree -------------------------
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeWinSize=30
let NERDTreeIgnore=['\.pyc','\~$','\.swp']

" ctrlp -------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" vim-go -------------------------
let g:go_autodetect_gopath = 1            " Automatically modify GOPATH for certain directory structures
let g:go_list_type = "quickfix"           " Prefer to use only quickfix
let g:go_fmt_command = "goimports"        " Automatically format and rewrite import declarations
let g:go_metalinter_autosave_enabled = ['golint', 'errcheck']
let g:go_metalinter_autosave = 1          " Automatically run go vet, golint and errcheck concurrently
let g:go_metalinter_deadline = "5s"       " Cancel 'GoMetaLinter' after a given timeout.
let g:go_auto_type_info = 1               " Automatically show function signature in the status line
"let g:go_auto_sameids = 1                 " Automatically highlight matching identifiers

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Jump between errors in quickfix list
map <C-h> :cnext<CR>
map <C-l> :cprevious<CR>
nnoremap <leader>c :cclose<CR>

augroup golang
	autocmd!
	" Show by default 4 spaces for a tab
	autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
	autocmd FileType go nmap <leader>b <Plug>(go-build)
	autocmd FileType go nmap <leader>r <Plug>(go-run)
	autocmd FileType go nmap <leader>t <Plug>(go-test)
	autocmd FileType go nmap <Leader>d <Plug>(go-doc)
	autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
augroup END

" YouCompleteMe -------------------------
let g:ycm_min_num_of_chars_for_completion = 1

" ultisnips -------------------------
let g:UltiSnipsExpandTrigger="<leader>y"

" tagbar -------------------------
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=30

" gotags -------------------------
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
