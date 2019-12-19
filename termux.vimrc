
set nocompatible			                "We want the latest vim settings/options, it must be first because it changes other options as a side effect
" Initialisation de pathogen
call pathogen#infect()
call pathogen#helptags()
syntax on                             "Enable syntax highlighting
syntax enable
filetype plugin indent on             "Detech files type

"-------------COMMENTARY-------------"
autocmd FileType apache setlocal commentstring=#\ %s

"-------------AUTOCOMPLETE-------------"
set omnifunc=syntaxcomplete#Complete
set backspace=indent,eol,start        "Make backspace behave like every other editor
let mapleader = ','                   "The default leader is \, but a comma is much better
set number                            "Let's active line number
set relativenumber                    "look to your left screen
set laststatus=2                      "Always display the status line
set autowriteall                      "Automatically write the file when switching buffer
set complete=.,w,b,u                  "Set our desired autocompletion matching"
" set tabstop=2
" set softtabstop=2
" set shiftwidth=2
" set expandtab
set clipboard=unnamed
set autoindent
set splitright
set splitbelow
set si                                "smart indent
set hidden
set encoding=UTF-8
set conceallevel=1                  "Concealing Characters

" yaml indentation
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType yml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType vim setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType javascript.jsx setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType pug setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType html setlocal tabstop=2 shiftwidth=2 expandtab
au FileType vue setlocal tabstop=2 shiftwidth=2 expandtab
au FileType eruby setlocal tabstop=2 shiftwidth=2 expandtab
au FileType scss setlocal tabstop=2 shiftwidth=2 expandtab
au FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
au FileType cs setlocal tabstop=4 shiftwidth=4 expandtab
au FileType html.erb setlocal tabstop=2 shiftwidth=2 expandtab
au FileType html.handlebars setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

"Make it easy to edit the vimrc file.
"-------------Mapping-------------"
nnoremap <Leader>ev :tabedit ~/.vimrc<cr>
" Add simple hightlight removal
nmap <Leader><space> :nohlsearch<cr>
nnoremap <Leader>qq :bd<CR>
nnoremap <C-s> :tabn<cr>
nnoremap <C-a> :tabN<cr>
nnoremap <C-o> :tabedit<cr>:NERDTreeToggle<cr>
map <C-n> :NERDTreeToggle<cr>
map <Leader>ww :w!<cr>
nmap <C-x> :quit<cr>

"--------------FloatingWindows--------------"
if has('nvim')
  function! OpenFloatTerm()
    let height = float2nr((&lines - 2) / 1.5)
    let row = float2nr((&lines - height) / 2)
    let width = float2nr(&columns / 1.5)
    let col = float2nr((&columns - width) / 2)
    " Border Window
    let border_opts = {
          \ 'relative': 'editor',
          \ 'row': row - 1,
          \ 'col': col - 2,
          \ 'width': width + 4,
          \ 'height': height + 2,
          \ 'style': 'minimal'
          \ }
    let border_buf = nvim_create_buf(v:false, v:true)
    let s:border_win = nvim_open_win(border_buf, v:true, border_opts)
    " Main Window
    let opts = {
          \ 'relative': 'editor',
          \ 'row': row,
          \ 'col': col,
          \ 'width': width,
          \ 'height': height,
          \ 'style': 'minimal'
          \ }
    let buf = nvim_create_buf(v:false, v:true)
    let win = nvim_open_win(buf, v:true, opts)
    terminal
    startinsert
    " Hook up TermClose event to close both terminal and border windows
    autocmd TermClose * ++once :q | call nvim_win_close(s:border_win, v:true)
  endfunction
endif
"--------------visuals--------------"
"joshdick/onedark.vim
colorscheme onedark
hi Comment guifg=#808080
set t_Co=256                                    "use 256 colors.
set guioptions-=e
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set cursorline                                  "highlight current line
set title
autocmd BufWritePre * %s/\s\+$//e               "Auto remove trailing space

"--------------vim_airline/vim_airline_themes--------------"
let g:airline_theme='ayu_mirage'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"--------------vim_airline/vim_airline--------------"
let g:airline#extensions#tabline#enabled = 1

"--------------Mouse--------------"
if has('mouse')
  set mouse=a
endif
" mhinz/vim-startify

let g:startify_custom_header = [
      \ ' #    #                      ',
      \ ' #   #  #    #  ####    ##    ',
      \ ' #  #   #    # #    #  #  #   ',
      \ ' ###    ###### #    # #    #  ',
      \ ' #  #   #    # #    # ######  ',
      \ ' #   #  #    # #    # #    #  ',
      \ ' #    # #    #  ####  #    #  ',
      \ '                              ',
      \ ' #     #                             ',
      \ ' #     # #    # #   # #    # #    #  ',
      \ ' #     # #    #  # #  ##   # #    #  ',
      \ ' ####### #    #   #   # #  # ######  ',
      \ ' #     # #    #   #   #  # # #    #  ',
      \ ' #     # #    #   #   #   ## #    #  ',
      \ ' #     #  ####    #   #    # #    # ',
      \ ]


let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
hi StartifyHeader guifg=#FFD700

"--------------Searching--------------"
set hlsearch
set incsearch
set rtp+=/usr/local/opt/fzf

"--------------NERDTree--------------"

let NERDTreeShowHidden = 1
let NERDTReeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
" Auto close NERDTree if it is the last and only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Prevent FZF open file in NERDTree
autocmd VimEnter * nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"


"--------------Split Management--------------"
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"--------------autopairs--------------"
"let g:AutoPairsFlyMode = 1

"--------------Vim_Javascript--------------"
"let g:javascript_plugin_jsdoc = 1
"let g:javascript_plugin_ngdoc = 1

" Disable inherited syntastic
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": [],
  \ "passive_filetypes": [] }

"--------------ALE--------------"
let g:ale_sign_error = '😡'
let g:ale_sign_warning = '🤧'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
"-------------Auto-Commands-------------
"Automatically source the Vimrc file on save.
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END
