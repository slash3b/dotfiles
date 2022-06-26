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

Plug 'tpope/vim-sensible'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'vim-unimpaired'
Plug 'vim-repeat'
Plug 'vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'

" All thing telescope related
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'kyazdani42/nvim-web-devicons'

" this is for autocomplete -- oppose to coc.nvim
" https://github.com/hrsh7th/nvim-cmp

" potentially install https://github.com/neoclide/coc.nvim
" so nvim have language completion and language server attached
" https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/

" Initialize plugin system
call plug#end()


"
" Telescope and its plugins set up
"
lua <<EOF

local actions = require('telescope.actions')

require('telescope').setup{
    defaults = {
        prompt_prefix = ">> ",
        mappings = {
            i = {
                ["<esc>"] = actions.close
            }
        }
    }
}
require('telescope').load_extension('fzf')
EOF
