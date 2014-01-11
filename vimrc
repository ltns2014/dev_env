set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'Valloric/YouCompleteMe'
Bundle 'chriskempson/base16-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/syntastic'
Bundle 'groenewege/vim-less'
Bundle 'gorodinskiy/vim-coloresque'

syntax on
filetype plugin indent on

" tabstop settings
set expandtab
autocmd BufRead * set tabstop=4 | set softtabstop=4 | set shiftwidth=4
autocmd BufRead *.html set tabstop=2 | set softtabstop=2 | set shiftwidth=2

" auto read when a file is changed from the outside
set autoread

" :W sudo saves the file
" (useful for handling the permission-denied error)
comman W w !sudo tee % > /dev/null

" set 10 lines to the cursor when moving vertically
set scrolloff=10

" configure backspace so it acts as it should
set backspace=eol,start,indent

" don't redraw while executing macros
set lazyredraw

" for regular expressions turn magic on
set magic

" press F5 to run shell
map <F5> <ESC>:shell<CR>

" search
set hlsearch
set incsearch
set ignorecase
map <C-n> <ESC>:nohlsearch<CR>

" show matching brachets when text indicator is over them
set showmatch
set matchtime=2

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" turn backup off
set nobackup
set nowb
set noswapfile

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" ============================================================
" colorscheme
set background=dark
set t_Co=256
set number
set cursorline
set foldcolumn=1
set cmdheight=2
let base16colorspace=256
"colorscheme Tomorrow-Night-Bright
colorscheme base16-default

" ============================================================
" airline
set laststatus=2
let g:airline_theme='tomorrow'

" ============================================================
" nerdtree
map <F3> <ESC>:NERDTreeToggle<CR>

" ============================================================
" tagbar
map <F4> <ESC>:TagbarToggle<CR>

" ============================================================
" you-complete-me
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" ============================================================
" ultisnips
"let g:UltiSnipsUsePythonVersion = 2
"let g:UltiSnipsExpandTrigger = '<C-m>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
