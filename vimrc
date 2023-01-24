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
set splitbelow
set previewheight=5

set gfn=Fixed\ 9

" VARIABLES: SuperTab
let g:SuperTabClosePreviewOnPopupClose = 1

" VARIABLES: indentline
let g:indentLine_char = '┆'
let g:indentLine_maxLines = 9000

" VARIABLES: ConqueGdb
let g:ConqueGdb_EnableMapping = 0

" VARIABLES: surround
let g:surround_no_mappings = 1

" VARIABLES: NERDTree
let g:NERDTreeNaturalSort = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeStatusline = '[%{b:NERDTreeRoot.path.str()}]'

" VARIABLES: syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_error_symbol = "━→"
let g:syntastic_warning_symbol = "┉⇢"
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_cs_checkers = ['code_checker']

" VARIABLES: OmniSharp
let g:OmniSharp_highlight_types = 1
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_timeout = 10
let g:OmniSharp_server_use_net6 = 1

" VARIABLES: vimcaps
let g:vimcaps_status_style = 'short'
let g:vimcaps_status_separator = ''
let g:vimcaps_disable_autocmd = 1

" VARIABLES: airline
let g:airline_powerline_fonts = 0
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = '║'
let g:airline_right_sep = '║'
"let g:airline_left_alt_sep = '║'
"let g:airline_right_alt_sep = '║'
let g:airline_symbols = {}
let g:airline_symbols.paste = 'paste'
let g:airline_extensions = ['branch', 'fugitiveline', 'hunks', 'keymap', 'quickfix', 'syntastic', 'whitespace']

" function! LockStatusLine()
"   return vimcaps#statusline(7)
" endfunction
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
function! LineColumn()
  return line(".").':'.col(".")
endfunction
function! Percent()
  let byte = line2byte( line(".") ) + col(".") - 1
  let size = (line2byte( line("$") + 1 ) - 1)
  return ((byte * 100) / size).'%'
endfunction

function! AirlineInit()
  " call airline#parts#define_function('lockstatus', 'LockStatusLine')
  call airline#parts#define_function('day', 'DayMonth')
  call airline#parts#define_function('hour', 'Hour')
  call airline#parts#define_function('enc', 'Encoding')
  call airline#parts#define_function('ff', 'FileFormat')
  call airline#parts#define_function('linecol', 'LineColumn')
  call airline#parts#define_function('perc', 'Percent')

  call airline#parts#define_minwidth('hour', 60)
  call airline#parts#define_minwidth('ff', 60)
  call airline#parts#define_minwidth('paste', 80)
  call airline#parts#define_minwidth('branch', 80)
  call airline#parts#define_minwidth('filetype', 80)
  call airline#parts#define_minwidth('day', 120)
  call airline#parts#define_minwidth('lockstatus', 120)
  call airline#parts#define_minwidth('enc', 120)
  call airline#parts#define_minwidth('perc', 120)
  call airline#parts#define_minwidth('hunks', 160)

  call airline#parts#define_accent('hour', 'bold')
  call airline#parts#define_accent('filetype', 'bold')

  let g:airline_section_a = airline#section#create_left(['mode', 'paste'])
  let g:airline_section_b = airline#section#create_left(['day', 'hour'])
  let g:airline_section_x = airline#section#create(['hunks', 'branch', 'tagbar', 'gutentags', 'grepper'])
  let g:airline_section_y = airline#section#create_right(['filetype', 'ff', 'enc'])
  let g:airline_section_z = airline#section#create_right(['☰ ','perc','linecol'])
  AirlineRefresh
endfunction
function! IndentInit()
  IndentLinesReset 2
endfunction

autocmd VimEnter * call IndentInit()
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

"" ConqueGDB
nnoremap <F7> :ConqueGdbCommand c<CR>
" nnoremap <F8> :execute 'ConqueGdbCommand b '.expand('%:t').':'.line(".")<CR>
nnoremap <F10> :ConqueGdbCommand n<CR>
nnoremap <F11> :ConqueGdbCommand s<CR>

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

" ConqueGdb Commands
nnoremap gq :ConqueGdbCommand q<CR>
nnoremap gr :ConqueGdbCommand r<CR>
nnoremap gc :ConqueGdbCommand c<CR>
nnoremap gn :ConqueGdbCommand n<CR>
nnoremap gs :ConqueGdbCommand s<CR>
nnoremap gf :ConqueGdbCommand f<CR>
nnoremap <expr> gbd ':ConqueGdbCommand d '
nnoremap gbb :execute 'ConqueGdbCommand b '.expand('%:t').':'.line(".")<CR>
nnoremap gbt :ConqueGdbCommand bt<CR>
nnoremap gd :ConqueGdbCommand disp<CR>
nnoremap gdd :execute 'ConqueGdbCommand disp '.expand("<cword>")<CR>

" surround Commands
nnoremap ds <Plug>Dsurround
nnoremap dS <Plug>Dsurround
nnoremap cs <Plug>Csurround
nnoremap cS <Plug>Csurround
nnoremap ys <Plug>Ysurround
nnoremap yS <Plug>Ysurround
nnoremap yss <Plug>Yssurround
nnoremap ySs <Plug>Yssurround
nnoremap ysS <Plug>Yssurround
nnoremap ySS <Plug>Yssurround
vnoremap ys <Plug>VSurround
vnoremap yS <Plug>VSurround
inoremap <C-g>s <Plug>Isurround
inoremap <C-g>S <Plug>Isurround

" OmniSharp Commands
augroup omnisharp_commands
  autocmd!

  autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
"  autocmd CursorHold *.cs call OmniSharp#actions#documentation#TypeLookup()

  autocmd FileType cs nnoremap <buffer> od :OmniSharpGotoDefinition<CR>
  autocmd FileType cs nnoremap <buffer> ofi :OmniSharpFindImplementations<CR>
  autocmd FileType cs nnoremap <buffer> ofs :OmniSharpFindSymbol<CR>
  autocmd FileType cs nnoremap <buffer> ofu :OmniSharpFindUsages<CR>
  autocmd FileType cs nnoremap <buffer> oa :OmniSharpGetCodeActions<CR>
  autocmd FileType cs nnoremap <buffer> ox :OmniSharpFixUsings<CR>
  autocmd FileType cs nnoremap <buffer> ot :OmniSharpTypeLookup<CR>
  autocmd FileType cs nnoremap <buffer> odc :OmniSharpDocumentation<CR>
  autocmd FileType cs nnoremap <buffer> oh :OmniSharpSignatureHelp<CR>
  autocmd FileType cs nnoremap <buffer> <C-r><C-r> :OmniSharpRename<CR>
  autocmd FileType cs nnoremap <buffer> otd :OmniSharpDebugTest<CR>
  autocmd FileType cs nnoremap <buffer> otr :OmniSharpRunTest<CR>
augroup END

execute pathogen#infect()
