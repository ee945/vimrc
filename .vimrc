""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc for ee945
"
" script list:
" molokai(theme)    : http://www.vim.org/scripts/script.php?script_id=2340
" minibufexpl       : http://www.vim.org/scripts/script.php?script_id=159
" NERD Commenter    : http://www.vim.org/scripts/script.php?script_id=1218
" NERD tree         : http://www.vim.org/scripts/script.php?script_id=1658
" snipMate          : http://www.vim.org/scripts/script.php?script_id=2540
" SuperTab          : http://www.vim.org/scripts/script.php?script_id=1643
" taglist           : http://www.vim.org/scripts/script.php?script_id=273
"
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Setting
""""""""""""""""""""""""""""""""""""""""""""""""""
set history=1000
set helplang=cn
set nocompatible
set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM UI
""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=3
set wildmenu
set wildignore=*.o,*~,*.pyc,*.bak
set ruler
set cmdheight=2
set hidden
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set matchtime=2
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500
set mouse=a
set laststatus=2
set nrformats=octal,hex
set number

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
syntax on
filetype plugin on
filetype indent on
set guifont=Monaco:h12,Consolas:h12
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%N\ %t
endif
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,default,latin1
set fileformats=unix,dos,mac

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowritebackup
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set linebreak
set textwidth=500
set autoindent
set smartindent
set copyindent
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin etc. 
""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme molokai
set tags=./tags,./TAGS,tags;~,TAGS;~
let Tlist_Show_One_File=1
let TList_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=24
let NERDTreeWinSize=24
let g:miniBufExplMapWindowNavVim=1

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""

" General map head
noremap , ;
map <F1> :tabnew<CR>
imap <F1> <ESC>:tabnew<CR>a

" Leader map
let mapleader = ";"
let g:mapleader = ";"
" no highlight
nmap <leader>; :nohls<CR>
" select all
nmap <leader>a ggVG
" quick html tag
imap <leader>h ><ESC>bi<<ESC>ya<eepbi/<LEFT><LEFT>
" quick format {} for programming
imap <leader>{ {}<LEFT><CR><CR><ESC>ka<TAB>
" quick html5 sample doc
noremap <leader>html a<!DOCTYPE html><CR><html><CR><head lang="zh-cn"><CR><TAB><meta charset="utf-8"><CR><title></title><CR><BS></head><CR><body><CR><CR></body><CR></html><ESC>kkkkkf>a
" quick php sample doc
noremap <leader>php a<?php<CR><CR>?><ESC>ka

" Fast move map
map j gj
map k gk
imap <C-j> <DOWN>
imap <C-k> <UP>
imap <C-h> <LEFT>
imap <C-l> <RIGHT>
nmap <S-UP> ddkP
nmap <S-DOWN> ddp

" Plugin map
map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
imap <F2> <ESC>:NERDTreeToggle<CR>a
imap <F3> <ESC>:TlistToggle<CR>a

" Function map
vnoremap * :call VisualSelection('f')<CR>
vnoremap # :call VisualSelection('b')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setting
""""""""""""""""""""""""""""""""""""""""""""""""""
language messages zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd! bufwritepost .vimrc source %

""""""""""""""""""""""""""""""""""""""""""""""""""
" => function
""""""""""""""""""""""""""""""""""""""""""""""""""
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimrc End
""""""""""""""""""""""""""""""""""""""""""""""""""
