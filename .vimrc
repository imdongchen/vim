set number
colorscheme desert
set nowrap
filetype plugin indent on " load filetype plugins/indent settings
set incsearch " BUT do highlight as you type you 
set numberwidth=5 " We are good up to 99999 lines
set scrolloff=10 " Keep 10 lines (top/bottom) for scope
set showmatch " show matching brackets
set sidescrolloff=10 " Keep 5 lines at the size
set ignorecase " case insensitive by default
set infercase " case inferred by default
set smartcase " if there are caps, go case-sensitive
set shiftwidth=4 " auto-indent amount when using cindent, 
set softtabstop=4 " when hitting tab or backspace, how many spaces 
set tabstop=8 " real tabs should be 8, and they will show with 
set foldenable " Turn on folding
set foldmarker={,} " Fold C style code (only use this as default 
set foldmethod=marker " Fold on the marker
set foldlevel=100 " Don't autofold anything (but I can still 
set foldopen=block,hor,mark,percent,quickfix,tag " what movements
function SimpleFoldText() " {
return getline(v:foldstart).' '
endfunction " }
set foldtext=SimpleFoldText() " Custom fold text function 
map <down> <ESC>:bn<RETURN>
map <up> <ESC>:bp<RETURN>

" use Ctags: <C-ww> to switch between windows, <C-]> to jump to tag when the
" cursor is over a word, and <C-t> to go back. Pressing <space> on a function
" name in the tag list shows the function signature
syntax on
filetype on
filetype plugin indent on
call pathogen#incubate()
call pathogen#helptags()
call pathogen#infect()
" bind F8 to ctags command to re-generate tags on the fly
nnoremap <F8> :!/opt/local/bin/ctags -R --python-kinds=-i *.py<CR>
" bind F4 to :TlistToggle
nnoremap <F9> :TlistToggle<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete
inoremap <C-space> <C-x><C-o>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
"
" When writing a file, if there are errors, have Syntastic plugin mark them
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']

" auto set working directory to current file
autocmd BufEnter * silent! lcd %:p:h
