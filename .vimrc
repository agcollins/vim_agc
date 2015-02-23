set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/Vundle.vim'

"not sure if we need this to be Vundle.vim, because in my .vimrc it's just /vundle (also with no caps on the V - which is strange..)

" We could also add repositories with a ".git" extension

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site

Plugin 'tpope/vim-surround'
Plugin 'msanders/snipmate.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'

" Now we can turn our filetype functionality back on
filetype plugin indent on

set ic
set tabstop=4
set showcmd
set number
set shiftwidth=4
set tabstop=4
set noexpandtab
set background=dark
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
colorscheme elflord   
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_loc_list_height = 5 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
highlight LineNr ctermfg=darkgrey
