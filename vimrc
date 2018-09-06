" ================ General Config ====================
"
set number                      "Line numbers are good
set relativenumber              "Relative numbers are even better
set numberwidth=5
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set wildmenu
set wildmode=full
set laststatus=2

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
  set undodir=~/.vim/undo
  set undofile
endif
" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

set breakindent
"set showbreak=\\\\\

set ruler
syntax enable

set encoding=utf8

set ffs=unix,dos,mac

" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Yank text to the OS X clipboard
"noremap <leader>y "*y
"noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
"noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Add a shortcut for netrw
"nmap <silent> <Leader>e :Explore<CR>

" === Plugins ===

" Plugin automation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
" Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'justinmk/vim-sneak'
Plug 'Valloric/YouCompleteMe'

call plug#end()

colorscheme nord
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1

" Supress python errors I don't need
" see https://github.com/SirVer/ultisnips/issues/996#issuecomment-403347577
if has('python3')
  silent! python3 1
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()

" Always start in line 1 of Git commit messages
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
" Limit commit messages to 72 character lines
au BufRead,BufNewFile COMMIT_EDITMSG setlocal textwidth=72


" Fuzzy helpers
nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>F :GFiles<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>a :Ag<CR>
nmap <Leader>h :History<CR>

" Window management
nnoremap <silent> <leader>s :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <silent> <leader>q :close<CR>

" Zoom a split
noremap <silent> <leader>z :tab split<CR>

" Seamlessly navigate Vim splits and tmux panes
" from https://bluz71.github.io/2017/06/14/a-few-vim-tmux-mappings.html
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

if &term == 'screen-256color'
    let g:tmux_navigator_no_mappings = 1
    nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
endif

" Generic helpers
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" YouCompleteMe configuration
" disable tab to make ultisnips work
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" Snippet configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" my snippets
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \  },
      \  'component_function': {
      \    'gitbranch': 'fugitive#head'
      \  },
      \ }
