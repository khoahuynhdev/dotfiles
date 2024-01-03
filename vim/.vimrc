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
set nowritebackup
set noswapfile                        " Ain't nobody got time for swap files
set noerrorbells                      " Don't beep
" set nowrap                            " Do not wrap lines
set showcmd                           " Display incomplete commands in the bottom line of the screen
set visualbell                        " Visual bell instead of beeping
set laststatus=2                      " Always display the status line
set encoding=UTF-8
set clipboard^=unnamed,unnamedplus
set splitright
set splitbelow
set autoindent
set si                                "smart indent
set hidden
set number                            " Let's active line number
set relativenumber                    " look to your left screen
set showmatch
set nofixendofline
set termguicolors
" set shell=bash
" set conceallevel=0                  "Concealing Characters
" set autowriteall                      " Automatically write the file when switching buffer

"-------------AUTOCOMPLETE-------------"
set omnifunc=syntaxcomplete#Complete
set complete=.,w,b,u                  " Set our desired autocompletion matching

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
noremap <space> :
" nnoremap j jzz
" nnoremap k kzz
nnoremap <Leader>ev :tabedit $HOME/.vimrc<cr>
" Add simple hightlight removal
nnoremap <ESC><ESC> :nohlsearch<cr>
nnoremap <Leader>qq :bd<CR>
" nnoremap <C-o> :tabedit<cr>:NERDTreeToggle<cr>
" quicker with space w <cr>
map <Leader>w :w!<cr>

nnoremap <leader>sc mqA;<esc>`q
nnoremap <leader>ss :source %<cr>

" Mapping for managing tab
" map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tt :tabnext<cr>
map <leader>tp :tabprevious<cr>

" move a line up/down
" move line mappings
" ∆ is <A-j> on macOS
" ˚ is <A-k> on macOS
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <Esc>:m .+1<cr>==gi
inoremap ˚ <Esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv
vnoremap ˚ :m '<-2<cr>gv=gv

vnoremap $( <esc>`>a)<esc>`<i(<esc>
vnoremap $[ <esc>`>a]<esc>`<i[<esc>
vnoremap ${ <esc>`>a}<esc>`<i{<esc>
vnoremap $" <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>
vnoremap $\ <esc>`>o*/<esc>`<O/*<esc>
vnoremap $< <esc>`>a><esc>`<i<<esc>

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" Buffer management
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Next/Previous between buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" to the first none blank char of line
noremap <S-H> ^
noremap <S-L> $
vnoremap <S-H> ^
vnoremap <S-L> $h

" make Y consistent with C and D.
nnoremap Y y$

nnoremap <CR> G
" Open terminal
nnoremap <Leader>at :call OpenFloatTerm()<CR>
" Open node REPL
nnoremap <Leader>an :call OpenFloatTerm('"node"')<CR>
nnoremap <Leader>ar :call OpenFloatTerm('"irb"')<CR>
" Open tig, yes TIG, A FLOATING TIGGGG!!!!!!
nnoremap <Leader>ag :call OpenFloatTerm('"tig"')<CR>
" nnoremap <leader>g :silent execute "grep! -R" . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

inoremap jk <esc>
" Operation mapping
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F(vi(<cr>
onoremap p i(

" }}}

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

set guicursor+=n-v-c:blinkon0
set cursorline                                  "highlight current line
set title
autocmd BufWritePre * %s/\s\+$//e               "Auto remove trailing space

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

"Automatically source the Vimrc file on save.
augroup autosourcing
  autocmd!
  autocmd BufWritePost *vimrc source %
augroup END
