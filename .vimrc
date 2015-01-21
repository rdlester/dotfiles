" required by vundle
set nocompatible

" toggle filetype to fix exit code.
filetype on
filetype off

"""""""""""""""
" START PLUGINS

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Powerline
let powerline_subpath = "/lib/python3.4/site-packages/powerline/bindings/vim/"
let powerline_rtp = substitute(system("brew --prefix"), "\n", "", "") . powerline_subpath
let &rtp = &rtp . "," . powerline_rtp

" Color scheme
Plugin 'altercation/vim-colors-solarized.git'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'scrooloose/syntastic'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Motions
Plugin 'rizzatti/dash.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tomtom/tcomment_vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'matchit.zip'

" file search / opening
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'chrisbra/NrrwRgn'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'

" haskell specific stuff
Plugin 'bitc/vim-hdevtools'
Plugin 'dag/vim2hs'

" required for vundle
call vundle#end()
filetype plugin indent on

"""""""""""""""""""
" PERSONAL SETTINGS

"""""""""""""
" KEYBINDINGS

inoremap <C-f> <Esc>
let mapleader=','

" Easymotion bindings
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
set nohlsearch " EasyMotion search has better highlighting

" Dash
nmap <silent> <leader>d <Plug>(DashSearch)

" tcomment
map <C-/> :TComment<CR> " Have to press this twice?
map <Leader>/ :TComment<CR>

""""""""""""
" APPEARANCE

"Change cursor shape on insert / normal.
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Colorscheme
syntax enable
set background=light
let g:solarized_termcolors=16
set t_Co=256
colorscheme solarized

"""""""""
" GENERAL

set viminfo='50,<1000,:100,n~/.vim/viminfo
set history=50
set switchbuf=useopen,usetab,split

set backspace=indent,eol,start
set clipboard=unnamed

set smarttab
set expandtab
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=0

set number
set relativenumber
set ruler
set showcmd

set foldenable
set foldmethod=syntax
set foldlevelstart=99
let g:xml_syntax_folding=1

set mouse=a

"""""""""""""""
" PLUGIN CONFIG

"""""""""""
" Powerline
let g:Powerline_symbols = 'unicode'
set laststatus=2 "Keeps powerline on screen
set noshowmode "Get rid of default vim mode display
set encoding=utf-8

"""""
" YCM
let g:ycm_semantic_triggers = {'haskell': [' ']}
let g:ycm_key_list_previous_completion=['<Up>']

"""""""""""
" UltiSnips
let g:UltiSnipsSnippetDirectories=['~/.vim/bundle/vim-snippets/UltiSnips']

""""""""
" Ctrl-p
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}

""""""""
" Tagbar
nmap <F8> :TagbarToggle<CR>

""""""""""
" NERDTree
map <F5> :NERDTreeToggle<CR>

"""""""""
" Haskell
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
let g:syntastic_haskell_checkers = ['hdevtools', 'hlint']

" Various other settings

""""""""""""""
" AUTOCOMMANDS

augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

  autocmd FileChangedRO * ! p4 edit <afile>

augroup END


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
