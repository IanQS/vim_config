" #######################################
" START Plugin Manager - Vim plug
" #######################################
call plug#begin()

"" Coding Specific plugins
Plug 'tpope/vim-sensible'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'valloric/youcompleteme'
Plug 'rdnetto/YCM-Generator'


"" Interface plugins
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'elzr/vim-json'
Plug 'scrooloose/syntastic'

" Version control related
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Appearances
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
Plug 'yggdroot/indentline'
Plug 'tomasr/molokai'

" Externals
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'vim-utils/vim-man'  " Open man pages from within vim

" Session management
Plug 'vim-ctrlspace/vim-ctrlspace'

call plug#end()


"" #######################################
"" END Plugin Manager
"" #######################################

"" #######################################
"" START Variable declarations for plugins
"" #######################################
" Mapping leader
let mapleader = "\<Space>"

" Stuff for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntax checking stuff
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Ultisnippets
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" Appearances stuff
let g:airline_theme='jellybeans'
"let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" Easy motion 
let g:EasyMotion_do_mapping = 0

"" Snippet expansion stuff
let g:my_snippet_manager = 'ultisnips'
"" Use Python Version
let g:UltiSnipsUsePythonVersion = 3
let g:ultisnips_python_style="google"

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Rainbow parens
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Indentline
let g:indentLine_char = '|'
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']

" Ctrl-P stuff
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_extensions = ['bookmarkdir', 'dir']

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

let g:CtrlSpaceSymbols = {"File": "FILE", "CTab": "CTAB", "Tabs": "TABS" }

if executable("ag")
        let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
    endif

let g:CtrlSpaceIgnoredFiles = '\v(tmp|temp|Godeps)[\/]'

let g:ycm_confirm_extra_conf=0
" #######################################
" END Variable Declaration
" #######################################


"" #######################################
"" START maps
"" #######################################
" Toggles
map <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>u :UndotreeToggle<cr>

" Move to word
map  <Leader>h <Plug>(easymotion-bd-fl)
map <Leader>j <Plug>(easymotion-bd-jk)

" Code folding remaps
nnoremap <silent> <Leader><Leader> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Leader> zf


inoremap <C-c> <ESC>
nnoremap Q <nop>
nnoremap <silent> <Leader>/ :nohlsearch<CR>


" #######################################
" END maps
" #######################################
"

" #######################################
" START Sane vim native configs
" #######################################

" Seriously?
filetype plugin indent on
syntax enable

set nocompatible
set hidden
set showtabline=0

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set foldmethod=manual
set number      " Show line numbers
set linebreak   " Break lines at word (requires Wrap lines)
set showbreak=+++     " Wrap-broken line prefix
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
