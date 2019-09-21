
call pathogen#infect()
call pathogen#helptags()
set nocompatible			                "We want the latest vim settings/options
syntax on
syntax enable

"-------------AUTOCOMPLETE-------------"
filetype plugin indent on             "Detech files type
set omnifunc=syntaxcomplete#Complete

" Initialisation de pathogen
set backspace=indent,eol,start        "Make backspace behave like every other editor
let mapleader = ','                   "The default leader is \, but a comma is much better
set number                            "Let's active line number
set laststatus=2                      "Always display the status line
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
"Make it easy to edit the vimrc file.
"-------------Mapping-------------"
nmap <Leader>ev :tabedit ~/.vimrc<cr>
" Add simple hightlight removal
nmap <Leader><space> :nohlsearch<cr>  
nmap <S-w> :tabn<cr>
nmap <S-q> :tabN<cr>
map <C-n> :NERDTreeToggle<cr>
nmap <S-x> :quit<cr>

"--------------visuals--------------"

set t_CO=256                                    "use 256 colors.
colorscheme elflord
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"--------------Searching--------------"
set hlsearch
set incsearch
set relativenumber
set rtp+=/usr/local/opt/fzf

"--------------NERDTree--------------"

let NERDTreeShowHidden = 1
let NERDTReeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

"--------------Split Management--------------"
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


"--------------autopairs--------------"
"let g:AutoPairsFlyMode = 1
"--------------Vim-polyglot--------------"
"let g:javascript_plugin_jsdoc = 1
"let g:javascript_plugin_ngdoc = 1

"--------------Syntastic--------------"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = './node_modules/.bin/eslint'

let g:syntastic_error_symbol = '😡'
let g:syntastic_style_error_symbol = '🤬'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

"-------------Auto-Commands-------------
"Automatically source the Vimrc file on save.
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END
