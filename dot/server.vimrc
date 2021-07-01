" Maintainer:  Khoa <khoa.huynh@unibiz.io>

" We want the latest vim settings/options, it must be first because it changes other options as a side effect
set nocompatible

" Vim plug settings ------------------- {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $HOME/.vimrc
endif
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'chr4/nginx.vim'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'
Plug 'thaerkh/vim-indentguides'

Plug 'moll/vim-node'
Plug 'tpope/vim-surround'
Plug 'rhysd/git-messenger.vim'

Plug 'tpope/vim-eunuch'
Plug 'delphinus/vim-auto-cursorline'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"}}}

"-------------COMMON_SETTING-------------"
filetype plugin indent on                    " Detect files type
set backspace=indent,eol,start        " Make backspace behave like every other editor
set t_Co=256                          " use 256 colors.
syntax on                             " Enable syntax highlighting
syntax enable
set autoread                          " Read open files again when changed outside Vim
set autowrite                         " Write a modified buffer on each :next , ...
set history=200                       " Keep 200 lines of command line history
set incsearch                         " Find the next match as we type the search
set hlsearch                          " Highlight searches by default
set ignorecase                        " Ignore case when searching...
set smartcase                         " ...unless we type a capital
set listchars=""                      " Empty the listchars
set listchars=tab:>.                  " A tab will be displayed as >...
set listchars+=trail:.                " Trailing white spaces will be displayed as .
set nobackup                          " Don't constantly write backup files
set noswapfile                        " Ain't nobody got time for swap files
set noerrorbells                      " Don't beep
" set nowrap                            " Do not wrap lines
set showcmd                           " Display incomplete commands in the bottom line of the screen
set visualbell                        " Visual bell instead of beeping
set laststatus=2                      " Always display the status line
set encoding=UTF-8
set clipboard+=unnamedplus
set splitright
set splitbelow
set autoindent
set si                                "smart indent
set hidden
set number                            " Let's active line number
set relativenumber                    " look to your left screen
set showmatch
" set shell=bash
" set conceallevel=0                  "Concealing Characters
" set autowriteall                      " Automatically write the file when switching buffer


"-------------AUTOCOMPLETE-------------"
set omnifunc=syntaxcomplete#Complete
set complete=.,w,b,u                  " Set our desired autocompletion matching

augroup FileType_Local_tabwidth " {{{
  autocmd!
  au FileType typescriptreact setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType scheme setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType typescript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType json setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType yml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType vim setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType sh setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType zsh setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType javascript.jsx setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType pug setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType html setlocal tabstop=2 shiftwidth=2 expandtab
  au FileType scss setlocal tabstop=2 shiftwidth=2 expandtab iskeyword+=@-@
  au FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
  au FileType cs setlocal tabstop=4 shiftwidth=4 expandtab
  au FileType html.erb setlocal tabstop=2 shiftwidth=2 expandtab
  au FileType html.handlebars setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
  au FileType apache setlocal commentstring=#\ %s
  au FileType gitconfig setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
augroup END
" }}}

" Fold --------------{{{
augroup Filetype_javascript
  au!
  au FileType javascript setlocal foldmethod=indent foldnestmax=3 nofoldenable
  au FileType javascript iab clg console.log(``);<esc>2hi

augroup END

augroup Filetype_vim
  au!
  au FileType vim setlocal foldmethod=marker foldenable
augroup END

augroup Filetype_zsh
  au!
  au FileType zsh setlocal foldmethod=marker foldenable
augroup END

" }}}
"-------------INDENTGUIDES-------------"

let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'

" =====Ignore_compiled_files===== {{{
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
" }}}

" ==========Mapping========== {{{
let mapleader=','
noremap <space> :
" nnoremap j jzz
" nnoremap k kzz
nnoremap <Leader>ev :tabedit $HOME/.vimrc<cr>
" Add simple hightlight removal
nnoremap <ESC><ESC> :nohlsearch<cr>
nnoremap <Leader>qq :bd<CR>
" nnoremap <C-o> :tabedit<cr>:NERDTreeToggle<cr>
map <C-n> :NERDTreeToggle<cr>

" quicker with space w <cr>
map <Leader>w :w!<cr>

nnoremap <leader>sc mqA;<esc>`q
nnoremap <leader>ss :source %<cr>

" Don't use recording now
map q <Nop>

" Mapping for managing tab
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tt :tabnext<cr>
map <leader>tp :tabprevious<cr>

" Go to tab by number
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>


" Buffer management
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Next/Previous between buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" to the first none blank char of line
noremap <S-H> ^
noremap <S-L> $

" make Y consistent with C and D.
nnoremap Y y$

nnoremap <CR> G

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

inoremap jk <esc>
" Operation mapping
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F(vi(<cr>
onoremap p i(

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
" autocmd bufenter * execute "normal! \<c-w>|\<c-w>_"

function! RenameFile()
  let old_name = expand("%")
  let new_name = input('New file Name:', expand('%'), 'file')
  if new_name !=# '' && new_name !=# old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("Ack \"" . l:pattern . "\" " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction "--------------FloatingWindows {{{

" }}}

"--------------visuals--------------"

if has("nvim")
  set termguicolors
endif

highlight colorcolumn guibg=#870087

autocmd! InsertEnter * set colorcolumn=80 |
  \ set norelativenumber |
  \ set conceallevel=0
autocmd! InsertLeave * set colorcolumn=0 |
  \ set relativenumber |
  \ set conceallevel=2



highlight Comment guifg=darkcyan
set guioptions-=e
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set cursorline                                  "highlight current line
set title
autocmd BufWritePre * %s/\s\+$//e               "Auto remove trailing space

" Don't redraw while executing macros (good performance config)
set lazyredraw


"--------------vim_gitgutter--------------"
" Enable gitguter realtime upadating
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
set updatetime=300


"--------------Mouse--------------"
if has('mouse')
  set mouse=a
endif


"--------------NERDTree--------------"

let NERDTreeShowHidden = 1
let NERDTReeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
" Auto close NERDTree if it is the last and only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Prevent FZF open file in NERDTree
autocmd VimEnter * nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"

"--------------autopairs--------------"
"let g:AutoPairsFlyMode = 1

" ---------EASY_MOTION-----{{{
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" }}}

"-------------editor_config-------------
" play nice with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" -----Automatically source the Vimrc file on save.-----
augroup autosourcing
  autocmd!
  autocmd BufWritePost *vimrc source %
augroup END
