set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'sickill/vim-pasta'
Plugin 'TeTrIs.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rip-rip/clang_complete'
Plugin 'mileszs/ack.vim'
Plugin 'shmup/vim-sql-syntax'
Plugin 'gnu-c'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'mbbill/undotree'

" UNUSED "

"Plugin 'scrooloose/syntastic'
"Plugin 'haskell.vim'
"Plugin 'othree/html5.vim'
"Plugin 'jelera/vim-javascript-syntax'
"Plugin 'hail2u/vim-css3-syntax'
"Plugin 'amirh/HTML-AutoCloseTag'
"Plugin 'matchit.zip'
"Plugin 'gregsexton/MatchTag'
"Plugin 'burnettk/vim-angular'
"Plugin 'walm/jshint.vim'
"Plugin 'Shutnik/jshint2.vim'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()
filetype plugin indent on

"Color settings 

set t_Co=256
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  ctermbg=white
"hi IndentGuidesEven  ctermbg=None

"when you're in these filetypes, the fold method will be set to syntax,
"allowing you to read that code that you stuffed in main() (*gulp*)

set foldmethod=indent
set foldlevelstart=20
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax

"tag options! great for large projects. vim first searches the current
"directory for a 'tags' file, then recursively searches upward until
"it hits the home directory.

set tags=./tags;$HOME

"setting up the status bar with some useful information

set number ruler showcmd laststatus=2

"indentation and tabbing options

set autoindent smartindent expandtab tabstop=4 shiftwidth=4

"lazy redraw can improve performance on toasters

set lazyredraw

"this allows you to open a file and then have the directory change to that of
"the open file. this doesn't work with something like VimShell, but I'm
"starting to favor tmux over that option anyways, as it wasn't really
"fully-featured enough to use (e.g. man pages were a disaster to open in
"VimShell).

set autochdir

"searching options

set incsearch ignorecase smartcase hlsearch showmatch

"backspace settings

set backspace=indent,eol,start


"the directory for said undo file.

"silent call mkdir("~/.vim/agc_undo", "p")
silent !mkdir ~/.vim/agc_undo > /dev/null 2>&1
set undodir=~/.vim/agc_undo

"undo file. it's pretty nice.

set undofile

"while we're at it, let's get rid of those ugly .swp files in your
"precious project directories. Everyone hates adding those to github on
"accident (because what is .gitignore, am I right, guys? ...guys?)

"silent call mkdir("~/.vim/agc_backup", "p")
silent !mkdir ~/.vim/agc_backup > /dev/null 2>&1
set backupdir=~/.vim/agc_backup

"session settings - a saved session will now save the buffers, too

set sessionoptions=buffers,tabpages

"paste mode! Look this up!
set pastetoggle=<F9>

"miscellaneous settings

set shortmess=I wildmenu 

"ctrl-p is awesome but it needs to search by filename and 
"regex  by default.

let g:ctrlp_by_filename = 1
 
"because I press control + c all the time
"and I need to stop.
"please help me

nnoremap <C-c> <Esc>

"easier navigation of splits

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"move vertically by visual line
"this is useful when you're typing everything on one line,
"such as in text files for homework writeups.

nnoremap j gj
nnoremap k gk

"I hate pressing shift for my colon commands.
"You should, too.

nnoremap ; :

"pressing enter inserts a line below the current one without going into insert mode
"and pressing \ inserts a line above the current one without going
"into insert mode
"
"normally, I would have used shift + enter instead of \ for this command, but
"it doesn't seem to work for terminal versions of vim. awesome. love it.

nnoremap <CR> o<Esc>
nnoremap \ O<Esc>

"leader is now comma
let mapleader="," 

"leader shortcuts!

nnoremap n nzz
nnoremap N Nzz
nnoremap <C-E> 10<C-E><S-M>
nnoremap <C-Y> 10<C-Y><S-M>
nnoremap <C-D> <C-D><S-M>
nnoremap <C-U> <C-U><S-M>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>/ g<C-]>
nnoremap <leader>, :AckWindow 
"leader t will open a new tab (will contain the current file)
nnoremap <leader>t :tabe %<CR>
"leader tab will go to the next tab
nnoremap <leader><Tab> :tabn<CR>
"leader rc is open vimrc file
nnoremap <leader>rc :e $MYVIMRC<CR>
"leader x is same as :x 
nnoremap <leader>x :x<Return>
"leader z saves your current session to ~/agc_session.vim,
"and writes and quits all buffers.
"open this session with the 'vims' alias, as mentioned in my README file. 
nnoremap <leader>z :mksession! ~/.vim/agc_session.vim<Return>:xa<Return>
"leader w is same as :w
nnoremap <leader>w :w<Return>
"leader r is replace all
nnoremap <leader>r :%s/\<<C-r><C-w>\>/
"one of the best leader commands in large directories where you don't know
"filenames -- NERDTree!
map <leader>n :NERDTreeToggle<CR>
"If you're using syntastic but there's not any reason to use it ...sigh...
"map <leader>s :SyntasticToggleMode<CR>

"syntastic settings

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_loc_list_height = 5 
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0 
"let g:syntastic_javascript_checkers = ['jshint']

"something something something

"hi IndentGuidesEven ctermbg=None
