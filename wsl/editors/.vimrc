set background=dark
colors zenburn "Load the color scheme
set nocompatible

set guifont=Monospace\ 12
set colorcolumn=80 "Draw line at 80 columns

let maplocalleader=","

execute pathogen#infect()
filetype indent plugin on
syntax on "Syntax highlighting

"Make latex fast again
au FileType tex setlocal nocursorline

set number "Show line numbers
set wildmenu "Complete Vim commands
set cursorline "Highlight the cursor line

set lazyredraw
set tabstop=4 shiftwidth=4 expandtab "Tabs -> 4 spaces

"Search tweaks
set incsearch "Search before pressing enter, incremental search
set ignorecase smartcase "Ignore case when searching, unless capital letters are used

set linebreak "Only break at words

"Open file explorer
nmap - :Explore<Enter>

"Tab keymaps
nmap tt :tabnew<Enter>
nmap t<Left> :tabprevious<Enter>
nmap t<Right> :tabnext<Enter>
nmap tq :tabclose<Enter>

"Move in wrapped lines
nmap <Up> gk
nmap <Down> gj
imap <Up> <C-o>gk
imap <Down> <C-o>gj

"Place regular tab
imap <S-Tab> <C-V><Tab>

"set listchars=eol:¶,tab:>-,trail:·,extends:>,precedes:<,space:·
"set list

"hi GroupA cterm=LightGray ctermbg=LightGray ctermfg=LightGray guibg=LightGray
"hi GroupB cterm=LightGray ctermbg=LightGray ctermfg=LightGray guibg=LightGray
"match GroupA / \+$/
"match GroupB /\t/
"hi Specialkey ctermfg=LightGray
"match Specialkey /\s\+$/