call plug#begin('~/plugged')

Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'itchyny/lightline.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tomasr/molokai'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'lambdalisue/vim-fullscreen'
Plug 'jiangmiao/auto-pairs'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'

call plug#end()

set number
set autoindent
set smartindent
set background=dark
set termguicolors
colorscheme palenight

let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"

let g:fullscreen#start_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 1)"
let g:fullscreen#stop_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 0)"

let mapleader = " "
let maplocalleader = " "

"Register autocompletion
call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
\ 'name': 'omni',
\ 'allowlist': ['*'],
\ 'blocklist': ['c', 'cpp', 'html'],
\ 'completor': function('asyncomplete#sources#omni#completor'),
\ 'config': {
\   'show_source_kind': 1
\ }
\ }))

nmap <leader>nn :NERDTreeToggle<CR>

"<S-space> for suggestions in insert mode
inoremap <S-tab> <C-X><C-O>
inoremap <S-K> <Up>
inoremap <S-J> <Down>

"<C-/> to toggle comment
nmap <C-/> <space>c<space>

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
