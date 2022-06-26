" nvim from vim documentation page 
" https://neovim.io/doc/user/nvim.html#nvim-from-vim

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" https://github.com/junegunn/vim-plug
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'

" some plugins throw out 'deprecated' message
" a way to suppress it is to prepend plugin with `vim-scripts/`
" https://github.com/junegunn/vim-plug/issues/645
Plug 'vim-scripts/vim-unimpaired'
Plug 'vim-scripts/vim-repeat'
Plug 'vim-scripts/vim-easymotion'
Plug 'airblade/vim-gitgutter'

" FZF 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Misc
Plug 'kyazdani42/nvim-web-devicons'

" this is for autocomplete -- oppose to coc.nvim
" https://github.com/hrsh7th/nvim-cmp

" potentially install https://github.com/neoclide/coc.nvim
" so nvim have language completion and language server attached
" https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/

" Initialize plugin system
call plug#end()
