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
set showmatch
set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command line barset noshowmode
""setlocal keymap=vietnamese-telex_utf-8 "enable telex for typing vietnamese"
""au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown


"=====================================ColumnRowHighlight====================================="
set cursorline
set cursorcolumn
"=====================================Plugins====================================="
call plug#begin('~/vimfiles/plugged')
"Auto complete
""Plug 'ycm-core/YouCompleteMe'
"Solidity theme
""Plug 'tomlion/vim-solidity' 
"Syntax check"
""Plug 'dense-analysis/ale'
""Plug 'prabirshrestha/vim-lsp'
""Plug 'mattn/vim-lsp-settings'

"HTML tags"
""Plug 'alvan/vim-closetag'
""Plug 'tpope/vim-surround'


"""Git for vim"
""Plug 'tpope/vim-fugitive'

"Finding in workspace
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


"Remove hls when move cursor away when finding word
Plug 'haya14busa/is.vim'
"ColorScheme
Plug 'Luxed/ayu-vim'
"TreeFolder
Plug 'preservim/nerdtree'
"Task bar "
Plug 'vim-airline/vim-airline'

"LSP connect"
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'


"Git for vim"
Plug 'tpope/vim-fugitive'
"Prettier format"
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

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
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
let g:NERDTreeFileLines = 1
"=====================================asynccomplete.vim===================================="
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
"=====================================vim-closetag====================================="
"Must add two option filenames and xhtmlnames to config 
let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.tsx,*.js' 
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx,*.js'
let g:closetag_filetypes = 'html,js'
let g:closetag_xhtml_filetype = 'xhtml,jsx,tsx,js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
  \ 'typescript.tsx': 'jsxRegion,tsxRegion',
  \ 'javascript.jsx': 'jsxRegion',
  \ }
let g:closetag_shortcut = '>'
"=====================================LSP====================================="

if executable('html-languageserver')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'html-languageserver',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
      \ 'whitelist': ['html', 'javascript', 'typescript'],
      \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
   "" nmap <buffer> [g <plug>(lsp-previous-diagnostic)
   "" nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> gl <plug>(lsp-document-diagnostics)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()

augroup END
hi Visual  guifg=white guibg=LightBlue gui=none
"=====================================Shortcut====================================="
let mapleader = " "
nnoremap <leader>pv :Sex<CR>
"File navigation
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf  :Files<CR>
"Not find in folder 
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
"Quickfix navigation

nnoremap <C-k>  :cnext<CR>
nnoremap <C-j>  :cprev<CR>
"Visual block mode
nnoremap <leader>b <C-v>

"Save
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

"Substitude in normal mode
nnoremap <Leader>r :%s:::g<Left><Left>
nnoremap <Leader>rc :%s:::gc<Left><Left><Left>
"Substitude in visual mode
xnoremap <Leader>r :s:::g<Left><Left>
xnoremap <Leader>rc :s:::gc<Left><Left><Left>
"Find in workspace
nnoremap <Leader>f :grep   ***.js<Left><Left><Left><Left><Left><Left><Left><Left>
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
xnoremap <leader>y "-y
nnoremap <leader>p "-p
"Move around in buffer"
nnoremap <C-n> :bprev<CR>
nnoremap <C-m> :bnext<CR>
"NerdTree open"
nnoremap <leader>n :NERDTreeFocus<CR>

"Insert ; to the last pos"
inoremap ;' <ESC>A;
"Replace word in all buffer open"
"Substitude in multi buffer
nnoremap <leader>rb :bufdo<Space>%s:::g<Space>\|<Space>update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
