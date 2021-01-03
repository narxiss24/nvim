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
Plug 'davidhalter/jedi-vim'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'HansPinckaers/ncm2-jedi'
Plug 'gaalcaras/ncm-R'

call plug#end()

set number
set autoindent
set smartindent
set visualbell
set noerrorbells
set termguicolors
set background=dark

colorscheme palenight

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert

let g:python3_host_prog = '$PREFIX/bin/python3'

let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"

let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
let g:ncm2#matcher = 'substrfuzzy'
let g:ncm2_jedi#python_version = 3

let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"

let g:fullscreen#start_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 1)"
let g:fullscreen#stop_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 0)"

let mapleader = ","
let maplocalleader = " "

nmap <leader>nn :NERDTreeToggle<CR>

"Git stage, commit and push
nnoremap <leader>gp :!git add -A && git commit -m "auto-push" && git push<CR>

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
