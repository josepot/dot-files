let g:deoplete#enable_at_startup = 1

" Markdown
let g:vim_markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript', 'typescript=tsc', 'bash=sh', 'css']

" Let .js files be recognized as JSX
let g:jsx_ext_required = 0

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Haxe
let g:vaxe_cache_server = 1
let g:vaxe_cache_server_port = 6000
let g:vaxe_completion_disable_optimizations = 0

" Rust
set hidden
let g:racer_cmd = "/home/tom/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1

" For Rust ctags (rusty-tags)
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
