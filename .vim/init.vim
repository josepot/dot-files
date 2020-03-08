" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/bundle')

set rtp+=~/.fzf
set runtimepath^=~/.vim
let &packpath = &runtimepath

" # Plugins
" Make sure you use single quotes
"
" NerdTree
Plug 'scrooloose/nerdtree'
" Tmux Navigation
Plug 'christoomey/vim-tmux-navigator'
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Colorschemes
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
" Elixir
Plug 'elixir-editors/vim-elixir'
" File Control / Formatting
Plug 'ctrlpvim/ctrlp.vim'
Plug '~/.fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'godlygeek/tabular'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Haxe
Plug 'jdonaldson/vaxe'
" HTML
Plug 'othree/html5.vim'
" JavaScript
Plug 'Quramy/vim-js-pretty-template'
Plug 'bpietravalle/vim-bolt'
" Markdown
Plug 'gabrielelana/vim-markdown'
Plug 'jszakmeister/markdown2ctags'
" Rust
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
" Shaders/GLSL
Plug 'tikhomirov/vim-glsl'
" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" Tabs
" TypeScript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

source ~/.vim/.vimrc
