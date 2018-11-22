set t_Co=256
set tabstop=2
set expandtab
set autoread
set ai
set nu
set hid
set hlsearch
set list
set colorcolumn=120

execute pathogen#infect()

colorscheme jellybeans
syntax on
filetype plugin on

" Window Commands
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap M <C-w>_<C-w>\|
nnoremap m <C-w>=nnoremap <F5> :e!<CR>

" Function Keys
nnoremap <F2> :NERDTree<CR>
nnoremap <F6> :TestFile<CR>
nnoremap <C-F6> :TestSuite<CR>

" Tab Commands
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" Insert Commands
inoremap <S-Tab> <C-d>
inoremap <C-z> <Esc>ui
inoremap <C-r> <Esc><C-r>i
inoremap <C-v> <Esc>"0pi

" Visual Commands
vnoremap <C-v> "0p
