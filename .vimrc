" required by vundle
set nocompatible

" toggle filetype to fix exit code.
filetype on
filetype off

"""""""""""""""
" START Plug

if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Utilities
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'kana/vim-operator-user'
Plug 'tpope/vim-abolish'
" Plug 'fweep/vim-zsh-path-completion'
Plug 'junegunn/vim-peekaboo'
" Plug 'benekastah/neomake'
Plug 'gelguy/Cmd2.vim'
" Plug 'libclang-vim/libclang-vim', { 'do': './autogen.sh && make' }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
" Plug 'pelodelfuego/vim-swoop' " <Leader>l / <Leader>ml / :Swoop <pattern>
" Plug 'hecal3/vim-leader-guide'

" Color scheme
Plug 'altercation/vim-colors-solarized'

" git
" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Completion
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !python3 ./install.py --tern-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', {'do': function('BuildYCM')}
" Plug 'eagletmt/neco-ghc'
Plug 'scrooloose/syntastic'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Motions
Plug 'easymotion/vim-easymotion'
Plug 'tomtom/tcomment_vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'vim-scripts/matchit.zip'
Plug 'terryma/vim-multiple-cursors'

" text objects
Plug 'wellle/targets.vim'  " a for argument
Plug 'bkad/CamelCaseMotion'  " <Leader>w object, <Leader>w/b/e movement
Plug 'kana/vim-textobj-user' " util
      \ | Plug 'glts/vim-textobj-comment'  " c for comment
      \ | Plug 'rhysd/vim-textobj-continuous-line'  " v for continuous line (including \s)
      \ | Plug 'gilligan/textobj-gitgutter'  " h for changed hunk
      \ | Plug 'glts/vim-textobj-indblock'  " o for selecting whitespace prior to chunk of lines
      \ | Plug 'kana/vim-textobj-indent'  " i for selecting chunk of lines with same indentation.
      \ | Plug 'vimtaku/vim-textobj-keyvalue'  " k / v for key / value
      \ | Plug 'kana/vim-textobj-lastpat'  " '/' for last search pattern
      \ | Plug 'mattn/vim-textobj-url'   " u for url
      \ | Plug 'kana/vim-textobj-function'  " f for function in C, Java, vimscript
      \ | Plug 'libclang-vim/vim-textobj-function-clang'  " improved f in C
      \ | Plug 'libclang-vim/vim-textobj-clang'  " ; for source chunk (i; is a single command, a; is definition);
      " \ | Plug 'gilligan/vim-textobj-haskell'  " h for function (conflict with gitgutter?)
      \ | Plug 'bps/vim-textobj-python'  " f / c for function / class

" file search / opening
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'sjl/gundo.vim'
Plug 'majutsushi/tagbar'
" Plug 'rking/ag.vim'
Plug 'vim-scripts/a.vim'

" sessions
" Plug 'tpope/vim-obsession'

" editor help
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'

" C / C++ / Objc
" Plug 'rhysd/vim-clang-format', {'for': ['c', 'cpp', 'objc', 'objcpp']}

" Objc
" Plug 'b4winckler/vim-objc', {'for': ['objc', 'objcpp']}

" HTML
Plug 'mattn/emmet-vim'

" haskell
" Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
" Plug 'bitc/vim-hdevtools', {'for': 'haskell', 'do': 'stack install hdevtools'}
" Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
" Plug 'eagletmt/neco-ghc', {'for': 'haskell', 'do': 'stack install ghc-mod'}
" Plug 'enomsg/vim-haskellConcealPlus', {'for': 'haskell'}
" Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
" Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }

" clojure
" Plug 'guns/vim-clojure-static', {'for': 'clojure'}
" Plug 'guns/vim-sexp', {'for': 'clojure'}
" Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
" Plug 'kien/rainbow_parentheses.vim', {'for': 'clojure'}
" Plug 'tpope/vim-fireplace', {'for': 'clojure'} " Remember to set up cider/cider-nrepl in lein
" Plug 'tpope/vim-salve', {'for': 'clojure'}
" Plug 'guns/vim-clojure-highlight', {'for': 'clojure'}

" python
" Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
" Plug 'ivanov/vim-ipython', {'for': 'python'}

" Protobuf
" Plug 'jdevera/vim-protobuf-syntax'

" CSV
Plug 'chrisbra/csv.vim'

" Supercollider
" Plug 'sbl/scvim'

" required for vundle
call plug#end()
filetype plugin indent on

"""""""""""""""""""
" PERSONAL SETTINGS

"""""""""""""
" KEYBINDINGS

inoremap <C-f> <Esc>
let mapleader=','

" tab navigation
noremap <C-t><C-t> :tabnew<CR>
noremap <C-t>j :tabnext<CR>
noremap <C-t>k :tabprevious<CR>
noremap <C-t>q :tabclose<CR>

" Split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Easymotion bindings
nmap s <Plug>(easymotion-s2)

" Cmd2
nmap : :<F12>
nmap / /<F12>
nmap ? ?<F12>
cmap <F12> <Plug>(Cmd2Suggest)

" Configure YCM to play nice with Ultisnips
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_key_invoke_completion = '<C-o>'

let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'

" Submenus
noremap <Leader>/ :TComment<CR>
noremap <Leader>d :call investigate#Investigate()<CR>
noremap <Leader>f :NERDTreeToggle<CR>
noremap <Leader>m :TagbarOpenAutoClose<CR>
noremap <Leader>u :GundoToggle<CR>
noremap <Leader>a :Ag<Space>
noremap <Leader>c :copen<CR>

" fireplace
noremap <Leader>e :Eval<CR>
noremap <Leader>E :%Eval<CR>

" FZF
noremap <C-p> :Files<CR>
nnoremap <C-f> :Lines<CR>
noremap <Leader>p :Buffers<CR>

" plugin binding ref:
" vim-multiple-cursors - <C-n>
" NrrwRgn - :NR or <Leader>nr in visual mode
" ag.vim - :Ag
" surround - ds{remove}, cs{remove}{replace}, ys{motion}{add}, vS
" 	valid targets include (/"/etc, t (XML tags), w/W/s/p
" 	(word,sentence,paragraph)
" vim-sexp-regular-ppl - word motions -> element. >/< + f move form, e move
" 	elem, )/( to slurp/barf, I to insert at start/end of form. dsf delete
" 	surroundings of form, cse+paren/brace/bracket to surround element in
" 	that.
" emmet - <C-y>, to expand.
" TComment - <Leader>/
" Dash - <Leader>d
" NERDTree - <Leader>f

""""""""""""
" APPEARANCE

"Change cursor shape on insert / normal
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Colorscheme
syntax enable
set background=dark
set t_Co=256
colorscheme solarized

"""""""""
" GENERAL

