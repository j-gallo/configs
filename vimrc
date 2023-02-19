"Julian Gallo's vimrc
" derived from Dave Walker's vimrc
" derived from Matt Campbell's vimrc derived from Giles Francis Hall

" vundle configs
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'klen/python-mode'
Plugin 'tmhedberg/simpylfold'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'wincent/Command-T'
Plugin 'rstacruz/sparkup'
Plugin 'davidhalter/jedi-vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'mhinz/vim-signify'
Plugin 'gabesoft/vim-ags'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tomtom/tcomment_vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'briancollins/vim-jst'
Plugin 'tpope/vim-rails'
" Plugin 'eslint/eslint'
" Plugin 'scrooloose/syntastic'

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
"
" let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

call vundle#end()            " required
filetype plugin indent on    " required

" Tagbar settings
nnoremap <Leader>l :TagbarToggle<CR>

" rainbow parentheses settings
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
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
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"ag settings
nnoremap <Leader>a :Ags 

let g:jsx_ext_required = 0

" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=8
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=5
" let g:indent_guides_enable_on_vim_startup = 1

"" command-t mapping
nmap <silent> <Leader>v <Plug>(CommandTBuffer)

"" pymode settings
let g:pymode = 1
let g:pymode_rope = 1
let g:pymode_options_colorcolumn = 0
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_ignore = "E501,W"
let g:pymode_python = 'python3'
let g:pymode_folding = 0
nnoremap <Leader>p :PymodeLint<CR>

"" folding setting
let g:SimpylFold_fold_import = 0

"" NERDTree
map <Leader>o :NERDTreeToggle<CR>

set mouse=a

" Fix indentation behavior for php case
let PHP_vintage_case_default_indent=1

"" General environ options
set nocompatible					" Ditch VI strictness
set backspace=indent,eol,start		" Fix how backspacing works
set ruler							" Show cursor location info
set smartindent						" Always Autoindent
set showcmd							" Show Partial Commands
set whichwrap=b,s,h,l,<,>,[,]		" Set the wrapping characters
set encoding=utf-8					" No more ANSI encodings
set fileencoding=utf-8				" No more ANSI encodings
set nobackup						" Don't bother with backup files
set title							" Show the title
set linebreak						" Show linebreaks
set showbreak=>						" Use '>' character for line breaks
set number							" Show line numbers
set relativenumber					" Show relative line numbers
set incsearch						" Use incremental searching
set hlsearch						" Use Highlighting
set ignorecase						" Case insensitive matching
set smartcase						" Case sensitive matching if caps in search string
set synmaxcol=5000					" Really long line syntax highlighting
set shiftwidth=2
set tabstop=2
set softtabstop=0
set expandtab
syntax on							" Syntax highlighting
filetype indent on

set viminfo='10,\"100,:20,%,n~/.viminfo

" Visual Stuff
set background=dark					" Use a dark background
set showcmd							" Show info in the ruler

" Show spacing
set list
set listchars=tab:>-,trail:-,nbsp:'

""wildmenu
set wildmenu
set wildmode=list:longest,full

"" Status Line
set laststatus=2
set statusline=%f           "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}]     "file format
set statusline+=%h          "help file flag
set statusline+=%m          "modified flag
set statusline+=%r          "read only flag
set statusline+=%y          "filetype
set statusline+=%*
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Persistent undo
set undodir=$HOME/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000

" Be screen friendly
if !has("gui_running")
	set term=xterm-256color
endif

" Remap movement keys to go through multi-line lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" set foldcolumn size
set foldcolumn=3

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" Fix up some filetypes
autocmd BufRead *.class set filetype=php
"au BufNewFile,BufRead *.js set filetype=javascript
autocmd FileType c,cpp,slang set cindent
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Bonus PERL
autocmd FileType perl set smartindent
autocmd FileType perl set keywordprg=perldoc\ -f

autocmd BufReadPost *
			\ if line("'\"") > 0 && line ("'\"") <= line("$") |
			\   exe "normal! g'\"" |
			\ endif

" Highlight extra spaces or tabs in red.
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

" add spaces around ' => ' in entire file
nmap <silent> <C-o>
	\ :%s/\(['"]\)=>\(['"a-zA-Z0-9$]\)/\1 => \2/g<CR>

" add spaces aroung ' => ' in current line
nmap <silent> <C-i>
	\ :s/\(['"]\)=>\(['"a-zA-Z0-9$]\)/\1 => \2/g<CR>

" pretty print JSON
" command PJson execute "%!python -m json.tool"
