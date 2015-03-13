set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format

"not sure if we need this to be Vundle.vim, because in my .vimrc it's just /vundle (also with no caps on the V - which is strange..)

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'haskell.vim'
Plugin 'othree/html5.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'flazz/vim-colorschemes'
Plugin 'Townk/vim-autoclose'
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'matchit.zip'


" Now we can turn our filetype functionality back on
call vundle#end()
filetype plugin indent on

"setting up the status bar with some useful information
set number ruler showcmd laststatus=2

"indentation and tabbing options
set autoindent smartindent noexpandtab tabstop=2 shiftwidth=2

"searching options
set incsearch ignorecase smartcase hlsearch showmatch

"backspace settings
set backspace=indent,eol,start

"miscellaneous settings
set shortmess=I
set wildmenu
set foldmethod=syntax

syntax on

"easier navigation of splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

"H and L are now start and end of line, respectively
nnoremap H ^
nnoremap L $

"J and K are now 1/2 page up and down, respectively
nmap <S-J> <C-D>
nmap <S-K> <C-U>

"pressing enter inserts a line below the current one without going into insert mode.
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"leader is now spacebar
let mapleader=" " 

"leader shortcuts 
"------------------
"leader rc is open vimrc file
nnoremap <leader>rc :vsp $MYVIMRC<CR>
"leader sh is open VimShell
nnoremap <leader>sh :vspl<Return>:VimShell<Return>
"leader x is same as :x 
nnoremap <leader>x :x<Return>
"leader w is same as :w
nnoremap <leader>w :w<Return>

"colorscheme and color setup

colorscheme molokai

highlight LineNr ctermfg=darkgrey

"indent-guide settings

let g:indent_guides_guide_size = 1

"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_loc_list_height = 5 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 

