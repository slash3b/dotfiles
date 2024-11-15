" do not store file
set noswapfile
" Set to auto read when a file is changed from the outside
set autoread
" Set 5 lines to the cursor - when moving vertically using j/k
set so=5

"""""""""""""""""""""""""""""""""""""""""""""""
" => configure editor with tabs and nice stuff
"""""""""""""""""""""""""""""""""""""""""""""""

set expandtab           " enter spaces when tab is pressed
" set textwidth=120       " break lines when line length increases
set tabstop=4           " use 2 character space to represent tab
set softtabstop=4       " tab is 2 spaces long 
set shiftwidth=4        " number of spaces to use for auto indent

set smartindent         " smart indent : )
set noerrorbells        " no bells and whistles  

set number              " line numbers on 
set nowrap              " no wrapping 
set incsearch           " incremental search is on

" set map leader
let mapleader=","

" hit F2 in insert mode to paste corretly data
set pastetoggle=<F2>

" fold enabled using indent
set foldmethod=indent
" do not fold by default
set foldlevel=99

" always display a status line
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Related Configs
"""""""""""""""""""""""""""""""""""""""""""""""

" NERD tree 
nnoremap <leader>n <cmd>NERDTreeToggle<cr>
" show hidden files by default
let NERDTreeShowHidden=1

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=1
" automatically delete buffer if file was deleted
let NERDTreeAutoDeleteBuffer = 1
" a bit prettier tree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" FZF
nnoremap <leader>f <cmd>Files<cr>
nnoremap <leader>b <cmd>Buffers<cr>
nnoremap <leader>r <cmd>Rg<cr>

"""""""""""""""""""""""""""""""""""""""""""""""
" => Visuals
"""""""""""""""""""""""""""""""""""""""""""""""

" 256 colors
set t_Co=256

" toggle invisible characters
set invlist
set list
set listchars=tab:¦\ ,trail:⋅,extends:❯,precedes:❮

" colorize what exceeds 120 char line
set colorcolumn=120

colorscheme monochrome

let loaded_matchparen=1

"""""""""""""""""""""""""""""""""""""""""""""""
" => References
"""""""""""""""""""""""""""""""""""""""""""""""

" https://github.com/lucasfcosta/dotfiles/blob/master/.config/nvim/init.vim#L85
