" Colors
" -----------

" Set neovim colors
if has('nvim') || has('termguicolors')
  set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set background=dark
syntax enable
colorscheme gruvbox

" Highlight the maxlength
set colorcolumn=80

let g:airline_theme = 'gruvbox'
