set nocompatible               " be iMproved
set hidden                     " buffers can be put into background with writing to disk
set history=1000               " keep a longer vim history
set expandtab
set lazyredraw
filetype off                   " required!
set backspace=indent,eol,start
filetype plugin indent on      " activates indenting for files
syntax on                      " syntax highlighting
set autoindent                 " auto indenting
set smartindent
set number                     " line numbers
set background=dark
set nobackup                   " get rid of anoying ~file
set shiftwidth=2
set softtabstop=2
set tabstop=2
autocmd BufWritePre *.{builder,coffee,css,eco,erb,htm,html,js,json,md,rake,rb,spec,sass,scss,txt,xml,yml} :%s/\s\+$//e
set ruler
set wildmode=list:longest
set cursorline
set cursorcolumn
set encoding=utf-8
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
" turns on the C indentation standard
set cindent

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'git@github.com:gmarik/vundle'
Bundle 'ctrlp.vim'
Bundle 'Syntastic'
Bundle 'git@github.com:tpope/vim-surround'
Bundle 'git@github.com:tpope/vim-rails'
Bundle 'git@github.com:tpope/vim-rake'
Bundle 'git@github.com:tpope/vim-dispatch'
Bundle 'git@github.com:wookiehangover/jshint.vim'
Bundle 'git@github.com:tpope/vim-fugitive'
Bundle 'git@github.com:int3/vim-taglist-plus'
Bundle 'git@github.com:hallison/vim-markdown'
Bundle 'git@github.com:altercation/vim-colors-solarized'
Bundle 'git@github.com:godlygeek/tabular'
Bundle 'git@github.com:kchmck/vim-coffee-script.git'
Bundle 'git@github.com:farseer90718/vim-taskwarrior'
Bundle 'vividchalk.vim'
Bundle 'ack.vim'
Bundle 'ruby-matchit'
Bundle 'matchit.zip'
Bundle 'blackboard.vim'
Bundle 'git@github.com:bling/vim-airline'
Bundle 'ruby.vim'
Bundle 'git@github.com:tpope/vim-endwise'
Bundle 'git@github.com:tomtom/tcomment_vim'
Bundle 'git@github.com:Shougo/neosnippet'

inoremap jk <ESC>

let mapleader = ","
call pathogen#infect()

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
set cinkeys-=0#

" first, enable status line always
set laststatus=2

" Excluding version control directories
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/build/*        " Linux/MacOSX

" Use Silver Searcher instead of grep
set grepprg=ag

:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
au BufNewFile,BufRead *.cc,*.h,*.cpp,*.hpp set syntax=cpp11

" CtrlP configuration
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window_bottom = 1

" let g:ctrlp_open_new_file = 't'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'

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

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

au FocusLost * silent! w

" Copy and paste between vim instances
vnoremap <C-S-c>:w !pbcopy<CR><CR>
noremap <C-S-v>:r !pbpaste<CR><CR>

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" clear search highlighting
noremap <silent><leader>cs :nohls<CR>

nnoremap <leader>w :w<CR>
" find as you type
set incsearch

" highlight matches
set hlsearch

" only search case when an uppercase letter appears
set ignorecase
set smartcase

map :ack :Ack

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

" neocomplete stuffs
let g:acp_enableAtStartup = 0
let g:neosnippet#snippets_directory = '~/.vim/snippets'

" /== neocomplcache-snippets-complete ==

" neosnippet stuff
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)

" add completion for various file types
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" fix bad white space
autocmd FileType c,cpp,ruby,css,html,xml autocmd BufWritePre <buffer> :%s/\s\+$//e

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

nmap <leader>df :%s/,\s*:focus\s*/ /gc<CR>

