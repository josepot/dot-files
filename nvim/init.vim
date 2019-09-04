scriptencoding utf-8
source ~/.config/nvim/plugins.vim

filetype plugin indent on

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set shiftround
set noshowcmd
set nofoldenable
map K <Nop>

set background=dark

runtime macros/matchit.vim

" wrap quickfix window
autocmd FileType qf setlocal wrap linebreak

autocmd BufNewFile,BufRead .babelrc setlocal filetype=json
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=json
autocmd BufNewFile,BufRead tslint.json setlocal filetype=json

function! SyntaxItem()
  echo synIDattr(synID(line("."),col("."),1),"name")
endfunction

" Ale status line - last empty string = no message when everything is OK
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']

" status bar
set statusline=%F%m%r%h%w\  "fullpath and status modified sign
set statusline+=\ %y "filetype
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %{ALEGetStatusLine()}
" this line below pushes everything below it to the right hand side
set statusline+=%=
set statusline+=\%l

" assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

set autoread

" set breakindent

set history=500

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

set ignorecase smartcase

set spelllang=en_ca
syntax spell toplevel

autocmd FileType markdown setlocal shiftwidth=4 softtabstop=4 tabstop=4 wrap linebreak nolist wrap lbr colorcolumn=0 synmaxcol=999999

set laststatus=2

set nowrap

set incsearch
set hlsearch

set scrolloff=5

set nobackup
set nowritebackup
set noswapfile

set backspace=indent,eol,start

set wildmode=full
set wildmenu

let mapleader=","
noremap \ ,

set wildignore+=*.o,*.obj,.git,node_modules,_site,*.class,*.zip,*.aux

" set number

" clear highlights by hitting ESC
" or by hitting enter in normal mode
nnoremap <CR> :noh<CR><CR>

set list listchars=tab:»·,trail:·

command! Q q

set splitbelow
set splitright

set tags=./.tags;

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx

" make the completion menu a bit more readable
highlight PmenuSel ctermbg=white ctermfg=black
highlight Pmenu ctermbg=black ctermfg=white

" so it's clear which paren I'm on and which is matched
highlight MatchParen cterm=none ctermbg=none ctermfg=yellow

"few nicer JS colours
highlight xmlAttrib ctermfg=121
highlight jsThis ctermfg=224
highlight jsSuper ctermfg=13
highlight jsFuncCall ctermfg=cyan
highlight jsComment ctermfg=245 ctermbg=none
highlight jsClassProperty ctermfg=14 cterm=bold

" ~~~ MAPPINGS BELOW ~~~

"gtfo ex mode
map Q <Nop>

" vim-test
map <Leader>e :TestFile<CR>
map <Leader>n :TestNearest<CR>
map <Leader>l :TestLast<CR>
map <Leader>s :TestSuite<CR>

" new file in current directory
map <Leader>nf :e <C-R>=expand("%:p:h") . "/" <CR>

" toggle spellcheck
map <leader>sc :setlocal spell!<CR>

map <leader>v :vsplit<CR>

" clean up any trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

noremap H ^
noremap L $

" FZF.vim
nnoremap <leader>t :Files<cr>
nnoremap <leader>b :Buffers<cr>

" let g:fzf_prefer_tmux = 1

" make copy/paste from system clip easier
vnoremap <leader>8 "*y
vnoremap <leader>9 "*p
nnoremap <leader>8 "*p

" disable the Ale HTML linters
let g:ale_linters = {
\   'html': [],
\}

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = [
\ 'eslint'
\]
let g:ale_fixers['typescript'] = [
\ 'tslint'
\]
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

set completeopt-=preview

let g:localvimrc_persistent = 2

" NerdTree Settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" jj === scape
:imap jj <Esc>

" relative line numbers
set number relativenumber

" TRUE COLORS (EVEN INSIDE TMUX)
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

syntax on
colorscheme onedark

" airline
let g:airline_powerline_fonts = 1

" adjust split size
 if bufwinnr(1)
   map + <C-W>+
   map - <C-W>-
   map < <C-W><
   map > <C-W>>
 endif

 " ALEFix shortcut
 nmap <leader>f <Plug>(ale_fix)

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" === coc.nvim === "
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
