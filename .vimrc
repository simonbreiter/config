set shell=/bin/bash

" ===== DEIN PLUGIN MANAGER =====
if &compatible
  set nocompatible
endif
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')

  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('junegunn/goyo.vim')
  call dein#add('junegunn/limelight.vim')
  call dein#add('sjl/gundo.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('kien/ctrlp.vim')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('mattn/emmet-vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('Valloric/MatchTagAlways')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('pangloss/vim-javascript')
  call dein#add('carlitux/deoplete-ternjs')
  call dein#add('ternjs/tern_for_vim')
  call dein#add('metakirby5/codi.vim')
  call dein#add('ledger/vim-ledger')
  call dein#add('w0rp/ale')
  call dein#add('mxw/vim-jsx')
  call dein#add('tmux-plugins/vim-tmux-focus-events')
  call dein#add('mustache/vim-mustache-handlebars')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" ====== COLORSCHEME =======
colorscheme Tomorrow-Night 

" ======= SETTINGS =======

" if scrolling is slow, try this:
" set synmaxcol=128 " Syntax coloring lines that are too long just slows donwn the world
" set ttyfast              " fast terminal
" set ttyscroll=3          "  ?
" set lazyredraw           " Wait to redraw, to avoid scrolling problems

" Minimal style
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256
let html_no_rendering=1 " Don't render italic, bold, links in HTML

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.

set t_Co=256
set hidden 		          " Fix buffer
set history=1000	      " Longer history
set title		            " Shows title in session
set backspace=indent,eol,start		" Intuitive backspace in in insert mode
set hlsearch            " Highlight search terms...
set incsearch           " ...dynamically as they are typed.
" set shortmess=atI	    " Shorten command-line text and other info tokens
set belloff=all
set mouse=a		          " Mouse Support
set clipboard=unnamed   " Use System-Clipboard
set wildmenu            " Opens the completion menu automatic
set wildmode=list:longest,full
set expandtab           " Spaces are better than a tab character
set smarttab
set number              " Line Numbers
set ignorecase          " Ignoring case when searching
set smartcase           
set incsearch           " Incremental searching is sexy
" set nowrap            " dont wrap lines
set linebreak           " wrap lines at convenient points
set statusline=%f       " Statusline Setup: Tail of the filename
set smartindent

" set textwidth=79       " lines longer than 79 columns will be broken
set shiftwidth=2        " operation >> indents 4 columns; << unindents 4 columns
set tabstop=2           " a hard TAB displays as 4 columns
set expandtab           " insert spaces when hitting TABs
set softtabstop=2       " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround          " round indent to multiple of 'shiftwidth'
set autoindent          " align the new line indent with the previous line"

"set ruler
"set cursorline
set scrolloff=10        " Better context while scrolling
"set scrolloff=99       " Typewriter Mode, Focus allways in the middle of the Screen
set noswapfile          " one does not simply swap files
set background=dark     " make background dark, i.e black"
set relativenumber      " Relative linenumbers
set autoread            " Reload files automatically


" ==== QUIRKS ====

" No backup for crontab files, fixes os x bug
autocmd filetype crontab setlocal nobackup nowritebackup

" Fix register behaviour bug in tmux
" if $TMUX == ''
"    set clipboard+=unnamed
" endif


" ======= MAPPING =======

" Easier navigation on soft lines
nmap j gj
nmap k gk
nmap $ g$
nmap 0 g0

" Easier resizing of split windows
nmap + <c-w>+
nmap - <c-w>-

" Remap jj to escape in insert mode
inoremap jj <Esc> 
" nnoremap JJJJ <Nop>

"This unsets the last search pattern register by hitting enter 
nnoremap <CR> :noh<CR><CR>

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map Leader key to ,
let mapleader = ","     
let maplocalleader = "."     

" Run python script when hitting leader and r key
nnoremap <leader>r :w !Python3<CR>

" HTML indentation fix
let g:html_indent_inctags = "html,body,head,tbody, meta"

" ======= DEBUGGING =======

" Show syntax highlighting groups for word under cursor
nmap <C-S-G> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,"name")')
endfunc 

" ======== PLUGINS ========

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Gundo
nnoremap <F5> :GundoToggle<CR>

" NERDTree
nnoremap <F4> :NERDTreeToggle<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Goyo
let g:goyo_width = "100"
let g:goyo_margin_top = "0"
let g:goyo_margin_bottom = "0"

" Limelight
"Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 240

" Start Limelight with Goyo

nmap <F3> :Goyo<CR>

function! GoyoBefore()
  Limelight
endfunction

function! GoyoAfter()
  Limelight!
endfunction

let g:goyo_callbacks = [function('GoyoBefore'), function('GoyoAfter')]

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html'    : 1,
    \ 'xhtml'   : 1,
    \ 'xml'     : 1,
    \ 'jinja'   : 1,
    \ 'php'     : 1,
    \}

" Emmet
" let g:user_emmet_expandabbr_key = '<s-Tab>'
let g:user_emmet_expandabbr_key = '<leader><Tab>'
" let g:use_emmet_complete_tag = 1

" GitGutter
" Always show sign  column
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Tern
let g:tern#command = ['tern']

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Codi
let g:codi#rightalign = 0

" ale
let g:ale_fixers = {'javascript': ['prettier_standard']}
let g:ale_linters = {'javascript': ['']}
let g:ale_fix_on_save = 1
