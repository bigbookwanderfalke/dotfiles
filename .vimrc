
" ------------------------------------------------------------------------------
" reset vimrc autocmd group
" ------------------------------------------------------------------------------
augroup vimrc
  autocmd!
augroup END

" ------------------------------------------------------------------------------
" effective vim customize
" ------------------------------------------------------------------------------
nnoremap [vimrc] <Nop>|
nmap     <Space>v [vimrc]|
nnoremap [vimrc]e :<C-u>edit $MYVIMRC<CR>|
nnoremap [vimrc]s :<C-u>source $MYVIMRC<CR>|
nnoremap [vimrc]h :<C-u>helpgrep<Space>|

" ------------------------------------------------------------------------------
" search
" ------------------------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR><Esc>|

" ------------------------------------------------------------------------------
" display
" ------------------------------------------------------------------------------
colorscheme desert
syntax on
set showmatch
set matchpairs& matchpairs+=<:>
set matchtime=3
set nowrap
set scrolloff=4
set number
set visualbell
set list
set listchars=tab:>-,extends:<,trail:-,eol:<
set showtabline=2
highlight Pmenu ctermbg=White
highlight PmenuSel ctermbg=Green
highlight PmenuSber ctermbg=Green

" ------------------------------------------------------------------------------
" edit
" ------------------------------------------------------------------------------
set shiftround
set infercase
set hidden
set switchbuf=useopen
set backspace=indent,eol,start
set textwidth=0
set formatoptions=q
if has("unix")
  cnoremap w!! w !sudo tee % >/dev/null|
endif

" ------------------------------------------------------------------------------
" undo/backup/swap/book/hist
" ------------------------------------------------------------------------------
if has("persistent_undo")
  set undofile
  set undodir=~/.vim_undo
  if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
  endif
endif
set backupdir=~/.vim_backup
if !isdirectory(&backupdir)
  call mkdir(&backupdir, "p")
endif
set directory=~/.vim_swapfile
if !isdirectory(&directory)
  call mkdir(&directory, "p")
endif
let g:netrw_home=expand('~/')

" ------------------------------------------------------------------------------
" statusline
" ------------------------------------------------------------------------------
set laststatus=2
set statusline=[%n]
set statusline+=%<%F
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w\%=[%Y]\[%{&ff}]\[%{&fileencoding}]\[%l/%L]
set showcmd

" ------------------------------------------------------------------------------
" CJK multibyte
" ------------------------------------------------------------------------------
set ambiwidth=double

" ------------------------------------------------------------------------------
" window
" ------------------------------------------------------------------------------
set splitbelow
set splitright
nnoremap <C-h> <C-w>h|
nnoremap <C-j> <C-w>j|
nnoremap <C-k> <C-w>k|
nnoremap <C-l> <C-w>l|
nnoremap - <C-u>:split<CR>|
nnoremap <Bar> <C-u>:vsplit<CR>|

" ------------------------------------------------------------------------------
" buffer
" ------------------------------------------------------------------------------
nnoremap < :bp<CR>|
nnoremap > :bn<CR>|

" ------------------------------------------------------------------------------
" menu
" ------------------------------------------------------------------------------
set wildmenu
set wildmode=list,longest,full

" ------------------------------------------------------------------------------
" indent
" ------------------------------------------------------------------------------
set tabstop=8
autocmd vimrc FileType c          setlocal expandtab shiftwidth=4 softtabstop=4
autocmd vimrc FileType sh         setlocal expandtab shiftwidth=2 softtabstop=2
autocmd vimrc FileType awk        setlocal expandtab shiftwidth=2 softtabstop=2
autocmd vimrc FileType xml        setlocal expandtab shiftwidth=2 softtabstop=2
autocmd vimrc FileType html       setlocal expandtab shiftwidth=2 softtabstop=2
autocmd vimrc FileType python     setlocal expandtab shiftwidth=4 softtabstop=4
autocmd vimrc FileType fortran    setlocal expandtab shiftwidth=2 softtabstop=2
autocmd vimrc FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2

" ------------------------------------------------------------------------------
" menu
" ------------------------------------------------------------------------------
menu User.Buffer.BuffurList :ls<CR>
menu User.Buffer.RegisterList :dis<CR>
menu User.Buffer.HistryList :his<CR>
menu User.Buffer.MarkList :marks<CR>
menu User.Buffer.JumpList :jumps<CR>
set wildcharm=<TAB>
if has('gui')
	nmap <M-l> :emenu <TAB>
else
	nmap <ESC>l :emenu <TAB>
endif

" ------------------------------------------------------------------------------
" quickfix
" ------------------------------------------------------------------------------
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen
autocmd QuickfixCmdPost l* lopen

filetype plugin indent on
