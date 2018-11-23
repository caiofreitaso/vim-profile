set t_Co=256
set tabstop=2
set expandtab
set autoread
set ai
set nu
set hid
set hlsearch!
set list
set colorcolumn=120

" VARIABLES: syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" VARIABLES: vimcaps
let g:vimcaps_status_style = 'short'
let g:vimcaps_status_separator = ''
let g:vimcaps_disable_autocmd = 1

" VARIABLES: airline
let g:NERDTreeStatusline = 'NERDTree'
let g:airline_powerline_fonts = 0
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = '║'
let g:airline_right_sep = '║'
let g:airline_symbols = {}
let g:airline_symbols.paste = 'paste'
let g:airline_extensions = ['branch', 'fugitiveline', 'hunks', 'keymap', 'quickfix', 'syntastic', 'whitespace']

function! LockStatusLine()
  return vimcaps#statusline(7)
endfunction
function! DayMonth()
  return strftime("%d/%b")
endfunction
function! Hour()
  return strftime("%R")
endfunction
function! Encoding()
  return &fileencoding
endfunction
function! FileFormat()
  return &ff
endfunction

function! AirlineInit()
  call airline#parts#define_function('lockstatus', 'LockStatusLine')
  call airline#parts#define_function('day', 'DayMonth')
  call airline#parts#define_function('hour', 'Hour')
  call airline#parts#define_function('enc', 'Encoding')
  call airline#parts#define_function('ff', 'FileFormat')

  call airline#parts#define_minwidth('hour', 60)
  call airline#parts#define_minwidth('ff', 60)
  call airline#parts#define_minwidth('paste', 80)
  call airline#parts#define_minwidth('branch', 80)
  call airline#parts#define_minwidth('filetype', 80)
  call airline#parts#define_minwidth('day', 120)
  call airline#parts#define_minwidth('lockstatus', 120)
  call airline#parts#define_minwidth('enc', 120)
  call airline#parts#define_minwidth('hunks', 160)

  call airline#parts#define_accent('hour', 'bold')
  call airline#parts#define_accent('filetype', 'bold')

  let g:airline_section_a = airline#section#create_left(['mode', 'paste', 'lockstatus'])
  let g:airline_section_b = airline#section#create_left(['day', 'hour'])
  let g:airline_section_x = airline#section#create(['hunks', 'branch', 'tagbar', 'gutentags', 'grepper'])
  let g:airline_section_y = airline#section#create_right(['filetype', 'ff', 'enc'])
  let g:airline_section_z = airline#section#create_right(['☰ %p%%','%l:%v'])
  AirlineRefresh
endfunction
autocmd VimEnter * call AirlineInit()

" VIM preferences
colorscheme jellybeans
syntax on
filetype plugin on

" Window Commands
"" Move
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
"" Size
nnoremap <C-M> <C-w>_
nnoremap M <C-w>_<C-w>\|
nnoremap m <C-w>=

" Function Keys
"" Editor
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :let @/ = ""<CR>
nnoremap <F5> :e!<CR>
"" Test
nnoremap <F6> :TestFile<CR>
nnoremap <C-F6> :TestSuite<CR>

" Tab Commands
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" Graphic Editor Commands
inoremap <S-Tab> <C-d>
inoremap <C-z> <Esc>ui
inoremap <C-r> <Esc><C-r>i
inoremap <C-v> <Esc>"0pi

        " Edit Commands
vnoremap <C-v> "0p

execute pathogen#infect()
