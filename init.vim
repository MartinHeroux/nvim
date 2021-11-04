call plug#begin('~/.vim/plugged')

Plug 'rakr/vim-one'
Plug 'psf/black' 
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'KKPMW/vim-sendtowindow'        " <space>l to send right window or <space>j to send down
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'itchyny/lightline.vim'
"Plug 'ap/vim-buftabline'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'            " A start menu for vim
Plug 'yuttie/comfortable-motion.vim'
Plug 'ncm2/ncm2'                     " completion [dep]: nvim-0.2.2, nvim-yarp, python3
Plug 'roxma/nvim-yarp'               " remote plugin framework required for ncm2
Plug 'ncm2/ncm2-bufword'             " complete words in buffer
Plug 'ncm2/ncm2-path'                " complete paths
Plug 'ncm2/ncm2-jedi'                " Python completion
Plug 'fisadev/vim-isort'             " Python sort imports [dep]: pip3 install isort
Plug 'filipekiss/ncm2-look.vim'      " ncm2 spelling
Plug 'SirVer/ultisnips'              " hotkeys for chunks of code
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Finder
Plug 'junegunn/fzf.vim'              " Fuzzy Finder
call plug#end()

let mapleader = "'"
" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" ---FZF
nmap <leader>f :Files<space>

" ncm2-loom
let g:ncm2_look_enabled = 0

" ---GIT GUTTER
let g:gitgutter_async=0

" ---CTAGS & TAGBAR - requires universal ctags from https://ctags.io/
let g:tagbar_ctags_bin='/home/martin/ctags/ctags'
map <leader>t :TagbarToggle<CR>

" lightline 
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


" ncm2 
autocmd BufEnter * call ncm2#enable_for_buffer()      " enable ncm2 for all buffers
set completeopt=noinsert,menuone,noselect             " IMPORTANT: :help Ncm2PopupOpen for more information
let g:python3_host_prog='/home/martin/anaconda3/bin/python'            " ncm2-jedi

let NERDTreeIgnore = ['\.pyc$']  " ignore pyc files

"easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap <leader>s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" Remove divider between windows
set fillchars+=vert:\ 

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" Window Splits
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Start terminals for Python sessions '\tp'
map <Leader>tp :new term://bash<CR>iipython<CR><C-\><C-n><C-w>k
tnoremap jk <C-\><C-n>

" turn on spelling and make a spell file
set spelllang=en_au

" python alias (,p runs python on script. ,t times python script)
nmap <leader>p :w<CR>:!python3 %<CR>

" startify
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   Recent']            },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" vim-isort 
let g:vim_isort_map = '<C-i>'

"--- THEME ---
colorscheme one
nmap <leader>dd :set background=dark<CR>
nmap <leader>ll :set background=light<CR>
let g:airline_theme='one'
set termguicolors

" ---SPELLCHECK
nmap <leader>sp :setlocal spell spelllang=en_au<CR>
nmap <leader>so :set nospell<CR>

filetype plugin indent on
set encoding=utf-8
set number 
set relativenumber
syntax on
set updatetime=100
set noswapfile
set scrolloff=7
set hidden 		" switch between buffers without saving
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
nmap <leader>g :NERDTreeToggle<CR>

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <leader>3 :bd<CR>
inoremap jk <ESC>
nmap ss i<space><ESC>
nmap aa o<ESC>
nmap ff lxi<CR><ESC>
nmap FF hxi<CR><ESC>
set hls is
nmap <silent> <CR> :nohl<CR><C-l>
"nnoremap ; :
"--- Zotero ---
" Add zotero keys to dictionary 
set dictionary+=~/Dropbox/zotero_keys.txt

" resize splits 
nmap <leader>= :vertical resize +10<CR>
nmap <leader>- :vertical resize -10<CR>
nmap <leader>_ :resize -10<CR>
nmap <leader>+ :resize +10<CR>
" reload .vimrc in current session
:nmap vc :so $MYVIMRC<CR>
