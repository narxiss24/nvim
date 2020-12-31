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

call plug#end()

set number
set autoindent
set smartindent
set visualbell
set noerrorbells
set termguicolors
set background=dark

colorscheme palenight

set completeopt-=preview
set completeopt+=menuone,noselect

let g:jedi#popup_on_dot = 0
let g:mucomplete#enable_auto_at_startup = 1

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
