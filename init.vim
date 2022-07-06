" nvim from vim documentation page 
" https://neovim.io/doc/user/nvim.html#nvim-from-vim

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" https://github.com/junegunn/vim-plug
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Note 1:
" some plugins throw out 'deprecated' message
" a way to suppress it is to prepend plugin with `vim-scripts/`
" https://github.com/junegunn/vim-plug/issues/645
" Note 2:
" so, apparently, before installing plugins you have to
" source current file and then run install
" a.) `source %` and then `:PlugInstall` 
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'

" FZF 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Misc
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" this is for autocomplete -- oppose to coc.nvim
" https://github.com/hrsh7th/nvim-cmp

" potentially install https://github.com/neoclide/coc.nvim
" so nvim have language completion and language server attached
" https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/

" Initialize plugin system
call plug#end()

source ~/.vimrc
