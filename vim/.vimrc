set nocompatible               " be iMproved
set hidden                     " buffers can be put into background with writing to disk
set history=1000               " keep a longer vim history
set expandtab
set lazyredraw
filetype off                   " required!
set backspace=indent,eol,start
filetype plugin indent on      " activates indenting for files
set autoindent                 " auto indenting
set smartindent
set nu rnu                     " line numbers
set background=dark
set nobackup                   " get rid of anoying ~file
set shiftwidth=2
set softtabstop=2
set tabstop=2
set clipboard=unnamed
autocmd BufWritePre *.{builder,coffee,css,eco,erb,htm,html,js,json,md,rake,rb,spec,sass,scss,txt,xml,yml} :%s/\s\+$//e
set ruler
set wildmode=list:longest
set cursorline
set cursorcolumn
set encoding=utf-8
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
" turns on the C indentation standard
set cindent
" set foldmethod=indent
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'
" Plugin 'git://git.wincent.com/command-t.git'
Plugin 'kien/ctrlp.vim'
Plugin 'vividchalk.vim'
Plugin 'blackboard.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ruby-matchit'
Plugin 'matchit.zip'
Plugin 'rking/ag.vim'
Plugin 'Syntastic'
Plugin 'ruby.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-dispatch'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'
" Plugin 'int3/vim-taglist-plus'
Plugin 'hallison/vim-markdown'
Plugin 'godlygeek/tabular'
Plugin 'elixir-lang/vim-elixir'
Plugin 'avdgaag/vim-phoenix'
" Plugin 'git@github.com:farseer90718/vim-taskwarrior'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-endwise'
Plugin 'tomtom/tcomment_vim'
Plugin 'takac/vim-hardtime'
Plugin 'SirVer/ultisnips'
Plugin 'Vimjas/vim-python-pep8-indent'

call vundle#end()

augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

filetype on
syntax on                      " syntax highlighting

inoremap jj <ESC>
inoremap <C-CR> <Esc>

let mapleader = ","
" call pathogen#infect()

colorscheme solarized

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
nnoremap <leader><leader> <c-^>

nnoremap <expr> G (v:count ? 'Gzz' : 'G')
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>

set showbreak=↪\ \

" stop comment indenting
set cinkeys-='#

" first, enable status line always
set laststatus=2

" Excluding version control directories
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/build/*        " Linux/MacOSX

" Use Silver Searcher instead of grep
set grepprg=ag

:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
" let's not have to keep this
set nocursorcolumn

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
au BufNewFile,BufRead *.{cc,h,cpp,hpp} set syntax=cpp11
au BufRead,BufNewFile *.ex,*.exs setfiletype=elixir

" Command+T config
" :nnoremap <silent> <leader>b :CommandTMRU<CR>
" let g:CommandTMaxHeight = 15
" let g:CommandTMinHeight = 0
" let g:CommandTFileScanner ='find'

" CtrlP settings
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window_bottom = 1

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'
let g:ycm_auto_hover = ''

let g:javascript_plugin_jsdoc = 0
let g:javascript_plugin_ngdoc = 0
let g:javascript_plugin_flow = 0

" let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_checkers = ['jsxhint']
" let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

let g:hardtime_default_on = 1

let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []
let g:hardtime_timeout = 1500

if (match(system("uname -s"), "Darwin") != -1)
  " Command+1-0 jumps to tab 1-10, Shift+Command+1-0 jumps to tab 11-20:
  let s:windowmapnr = 0
  let s:wins='1234567890!@#$%^&*()'
  while (s:windowmapnr < strlen(s:wins))
      exe 'noremap <silent> <D-' . s:wins[s:windowmapnr] . '> ' . (s:windowmapnr + 1) . 'gt'
      exe 'inoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-O>' . (s:windowmapnr + 1) . 'gt'
      exe 'cnoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-C>' . (s:windowmapnr + 1) . 'gt'
      exe 'vnoremap <silent> <D-' . s:wins[s:windowmapnr] . '> <C-C>' . (s:windowmapnr + 1) . 'gt'
      let s:windowmapnr += 1
  endwhile
  unlet s:windowmapnr s:wins
endif

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
imap <c-l> <space>=><space>
imap <c-c> <esc>

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set autoread

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

au FocusLost * silent! w

" Copy and paste between vim instances
" vnoremap <C-S-c>:w !pbcopy<CR><CR>
" noremap <C-S-v>:r !pbpaste<CR><CR>

" Open a Quickfix window for the last search.
" nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" clear search highlighting
noremap <silent><leader>cs :nohls<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q<CR>
"
" find as you type
set incsearch

" highlight matches
set hlsearch

" only search case when an uppercase letter appears
set ignorecase
set smartcase

" open ag.vim
nnoremap <leader>a :Ag

" arg!
map <F1> <ESC>

" new
map <F4> :tabe<CR>
" close
map <F6> :qa<CR>

" toggle line numbers
map <F7> :set nonumber!<CR>

" toggle pasting
set pastetoggle=<F8>

" toggle spell checking
nmap <F10> :setlocal spell! spelllang=en_us<CR>
imap <F10> <C-o>:setlocal spell! spelllang=en_us<CR>

set ttyfast
" easier number increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" never enter Ex mode
nnoremap Q <nop>

" clean whitespace
nmap <leader>ws :%s/\s\+$//<CR>
map <leader>wc :%s/\s\+$//<cr>:let @/=''<CR>

" modify vimrc
nmap <leader>ev :e ~/.vimrc<CR>

" reload vimrc
nmap <leader>sv :so ~/.vimrc<CR>

" fugitive stuffs
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gB :Gblame -w -M -C -C -C<cr>
nnoremap <leader>gs :Gstatus<cr>

" /== neocomplcache-snippets-complete ==

" add completion for various file types
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
au BufNewFile,BufRead,BufEnter *.cc,*.cxx,*.hxx*.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
" fix bad white space
autocmd FileType c,cpp,ruby,css,html,xml autocmd BufWritePre <buffer> :%s/\s\+$//e

augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl>\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl>\<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
augroup END

" augroup javascript_folding
" 	au!
" 	au FileType javascript setlocal foldmethod=syntax
" augroup END

let g:vim_jsx_pretty_colorful_config = 1

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction

nmap <leader>er O#!/usr/bin/env ruby<cr><cr>
nmap <leader>ep O#!/usr/bin/env python<cr><cr>

cnoremap <expr> %% expand('%:h').'/'
map <leader>ef :edit %%
