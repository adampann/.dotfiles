  
"change the leader key to <space>
let mapleader = "\<Space>" 
" let g:ale_disable_lsp = 1

"plug installation --------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } } "Testing plugin
" all hail all that is tpope
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
" THEMES
Plug 'gruvbox-community/gruvbox'

Plug 'mbbill/undotree'
"FZF
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
"Plug 'yuki-ycino/fzf-preview.vim', { 'do': ':FzfPreviewInstall' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
" Plugins I'm testing & don't know what they give me yet
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

" I don't know if I'm using these
Plug 'sheerun/vim-polyglot'
" Plug 'AndrewRadev/linediff.vim'

call plug#end()


set pyxversion=3
set pyx=3

set scrolloff=5         " keep 3 lines when scrolling"
set colorcolumn=80
"SEARCH ----------------------------------------------------
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight (backwards slash and space)
nnoremap <leader>, :nohlsearch<CR>

"leader mappings
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>w :w<CR>
nmap <leader>u :UndotreeShow<CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ps :Rg<SPACE>

"basic vim commands
set hidden
set undodir=~/.vim/undotree
set undofile
set nobackup
set nowritebackup
set noswapfile

set nu rnu                   " display hybrid line number

set tabstop=4                " number of visual spaces per TAB
set softtabstop=4            " number of spaces in tab when editing

set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
" syntax on
"make side carrot indent right a way
nnoremap < <<
nnoremap > >>
"MOVEMENT
"move vertically by visual line
nnoremap j gj
nnoremap k gk

set noshowmode

"open splits below and right
set splitbelow
set splitright
set diffopt=vertical
set mouse=a

"color theme
syntax enable
" trying to turn TS hightlighting on
lua require'nvim-treesitter.configs'.setup { hightlight = {enable = true } }

" from the primes init.vim
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
set background=dark

"---------------------------------------   Vim fugitive ------------
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gb :Git blame<CR>


"NERDtree commands & settings
nnoremap <leader>n :NERDTreeToggle<CR>
noremap <Leader>f :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let g:NERDTreeUpdateOnCursorHold = 0
let g:NERDTreeGitStatusUpdateOnWrite = 0
let NERDTreeShowLineNumbers=1


"vim airline
let g:airlineextensions#tabline#enabled = 1
map <leader>b :bn<CR>
map <leader>B :bp<CR>


filetype plugin indent on
"when indenting with '>', use 4 spaces width
" set shiftwidth=4
"on pressing tab, insert 4 spaces
" set expandtab

"change how long vim waits to switch from insert to command
"after hitting esc vim was taking 3ish sec to switch
set ttimeoutlen=5

if executable('rg')
    let g:rg_derive_root='true'
endif

"FZF commands
"----------------------------------------------------------------------------
nnoremap <C-p> :Files<Cr>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :BLines<CR>
let g:ag_working_path_mode="r"
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
" let g:fzf_preview_window = 'top:60%
"
" floating window size ratio
let g:fzf_preview_floating_window_rate = 0.9
let g:fzf_preview_command = 'bat --color=always --style=grid {-1}' " Installed bat
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


"coc commands

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" o2ther plugin before putting this into your config.

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#pum#next(1):
\ <SID>check_back_space() ? "\<Tab>" :
\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <CR> to confirm completion, use: >
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"Vim-doge
let g:doge_doc_standard_python = 'google'

" coc-clangd
nnoremap <silent> <A-o> :CocCommand clangd.switchSourceHeader<cr>
