call plug#begin('~/.local/share/nvim/plugged')
  " Vim Airline status-bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " File explorer sidebar
  Plug 'scrooloose/nerdtree'

  " Color Schemes
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'kdheepak/monochrome.nvim'
  Plug 'rose-pine/neovim'
  Plug 'EdenEast/nightfox.nvim'

  " Easy modification of bracket pairs
  " read :help surround for detailed information
  Plug 'tpope/vim-surround'

  " Nerd commenter
  Plug 'scrooloose/nerdcommenter'

  " Neovim language server
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer', { 'branch': 'main' }

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " We recommend updating the parsers on update
call plug#end()

set termguicolors
autocmd ColorScheme * highlight CocHighlightText gui=bold guibg=#51517a

" Options available: rafi/awesome-vim-colorschemes
" Old theme: archery
" let g:two_firewatch_italics=1
" colo two-firewatch
colo nordfox
" colo rose-pine
" let g:rose_pine_variant = 'moon'
" let g:airline_theme='alduin'
set background=dark

" Opens NERDTree automatically on startup
autocmd VimEnter * NERDTree

" Sets line numbers at the beginning of each line
set number

" Sets how many lines of history VIM has to remember
set history=500

" Make a copy of the file and overwrite the original one.
" This prevents file watchers from missing the file updated and not triggering a reload.
" I'm looking at you Webpack...
set backupcopy=yes

" Set 7 lines to the cursor - when moving vertically using j/k
set so=10

" Set to auto read when a file is changed from the outside
set autoread

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Height of the command bar
set cmdheight=2

" Turn on the WiLd menu
set wildmenu

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Prevent text wrapping by default... It's annoying
set wrap
" If you do want wrapping, match the indentation
set breakindent
" Break on whole words
set linebreak
" Indent by an additional 2 characters on wrapped lines,
" when line >= 40 characters, put 'showbreak' at start of line
" set breakindentopt=shift:2,min:40,sbr
" Append '>>' to indent
" set showbreak=>>

" Go between visual lines instead of physical lines
noremap j gj
noremap k gk

" Set highlight for searching
set hlsearch

nnoremap j :noh<return>j

" No annoying sound on errors
set noerrorbells
set novisualbell

" Add a bit extra margin to the left
set foldcolumn=1
set nofoldenable

" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

set ai " Auto indent
set si " Smart indent

" Auto wrap comments at 80 chars
set tw=80

" NERD Commenter
" Enable filetype plugins
filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims=1

" Prevent vim-nerdtree-tabs from autoclosing vim when NERDTree is last buffer
let g:nerdtree_tabs_autoclose=0

" Setup easy cd command to current file directory
nnoremap ,cd :cd %:p:h<CR>

" ||======================||
" || Emacs Style Bindings ||
" ||======================||

" NerdTree mappings
nnoremap <C-n><C-n> :NERDTree<CR>
nnoremap <C-n><C-t> :NERDTreeToggle<CR>
nnoremap <SPACE>nn :NERDTree<CR>
nnoremap <SPACE>nt :NERDTreeToggle<CR>
nnoremap <SPACE>nf :NERDTreeFind<CR>
nnoremap <SPACE>cd :execute 'cd %:p:h'<CR>

" Jump back to previous file
nnoremap <C-p> <C-^>

" Quit buffer
nnoremap <SPACE>qq :q<CR>

" Close quickfix, location list and preview windows
nnoremap <SPACE>cc :ccl<CR>:pc<CR>:lclose<CR>

" Format JSON quickbind, first is for line, second for file
nnoremap <SPACE>fj :.!python -m json.tool<CR>
nnoremap <SPACE>ff :%!python -m json.tool<CR>

" Edit this file
nnoremap <SPACE>ev :vnew<CR><C-w>L:e $MYVIMRC<CR>

" Toggle file wrapping
nnoremap <SPACE>ww :set wrap!<CR>

" Remove highlights
nnoremap <SPACE>rh :nohl<CR>

" ||====================||
" || End Emacs bindings ||
" ||====================||

" Vertical resize mappings
nnoremap - :vert res -10<CR>
nnoremap _ :vert res -10<CR>
nnoremap + :vert res +10<CR>

" Use jj as escape to prevent pinky finger
inoremap jk <Esc>
" Set escape to nothing to prevent muscle memory
inoremap <Esc> <nop>

" Insert Date with CTRL+d in insert mode
imap <C-d> <C-R>=strftime("%FT%T%z")<CR>

" Close preview window after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

" Delete whitespace
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

nnoremap <SPACE>rw :call DeleteTrailingWS()<CR>

" Cursorline
set nocursorline
hi CursorLine term=bold cterm=bold

" ||=================||
" || Language Server ||
" ||=================||

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gh', ':lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gy', ':lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', ':lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>f', ':lua vim.lsp.buf.formatting()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'gopls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = on_attach,
    indent = { enable = true },
    capabilities = capabilities
  })
end


local ts = require('nvim-treesitter.configs')
ts.setup({
  ensure_installed = 'maintained',
  highlight = { enable = true },
  rainbow = { enable = true },
})
EOF

" Find files using Telescope command-line sugar.
nnoremap <space>pf :Telescope find_files<cr>
nnoremap <space>pg :Telescope live_grep<cr>
nnoremap <space>pb :Telescope buffers<cr>
nnoremap <space>ph :Telescope help_tags<cr>
