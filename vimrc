set t_Co=256
set tabstop=4
set expandtab
set autoread
set nu
set hid
set hlsearch
set list
set colorcolumn=120

colorscheme jellybeans
syntax on
filetype plugin on

nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <F5> :e!<CR>

nnoremap <Tab> gt
nnoremap <S-Tab> gT

inoremap <S-Tab> <C-d>
inoremap <C-z> <Esc>ui
inoremap <C-r> <Esc><C-r>i
inoremap <C-v> <Esc>"0pi

vnoremap <C-v> "0p

nnoremap M <C-w>_<C-w>\|
nnoremap m <C-w>=
