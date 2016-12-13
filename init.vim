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
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neoinclude.vim')
call dein#add('vim-utils/vim-man')  " for viewing man pages within vim   
call dein#add('vim-airline/vim-airline')  " airline
call dein#add('vim-airline/vim-airline-themes')  " themes for airline
call dein#add('c0r73x/neotags.nvim')  " generate tags for C-like files
call dein#add('scrooloose/nerdtree')  " enable nerdtree
call dein#add('Xuyuanp/nerdtree-git-plugin')  " nerdtree git compatibility
call dein#add('neomake/neomake')  " neomake for syntax checking
call dein#add('elzr/vim-json')  " Highlights the json thing correctly
call dein#add('tpope/vim-fugitive')  " git wrapper
call dein#add('easymotion/vim-easymotion')  " For skipping around the page
call dein#add('mbbill/undotree')  " Undo tree!
call dein#add('jiangmiao/auto-pairs')  " auto-generate brackets and such
call dein#add('kien/rainbow_parentheses.vim')  " rainbow parens
call dein#add('airblade/vim-gitgutter')  " see git changes within a file
call dein#add('MattesGroeger/vim-bookmarks')  " bookmarks for moving around
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
let g:airline_theme='jellybeans'
let g:bookmark_no_default_key_mappings = 1

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" #######################################
" END Plugin starter
" #######################################


" #######################################
" START maps
" #######################################
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :UndotreeToggle<cr>
let mapleader = "\<Space>"

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


" Bookmarks 
nmap <Leader><Leader> <Plug>(BookmarkToggle)
nmap <Leader>i <Plug>(BookmarkAnnotate)
nmap <Leader>a <Plug>(BookmarkShowAll)
nmap <Leader>j <Plug>(BookmarkNext)
nmap <Leader>k <Plug>(BookmarkPrev)
nmap <Leader>c <Plug>(BookmarkClear)

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

function! s:neosnippet_complete()
  if pumvisible()
    return "\<c-n>"
  else
    if neosnippet#expandable_or_jumpable() 
      return "\<Plug>(neosnippet_expand_or_jump)"
    endif
    return "\<tab>"
  endif
endfunction

imap <expr><TAB> <SID>neosnippet_complete()


" #######################################
" END maps
" #######################################


" #######################################
" START Sane vim native configs
" #######################################
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
set foldmethod=manual
set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=80	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
set updatetime=250
 
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
 
"" Advanced
set ruler	" Show row and column ruler information
 
set autochdir	" Change working directory to open buffer
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
" #######################################
" END Sane vim native configs
" #######################################
