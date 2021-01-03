call plug#begin('~/plugged')

Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'itchyny/lightline.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tomasr/molokai'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'lambdalisue/vim-fullscreen'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-rooter'
Plug 'psliwka/vim-smoothie'
Plug 'lifepillar/vim-mucomplete'
Plug 'davidhalter/jedi-vim'
Plug 'jalvesaq/vimcmdline'
Plug 'dense-analysis/ale'

call plug#end()

set number
set autoindent
set smartindent
set visualbell
set noerrorbells
set termguicolors
set background=dark
set completeopt-=preview
set completeopt+=menuone,noselect

colorscheme palenight

let g:python3_host_prog = '~/AppData/Local/nvim/nvenv/Scripts/python.exe'

"Autocomplete settings
let g:mucomplete#enable_auto_at_startup = 1
let g:jedi#auto_initialization = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#completions_enabled = 0

"Lightline settings
let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"

"Fulscreen in nvim-qt
let g:fullscreen#start_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 1)"
let g:fullscreen#stop_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 0)"

"Ale linting
let g:ale_sign_column_always=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_text_changed='always'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %s [%severity%]: [%...code...%]'
let g:ale_linters={'python': ['flake8']}
let g:ale_fixers={'python': ['black']}
let g:ale_fix_on_save = 1

let mapleader = ","
let maplocalleader = " "

nmap <leader>nn :NERDTreeToggle<CR>

"Git stage, commit and push
nnoremap <leader>gp :!git add -A && git commit -m "auto-push" && git push --force<CR>

"<CR> or <S-CR> to create empty line above or below
nnoremap <CR> <S-a><CR><Esc>
nnoremap <S-CR> <S-o><Esc>

"Use ALT to move line up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set mouse=

let R_rconsole_height = 3
