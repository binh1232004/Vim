set hls
set lazyredraw
set scrolloff=8
set guicursor=
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command line barset noshowmode

" Install Plug by vim-plug
call plug#begin('~/vimfiles/plugged')
"Finding in workspace
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Remove hls when move cursor away when finding word
Plug 'haya14busa/is.vim'
Plug 'Luxed/ayu-vim'
"Auto complete
Plug 'ycm-core/YouCompleteMe'
"Solidity theme
Plug 'tomlion/vim-solidity' 
"TreeFolder
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
call plug#end()

"NERDTree relative number
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

"Theme
set termguicolors       " enable true colors support

set background=dark     " for either mirage or dark version.
" NOTE: `background` controls `g:ayucolor`, but `g:ayucolor` doesn't control `background`

let g:ayucolor="dark"   " for dark version of theme
" NOTE: g:ayucolor will default to 'dark' when not set.

colorscheme ayu
hi Normal guibg=NONE ctermbg=NONE
let g:NERDTreeFileLines = 1

let mapleader = " "
nnoremap <leader>pv :Sex<CR>
"File navigation
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf  :Files<CR>
"Not find in folder 
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
"Quickfix navigation

nnoremap <C-j>  :cnext<CR>
nnoremap <C-k>  :cprev<CR>
"Visual block mode
nnoremap <leader>b <C-v>

"Save
nnoremap <C-s> :w<CR>
"Search in normal mode
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
"Search in visual mode
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>
"Find in workspace
nnoremap <Leader>f :grep   **/*.js<Left><Left><Left><Left><Left><Left><Left><Left>
"Auto bracket
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
" Delete, highlight word 
nnoremap dw diw
nnoremap vw viw
nnoremap cw ciw

"Delete including special char"
nnoremap diw diW
nnoremap viw viW
nnoremap ciw ciW
"copy"
xnoremap <C-c> "+y
"File copy, delete, hightlight"

nnoremap dG ggdG
nnoremap vG ggVG
nnoremap cG ggcG
"Move line code"
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
"Delete method
nnoremap df vf)d
"Yank into void register, 
vnoremap <leader>p "_dP 
"NerdTree Open
nnoremap <leader>n :NERDTreeFocus<CR>

