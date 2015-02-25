set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'tpope/vim-surround'
Plugin 'msanders/snipmate.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'haskell.vim'

" Now we can turn our filetype functionality back on
filetype plugin indent on

"setting up the status bar with some useful information
set number ruler showcmd laststatus=2

"indentation and tabbing options
set autoindent smartindent expandtab tabstop=4 shiftwidth=4

"searching options
set incsearch ignorecase smartcase hlsearch showmatch

"miscellaneous settings
set shortmess=I
set lazyredraw
set wildmenu

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
colorscheme Chasing_Logic
highlight LineNr ctermfg=darkgrey

"indent-guide settings
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=darkgrey
hi IndentGuidesEven ctermbg=none
let g:indent_guides_start_level = 2

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
