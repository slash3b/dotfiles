" do not store file
set noswapfile
" Set to auto read when a file is changed from the outside
set autoread
" Set 5 lines to the cursor - when moving vertically using j/k
set so=5

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 2 character space to represent tab
set softtabstop=4       " tab is 2 spaces long 
set shiftwidth=4        " number of spaces to use for auto indent

set smartindent         " smart indent : )
set noerrorbells        " no bells and whistles  

set number              " line numbers on 
set relativenumber      " use relative numbers
set nowrap              " no wrapping 
set incsearch           " incremental search is on
set ruler               " ruler that shows your position in the file

" set map leader
let mapleader=","


" hit F2 in insert mode to paste corretly data
set pastetoggle=<F2>

" turn off all the colors
syntax off

" from mastering vim book
packloadall " load all plugins 
silent! helptags ALL " load help files for all plugins

set foldmethod=indent
" always display a status line
set laststatus=2

if has('nvim')
    nnoremap <leader>ff <cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>
    nnoremap <leader>fo <cmd>Telescope file_browser<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif

" install:
" vim-unimpaired
" vim-repeat
" vim-easymotion
" airblade/vim-gitgutter
" ctrl-p
" commentary vim
"

" this is for yaml to be nice
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

nmap <F6> :NERDTreeToggle<CR>

nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>p :CtrlP<cr>

