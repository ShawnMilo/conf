set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set hlsearch
set expandtab
set exrc
set updatetime=1000 

hi Search cterm=NONE ctermfg=black ctermbg=yellow

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR>

colorscheme slate

"F2 and F3 to move to next/previous buffer 
map <F2> :bprev<CR>
map <F3> :bnext<CR>

nnoremap n nzzzv
nnoremap N Nzzzv

call plug#begin()
  Plug 'vim-go'
call plug#end()

ab lb 💡
ab cbox ⬜
ab _cb ⬜
ab chk ✔
ab _n 🗒


" pause in activity in insert mode
autocmd CursorHoldI * :call Shortcuts()
function Shortcuts()
    let pos = getcurpos()
    let offset = pos[2] 
    let args = {"file": expand("%:p"), "line": getline("."), "line_num": pos[1], "col_num": pos[2]}
    execute "%!shortcuts"
    execute "%!try goimports"
    execute args["line_num"] + "G"
    :call cursor(pos[1], pos[2]) 
endfunction

autocmd BufWritePre *.go :call GoStuff()
function GoStuff()
    let pos = getcurpos()
    let offset = pos[2] - 1
    let args = {"file": expand("%:p"), "line": getline("."), "line_num": pos[1], "col_num": pos[2]}
    execute "%!goimports"
    execute args["line_num"] + "G"
    execute ":normal! " . offset . "|"
endfunction