set viminfo='50,<1000,:100,n~/.vim/viminfo
set history=50
set switchbuf=useopen,usetab,split

set backspace=indent,eol,start
set clipboard=unnamed

set ignorecase

set smarttab
set expandtab
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=0
set breakindent

set number
set relativenumber
set ruler
set showcmd

set foldenable
set foldmethod=syntax
set foldlevelstart=99
let g:xml_syntax_folding=1

set mouse=a

set ssop-=options
set ssop-=folds

set wildmenu
set wildmode=list:longest,full

set lazyredraw

set completeopt-=preview

"""""""""""""""
" PLUGIN CONFIG

"""""""""""
" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
set laststatus=2 "Keeps powerline on screen
set noshowmode "Get rid of default vim mode display
set encoding=utf-8

"""""""""""
" UltiSnips
let g:UltiSnipsSnippetsDir = "~/.vim-snips"
let g:UltiSnipsEditSplit = "context"

"""""""""""
" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""
" FZF
let g:fzf_layout = { 'down': '~25%' }

"""""""""""""
" Investigate
let g:investigate_use_dash=1

"""""""
" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"""""""""
" Haskell
let g:haskellmode_completion_ghc = 0
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
au FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:haskell_conceal_wide = 1
let g:haskell_conceal_enumerations = 1
let g:syntastic_haskell_checkers = ['hdevtools', 'hlint']
let g:necoghc_enable_detailed_browse = 1

let g:neomake_haskell_ghc_mod_args = '-g-Wall'

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

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

augroup END


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif
