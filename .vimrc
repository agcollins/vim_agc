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
"Plugin 'Shougo/vimshell.vim'
"Plugin 'Shougo/vimproc.vim'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'haskell.vim'
Plugin 'othree/html5.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'flazz/vim-colorschemes'
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'matchit.zip'
Plugin 'gregsexton/MatchTag'
Plugin 'scrooloose/nerdtree'
Plugin 'burnettk/vim-angular'
Plugin 'walm/jshint.vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'Shougo/unite.vim'
Plugin 'airblade/vim-gitgutter'


" Now we can turn our filetype functionality back on
call vundle#end()
filetype plugin indent on

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"leader is now comma
let mapleader="," 

map <leader>n :NERDTreeToggle<CR>

"setting up the status bar with some useful information
set number ruler showcmd laststatus=2

"indentation and tabbing options
set autoindent smartindent expandtab tabstop=2 shiftwidth=2

"the current file's directory will be the current working directory.
set autochdir

"searching options
set incsearch ignorecase smartcase hlsearch showmatch

"backspace settings
set backspace=indent,eol,start

"miscellaneous settings
set shortmess=I
set wildmenu
autocmd FileType c setlocal shiftwidth=4 tabstop=4

"easier navigation of splits
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>

"just in case i accidentally press this. they are functionally not the same
"command.
nnoremap <C-c> <Esc>

"Enable CursorLine
set cursorline

"colorscheme and color setup

colorscheme Chasing_Logic
hi Comment ctermfg=LightBlue

highlight LineNr ctermfg=darkgrey
" Default Colors for CursorLine
highlight CursorLine ctermbg=DarkBlue ctermfg=None

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=DarkGrey ctermfg=None

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=DarkBlue ctermfg=None


" <Ctrl-l> redraws the screen and removes any search highlighting. (taken from
" user Lucas on StackOverflow. Thanks!)
"nnoremap <silent> <C-L> :nohl<CR>

"substitute the word under the cursor globally
nnoremap <leader>r :%s/\<<C-r><C-w>\>/

" move vertically by visual line
nnoremap j gj
nnoremap k gk

"H and L are now start and end of line, respectively
nnoremap H ^
nnoremap L $

"pressing enter inserts a line below the current one without going into insert mode.
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>


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


"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_loc_list_height = 5 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 
let g:syntastic_javascript_checkers = ['jshint']

syntax on
