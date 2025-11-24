" nvim from vim documentation page 
" https://neovim.io/doc/user/nvim.html#nvim-from-vim

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" ctags setup
set tags=./tags;
" gd = go to definition via ctags
nnoremap <silent> gd <C-]>
" gD = go back in tag stack
nnoremap <silent> gD <C-t>


"
" auto install
" source: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" https://github.com/junegunn/vim-plug
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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
Plug 'christoomey/vim-tmux-navigator'

" Monochrome theme
Plug 'fxn/vim-monochrome'

" alabaster theme
Plug 'https://git.sr.ht/~p00f/alabaster.nvim'

" FZF 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Misc
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Hightlight yanked text
Plug 'machakann/vim-highlightedyank'

" Vim HardTime
Plug 'takac/vim-hardtime'

" this is for autocomplete -- oppose to coc.nvim
" https://github.com/hrsh7th/nvim-cmp

" potentially install https://github.com/neoclide/coc.nvim
" so nvim have language completion and language server attached
" https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/

" Initialize plugin system
call plug#end()

" has to be in the end, to be able to pick up all the plugins above
source ~/.vimrc
