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
"Task bar "
Plug 'vim-airline/vim-airline'
"Syntax check"
""Plug 'dense-analysis/ale'
""Plug 'prabirshrestha/vim-lsp'
""Plug 'mattn/vim-lsp-settings'

"HTML tags"
Plug 'alvan/vim-closetag'
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
"=====================================vim-closetag====================================="
""" filenames like *.xml, *.html, *.xhtml, ...
""" These are the file extensions where this plugin is enabled.
"""
""let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'
""
""" filenames like *.xml, *.xhtml, ...
""" This will make the list of non-closing tags self-closing in the specified files.
"""
""let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
""
""" filetypes like xml, html, xhtml, ...
""" These are the file types where this plugin is enabled.
"""
""let g:closetag_filetypes = 'html,xhtml,phtml'
""
""" filetypes like xml, xhtml, ...
""" This will make the list of non-closing tags self-closing in the specified files.
"""
""let g:closetag_xhtml_filetypes = 'xhtml,jsx'
""
""" integer value [0|1]
""" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"""
""let g:closetag_emptyTags_caseSensitive = 1
""
""" dict
""" Disables auto-close if not in a "valid" region (based on filetype)
"""
""let g:closetag_regions = {
""    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
""    \ 'javascript.jsx': 'jsxRegion',
""    \ 'typescriptreact': 'jsxRegion,tsxRegion',
""    \ 'javascriptreact': 'jsxRegion',
""    \ }
""
""" Shortcut for closing tags, default is '>'
"""
""let g:closetag_shortcut = '>'
""
""" Add > at current position without closing the current tag, default is ''
"""
""let g:closetag_close_shortcut = '<leader>>'
""" integer value [0|1]
""" Enables closing tags for React fragments -> <></> for all supported file types
"""
""let g:closetag_enable_react_fragment = 1
""" Disable closing tags for React fragments -> <></> for all supported file types
"""
""let g:closetag_enable_react_fragment = 0
let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,js'
let g:closetag_xhtml_filetype = 'xhtml,jsx,tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
  \ 'typescript.tsx': 'jsxRegion,tsxRegion',
  \ 'javascript.jsx': 'jsxRegion',
  \ }
let g:closetag_shortcut = '>'
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
"Move around in buffer"
nnoremap <C-n> :bprev<CR>
nnoremap <C-m> :bnext<CR>
"NerdTree open"
nnoremap <leader>n :NERDTreeFocus<CR>

"Insert ; to the last pos"
inoremap ; <ESC>A;
xnoremap > >
