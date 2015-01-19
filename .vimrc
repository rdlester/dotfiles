" required by vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/lib/python3.4/site-packages/powerline/bindings/vim/
call vundle#begin()

"""""""""""""""
" START PLUGINS

" Manage vundle, required
Plugin 'gmarik/Vundle.vim'

" Color scheme
Plugin 'altercation/vim-colors-solarized.git'

" git wrapper
Plugin 'tpope/vim-fugitive'

" Autocomplete!!!
Plugin 'Valloric/YouCompleteMe'
" JS Autocomplete
Plugin 'marijnh/tern_for_vim'

" Snippets for Autocomplete
Plugin 'SirVer/ultisnips'
" Default snippets
Plugin 'honza/vim-snippets'

" improved motions
Plugin 'Lokaltog/vim-easymotion'

" Goto file command
Plugin 'ctrlpvim/ctrlp.vim'

" File browser
Plugin 'scrooloose/nerdtree'

" Autoclose brackets, etc
Plugin 'Raimondi/delimitMate'

" Linter
Plugin 'scrooloose/syntastic'

" do repeats with plugin commands
Plugin 'tpope/vim-repeat'

" Tab alignment
Plugin 'tpope/vim-sleuth'

" Match more stuff with %
Plugin 'matchit.zip'

" auto-navigate btw functions / vars
Plugin 'majutsushi/tagbar'

" ack
Plugin 'mileszs/ack.vim'

" comment out lines
Plugin 'tomtom/tcomment_vim'

" Modify surrounding chars easily
Plugin 'tpope/vim-surround'

" Auto-open docs with gK!
Plugin 'Keithbsmiley/investigate.vim'

" Undo tree
Plugin 'sjl/gundo.vim'

" Buffer explorer
Plugin 'jeetsukumaran/vim-buffergator'

" Limit editable region in file using :NR
Plugin 'chrisbra/NrrwRgn'

" ios-specific stuff
Plugin 'eraserhd/vim-ios'
Plugin 'msanders/cocoa.vim'

" haskell specific stuff
Plugin 'bitc/vim-hdevtools'
Plugin 'eagletmt/neco-ghc'
Plugin 'dag/vim2hs'

"""""""""""""
" END PLUGINS

" required for vundle
call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""
" START PERSONAL SETTINGS

"Change cursor shape on insert / normal.
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Default file to use for autocomplete
let g:ycm_global_ycm_extra_conf = '~/.ycm_global_ycm_extra_conf.py'

" Powerline
let g:Powerline_symbols = 'unicode'
set laststatus=2 "Keeps powerline on screen
set noshowmode "Get rid of default vim mode display
set encoding=utf-8

" Colorscheme
syntax enable
set background=light
let g:solarized_termcolors=16
set t_Co=256
colorscheme solarized

" YCM
" append objc and objcpp to default blacklist until YCM fixes objc
" autocorrect; use clang-complete in the meantime
let g:ycm_semantic_triggers = {'haskell': ['.']}
let g:ycm_key_list_previous_completion=['<Up>']

" UltiSnips
let g:UltiSnipsSnippetDirectories=['/Users/lester/.vim/bundle/vim-snippets/UltiSnips']

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_objc = {
  \ 'ctagstype': 'objc',
  \ 'ctagsargs': [
    \ '-f',
    \ '-',
    \ '--excmd=pattern',
    \ '--extra=',
    \ '--format=2',
    \ '--fields=nksaSmt',
    \ '--options=' . expand('~/.vim/objc-tag-defs'),
    \ '--objc-kinds=-N',
  \ ],
  \ 'sro': ' ',
  \ 'kinds': [
    \ 'c:constant',
    \ 'e:enum',
    \ 't:typedef',
    \ 'i:interface',
    \ 'P:protocol',
    \ 'p:property',
    \ 'I:implementation',
    \ 'M:method',
    \ 'g:pragma',
  \ ],
  \ }
let g:tagbar_type_objcpp = {
  \ 'ctagstype': 'objcpp',
  \ 'ctagsargs': [
    \ '-f',
    \ '-',
    \ '--excmd=pattern',
    \ '--extra=',
    \ '--format=2',
    \ '--fields=nksaSmt',
    \ '--options=' . expand('~/.vim/objc-tag-defs'),
    \ '--objc-kinds=-N',
  \ ],
  \ 'sro': ' ',
  \ 'kinds': [
    \ 'c:constant',
    \ 'e:enum',
    \ 't:typedef',
    \ 'i:interface',
    \ 'P:protocol',
    \ 'p:property',
    \ 'I:implementation',
    \ 'M:method',
    \ 'g:pragma',
  \ ],
  \ }

" NERDTree
map <F5> :NERDTreeToggle<CR>

" Haskell
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
let g:syntastic_haskell_checkers = ['hdevtools', 'hlint']

" Various other settings
set viminfo='50,<1000,:100,n~/.vim/viminfo
set backspace=indent,eol,start
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=0
set number
set relativenumber
set noerrorbells
set ruler
set showcmd
set switchbuf=useopen,usetab,split
set foldenable
set foldmethod=syntax
set foldlevelstart=99
let g:xml_syntax_folding=1

" Yank automatically to system clipboard.
set clipboard=unnamed

set history=50		" keep 50 lines of command line history
set autoindent		" always set autoindenting on

" MOUSE
set mouse=a

""""""""""""""""""""
" Custom keybindings

" Fast escapes
inoremap <C-f> <Esc>

" EasyMotion search
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
set nohlsearch " EasyMotion search has better highlighting

""""""""""""""
" Autocommands

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
