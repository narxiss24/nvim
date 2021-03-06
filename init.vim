call plug#begin('~/plugged')

Plug 'jalvesaq/Nvim-R', { 'branch' : 'stable' }
Plug 'itchyny/lightline.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tomasr/molokai'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'lambdalisue/vim-fullscreen'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-rooter'
Plug 'psliwka/vim-smoothie'
Plug 'narxiss24/vimcmdline', { 'branch' : 'master' }
Plug 'dense-analysis/ale'
Plug 'vim-scripts/indentpython.vim'
Plug 'tpope/vim-surround'
Plug 'stsewd/isort.nvim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'

call plug#end()

set encoding=utf-8
set number
set visualbell
set noerrorbells
set termguicolors
set background=dark
set completeopt-=preview
set completeopt+=noinsert,menuone,noselect
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=119
set expandtab
set autoindent
set fileformat=unix

colorscheme molokai

set guifont=Roboto\ Mono:h11

"Lightline settings
let g:lightline = { 'colorscheme' : 'molokai' }

let g:python3_host_prog = '~/AppData/Local/nvim/nvenv/Scripts/python.exe'

"Switch windows
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

"Adjust window size
nmap <C-=> :resize +3<CR>
nmap <C--> :resize -3<CR>

"Autocomplete settings
autocmd BufEnter * call ncm2#enable_for_buffer()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Vimcmdline settings
let cmdline_app = { 'python' : 'nv&&python' }
let cmdline_map_start = '<LocalLeader>rf'
let cmdline_map_send = '<LocalLeader>l'
let cmdline_map_send_paragraph = '<LocalLeader>pp'
let cmdline_map_source_fun = '<LocalLeader>aa'
let cmdline_map_quit = '<LocalLeader>rq'

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
let g:ale_fix_on_save = 0

let mapleader = ","
let maplocalleader = " "

nmap <leader>nn :NERDTreeToggle<CR>

"Run ALEFIx
nmap <leader>ll :ALEFix<CR>

"Run Isort
nmap <leader>li :Isort<CR>

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

"Toggle Cursorline
map <F2> :set cursorline!<CR>

set mouse=

let R_rconsole_height = 3


"Functions for pdb
func! s:SetBreakpoint()
    cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . 'import pdb; pdb.set_trace()')
endf

func! s:RemoveBreakpoint()
    exe 'silent! g/^\s*import\spdb\;\?\n*\s*pdb.set_trace()/d'
endf

func! s:ToggleBreakpoint()
    if getline('.')=~#'^\s*import\spdb' | cal s:RemoveBreakpoint() | el | cal s:SetBreakpoint() | en
endf
nnoremap <F6> :call <SID>ToggleBreakpoint()<CR>
