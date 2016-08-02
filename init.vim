let s:uname = system("uname")
let g:python_host_prog='/usr/bin/python'

set nocompatible

" set the runtime path to include Vundle and initialize
"
set rtp+=~/.config/nvim/Vundle.vim

call vundle#begin('~/.config/nvim/bundle') " let Vundle manage Vundle, required
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'thoughtbot/vim-rspec'
Plugin 'slim-template/vim-slim'
Plugin 'wakatime/vim-wakatime'
Plugin 'chase/vim-ansible-yaml'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'tomtom/tcomment_vim'
Plugin 'othree/html5.vim'
Plugin 'bling/vim-airline'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neoyank.vim' " For unite vim
Plugin 'kassio/neoterm'
Plugin 'equalsraf/neovim-gui-shim'
" Plugin 'xolox/vim-easytags'
" Plugin 'xolox/vim-misc'
" Plugin 'Yggdroot/indentLine'
" Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()

syntax on
filetype plugin on
filetype plugin indent on

set autoread
set mouse=a      " enable mouse support
set vb           " enable visual bell
set ruler        " show row and column in footer
set scrolloff=5  " minimum lines below and above cursor
set laststatus=2 " always show status line
" set exrc                                 " enable project's level settings

set smartindent
set ts=2         " set indent to 2 spaces
set shiftwidth=2
set expandtab    " use spaces, not tab characters

set showmatch    " show bracket matches
set ignorecase   " ignore case in search

set hlsearch     " highlight all search matches
set cursorline   " highlight current line

set smartcase    " pay attention to case when caps are used
set incsearch    " show search results as I type

" let g:indentLine_leadingSpaceChar = '·'
" let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_faster = 1
" let g:indentLine_char = '▸'
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1
let g:indentLine_conceallevel = 1
" let g:indentLine_showFirstIndentLevel=1

let mapleader = "\<Space>"

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>

" Folding
" nnoremap <Space> za
" set foldmethod=indent
" set foldlevelstart=20

set relativenumber

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme Monokai

" Fugitive
" put git status, column/row number, total lines, and percentage in status
" set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

" set tags+=gems.tags
" let g:easytags_dynamic_files = 2
" let g:easytags_async = 1

" NerdTree
let NERDTreeQuitOnOpen=1

" Snippets are separated from the engine. Add this if you want them:
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Deoplete
let g:deoplete#enable_at_startup = 1

tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

tnoremap <A-1> <C-\><C-n>1gt
tnoremap <A-2> <C-\><C-n>2gt 
tnoremap <A-3> <C-\><C-n>3gt
tnoremap <A-4> <C-\><C-n>4gt
tnoremap <A-5> <C-\><C-n>5gt
tnoremap <A-6> <C-\><C-n>6gt

nnoremap <A-1> 1gt
nnoremap <A-2> 2gt 
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt

inoremap <A-1> <Esc>1gt
inoremap <A-2> <Esc>2gt 
inoremap <A-3> <Esc>3gt
inoremap <A-4> <Esc>4gt
inoremap <A-5> <Esc>5gt
inoremap <A-6> <Esc>6gt


let g:my_ag_opts = get(g:, 'my_ag_opts', []) + [
	\ '--vimgrep', '--smart-case', '--skip-vcs-ignores', '--hidden',
	\ '--ignore', '.git', '--ignore', '.idea', '--ignore', '.stversions',
	\ '--ignore', 'bower_modules', '--ignore', 'node_modules', '--ignore', '.tmp'
	\ ]

" file_rec/async: Use the_silver_searcher or ack
if executable('ag')
	let g:unite_source_rec_async_command =
		\ [ 'ag', '--follow', '-g', '' ] + g:my_ag_opts
elseif executable('ack')
	let g:unite_source_rec_async_command = [ 'ack', '-f', '--nofilter' ]
endif

" Use the_silver_searcher or ack or default grep
if executable('ag')
	let g:unite_source_grep_command = 'ag'
	let g:unite_source_grep_default_opts = join(g:my_ag_opts)
	let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
	let g:unite_source_grep_command = 'ack'
	let g:unite_source_grep_default_opts = '-i --noheading --nocolor -k -H'
	let g:unite_source_grep_recursive_opt = ''
endif

" Matches, converters, and filters {{{

call unite#custom#source(
	\ 'buffer,file_rec,file_rec/async,file_rec/git,file_rec/neovim,neomru/file',
	\ 'matchers',
	\ ['converter_relative_word', 'matcher_fuzzy'])

call unite#custom#source(
	\ 'file_rec,file_rec/async,file_rec/neovim,file_mru,neomru/file',
	\ 'converters',
	\ ['converter_file_directory'])

" }}}

let g:unite_source_history_yank_enable = 1

" }}} Unite

" NeoTerm
let g:neoterm_rspec_lib_cmd = 'bin/rspec'
let g:neoterm_size=10

let g:indent_guides_color_change_percent = 5
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

nnoremap <leader>f :<C-u>Unite -start-insert buffer file_rec/async<CR>
nnoremap <leader>F :<C-u>Unite -quick-match buffer<CR>
nnoremap <leader>g :<C-u>Unite -start-insert grep:.<cr>
nnoremap <leader>h :<C-u>Unite -start-insert history/yank<cr>
nnoremap <leader>H :<C-u>Unite -start-insert history/unite<cr>
nnoremap <leader>u :<C-u>Unite<cr>
nmap <leader>w :w<cr>
nmap <leader>W :wa<cr>
nmap <leader>q :q<cr>
nmap <leader>Q :qa<cr>
nmap <leader>S :vsplit<cr>
nmap <leader>s :split<cr>
nmap <leader>p "+p
nmap <leader>P "+P
nmap <leader>y "+y
nmap <leader>Y "+Y
vmap <leader>y "+y
nmap <leader>e :NERDTreeToggle<cr>
map <leader>g :Gstatus<cr>
" Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a# :Tabularize /#<CR>
vmap <Leader>a# :Tabularize /#<CR>
nmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a :Tabularize 
nmap <Leader>a :Tabularize 
" RSpec
nnoremap <silent> <leader>rt :call neoterm#test#run('all')<cr>
nnoremap <silent> <leader>rf :call neoterm#test#run('file')<cr>
nnoremap <silent> <leader>rn :call neoterm#test#run('current')<cr>
nnoremap <silent> <leader>rr :call neoterm#test#rerun()<cr>
" Useful maps
" hide/close terminal
nnoremap <silent> <leader>t :Ttoggle<cr>
" nnoremap <silent> <leader>th :call neoterm#close()<cr>
" clear terminal
" nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
" hhnoremap <silent> <leader>tc :call neoterm#kill()<cr>
function! neoterm#test#minitest#run(scope)
  if a:scope == 'all'
    let command = 'bin/rake test'
  elseif a:scope == 'file'
    let command = 'bin/rails test ' . @%
  elseif a:scope == 'current'
    let command = 'ruby -Ilib:test ' . expand('%:p') . ' -n /' . <sid>minitest_get_current() . '/'
  endif

  return command
endfunction

