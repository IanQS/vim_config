" #######################################
" START Plugin Manager - dein Scripts
" #######################################
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/ian/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/ian/.config/nvim')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('SirVer/ultisnips')  " snippets for vim to be faster
call dein#add('honza/vim-snippets') " snippet source
call dein#add('Shougo/neoinclude.vim') " Thing for deoplete
call dein#add('vim-utils/vim-man')  " for viewing man pages within vim   
call dein#add('vim-airline/vim-airline')  " airline
call dein#add('vim-airline/vim-airline-themes')  " themes for airline
call dein#add('c0r73x/neotags.nvim')  " generate tags for C-like files
call dein#add('scrooloose/nerdtree')  " enable nerdtree
call dein#add('Xuyuanp/nerdtree-git-plugin')  " nerdtree git compatibility
call dein#add('neomake/neomake')  " neomake for syntax cheking
call dein#add('elzr/vim-json')  " Highlights the json thing correctly
call dein#add('tpope/vim-fugitive')  " git wrapper
call dein#add('easymotion/vim-easymotion')  " For skipping around the page
call dein#add('mbbill/undotree')  " Undo tree!
call dein#add('jiangmiao/auto-pairs')  " auto-generate brackets and such
call dein#add('kien/rainbow_parentheses.vim')  " rainbow parens
call dein#add('airblade/vim-gitgutter')  " see git changes within a file
call dein#add('jceb/vim-orgmode')

" DEOPLETE COMPLETION
call dein#add('Shougo/deoplete.nvim')  " for autocomplete
" Sources for deoplete
call dein#add('zchee/deoplete-clang')  " For C, C++
call dein#add('zchee/deoplete-jedi')   " For python

" Specific plugins for languages
call dein#add('jalvesaq/Nvim-R')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" #######################################
" END Plugin Manager - dein Scripts
" #######################################


" #######################################
" START Variable declarations for plugins
" #######################################
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#max_list = 20
let g:deoplete#auto_complete_delay = 1
let g:airline_theme='jellybeans'
let g:my_snippet_manager = 'ultisnips'
let g:EasyMotion_do_mapping = 0

" Trigger configuration.
let g:UltiSnipsExpandTrigger="<C-e"
let g:UltiSnipsJumpForwardTrigger='<C-l>'
let g:UltiSnipsJumpBackwardTrigger='<C-h>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" Use Python Version
let g:UltiSnipsUsePythonVersion = 3

let g:ultisnips_python_style="google"
let g:deoplete#disable_auto_complete = 1
let mapleader = "\<Space>"
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" stuff for autocompletion in deoplete for C
let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header ="/usr/include/clang/"
" #######################################
" END Variable Declaration
" #######################################


" #######################################
" START maps
" #######################################
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :UndotreeToggle<cr>

" Move to word
map  <Leader>h <Plug>(easymotion-bd-fl)
map <Leader>j <Plug>(easymotion-bd-jk)

nnoremap <silent> <Leader><Leader> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Leader> zf

inoremap <expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ deoplete#mappings#manual_complete()
                function! s:check_back_space() abort "{{{
                let col = col('.') - 1
                return !col || getline('.')[col - 1]  =~ '\s'
            endfunction"}}}

" #######################################
" END maps
" #######################################


" #######################################
" START Sane vim native configs
" #######################################
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set foldmethod=manual
set number      " Show line numbers
set linebreak   " Break lines at word (requires Wrap lines)
set showbreak=+++       " Wrap-broken line prefix
set textwidth=80        " Line wrap (number of cols)
set showmatch   " Highlight matching brace
set visualbell  " Use visual bell (no beeping)
set autoread
if &encoding != 'utf-8'
    set encoding=utf-8          "Necessary to show Unicode glyphs
endif
set noshowmode "Don't show the mode(airline is handling this)
 
set hlsearch    " Highlight all search results
set smartcase   " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch   " Searches for strings incrementally
set updatetime=250
 
set autoindent  " Auto-indent new lines
set expandtab   " Use spaces instead of tabs
set shiftwidth=4        " Number of auto-indent spaces
set smartindent " Enable smart-indent
set smarttab    " Enable smart-tabs
set softtabstop=4       " Number of spaces per Tab
 
"" Advanced
set ruler       " Show row and column ruler information
 
set autochdir   " Change working directory to open buffer
 
set undolevels=1000     " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

" Turn off backups
set noswapfile
set nobackup
set nowb

" #######################################
" END Sane vim native configs
" #######################################
