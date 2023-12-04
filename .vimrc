" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Show the mode you are on the last line.
set showmode

" Set tab width to 4 columns.
set tabstop=2

" Automatically add extra curly brace in insert mode
" inoremap { {}<ESC>ha

" Automaticaly add extra parentheses when ( is entered
" inoremap ( ()<ESC>ha

"Apply the indentation of the current line to the next
set autoindent

" Open a terminal at current directory in a new tab
command! TT tabnew | terminal ++curwin


" keymapping for navigating n terminal
noremap <C-t> :tabnext<CR>

" control o to exit terminal mode when open terminal in a new tab
tnoremap <C-o> <C-\><C-n>

" set fn key equal to escape
noremap <fn> <ESC>


set mouse=a


nnoremap <silent> <C-b> :if exists("t:netrw") && t:netrw == "open"<CR>:let t:netrw = "closed"<CR>:exe "normal! :q"<CR>:else<CR>:let t:netrw = "open"<CR>:exe "vertical resize " . winwidth(0) / 4<CR>:Vexplore<CR>:endif<CR>

noremap <F3> <C-w>w

noremap <F2> <C-w>W

"   Edit another file in the same directory as the current file
"   uses expression to extract path from current file's path
"  (thanks Douglas Potts)
" should create a new directory

if has("unix")
    nnoremap ,e :tabe <C-R>=expand("%:p:h") . "/" <CR>
else
    nnoremap ,e :tabe <C-R>=expand("%:p:h") . "\" <CR>
endif

call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe'
call plug#end()


function! ToggleYCM()
  let g:ycm_auto_trigger = !get(g:, 'ycm_auto_trigger', 0)
  if g:ycm_auto_trigger
    echo "YouCompleteMe enabled"
  else
    echo "YouCompleteMe disabled"
  endif
endfunction

command! ToggleYCM call ToggleYCM()

nnoremap <F5> :call ToggleYCM()<CR>

set incsearch

set hlsearch


set laststatus=2

set shortmess=a


nnoremap <F1> :exe ":!info ".expand("<cword>")

set background=dark

set viminfo='10,\"100,:20,%,n~/.viminfo
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set smarttab

nmap <silent> <C-N> :silent noh<CR>

"enter now just enters an empty line in normal mode without leaving normal
"mode
nnoremap <CR> mzo<Esc>`z

