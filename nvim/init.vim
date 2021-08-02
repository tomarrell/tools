call plug#begin('~/.local/share/nvim/plugged')
  " Vim markdown viewer
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

  " Cnext etc
  Plug 'tpope/vim-unimpaired'

  " Spell check
  Plug 'dpelle/vim-LanguageTool'

  Plug 'neovim/nvim-lsp'
  Plug 'nvim-lua/completion-nvim'
  " Plug 'davidhalter/jedi-vim'
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'Shougo/deoplete-lsp'

  " Vim Airline status-bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Vim incsearch
  Plug 'haya14busa/is.vim'

  " Case converter
  Plug 'nicwest/vim-camelsnek'

  " Async command runner
  " Look at https://github.com/skywind3000/asyncrun.vim
  Plug 'skywind3000/asyncrun.vim'

  " File explorer sidebar
  Plug 'scrooloose/nerdtree'

  " 'Distraction free editing'
  Plug 'junegunn/goyo.vim'

  " Javascript tags
  Plug 'ramitos/jsctags'

  " Vim REST client
  Plug 'diepm/vim-rest-console'

  "" Color Schemes
  " Lots of colors
  Plug 'rafi/awesome-vim-colorschemes'

  " Easy modification of bracket pairs
  " read :help surround for detailed information
  Plug 'tpope/vim-surround'

  " Vim align
  Plug 'junegunn/vim-easy-align'

  " The best Git wrapper of all time
  Plug 'tpope/vim-fugitive'

  " Used for :Gbrowse in Fugitive
  Plug 'tpope/vim-rhubarb'

  " Nerd commenter
  Plug 'scrooloose/nerdcommenter'

  " Fuzzy file find
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Javascript + syntax highlighting
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'elzr/vim-json'
  Plug 'moll/vim-node'
  " Javascript smart gf
  Plug 'tomarrell/vim-npr'

  " Go
  " Plug 'fatih/vim-go'
  " Go test auto generation
  Plug 'buoto/gotests-vim'

  " Rust
  Plug 'rust-lang/rust.vim'
  Plug 'timonv/vim-cargo'
  " Plug 'racer-rust/vim-racer'

  " Typescript
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'leafgarland/typescript-vim'

  " Markdown Table
  Plug 'dhruvasagar/vim-table-mode'

  Plug 'jjo/vim-cue'

  Plug 'sheerun/vim-polyglot', { 'do' : './build' }
call plug#end()

set termguicolors

" Options available: rafi/awesome-vim-colorschemes
" Old theme: archery
let g:two_firewatch_italics=1
colo two-firewatch
let g:airline_theme='alduin'
set background=dark
" colorscheme nova

" Turn off vim-go `gd` hijacking
let g:go_def_mapping_enabled=0
let g:go_metalinter_autosave=0

" Opens NERDTree automatically on startup
autocmd VimEnter * NERDTree

" Set AsyncRun to open QuickFix buffer
let g:asyncrun_open=8
let g:asyncrun_stdin=0


" Setup vim align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Sets line numbers at the beginning of each line
set number

" Sets how many lines of history VIM has to remember
set history=500

" Make a copy of the file and overwrite the original one. This prevents file watchers from missing the file updated and not triggering a reload. I'm looking at you Webpack...
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

" No annoying sound on errors
set noerrorbells
set novisualbell

" Add a bit extra margin to the left
set foldcolumn=1
set nofoldenable

" Enable syntax highlighting
syntax enable

" Enable flow syntax highlighting
let g:javascript_plugin_flow=1

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

" Allow JSX syntax highlighting in files without .jsx extension i.e. .js files
let g:jsx_ext_required=0

" Setup easy cd command to current file directory
nnoremap ,cd :cd %:p:h<CR>

" Tidy HTML Command
:command! Thtml :%!tidy -q -mi -wrap 0 --show-errors 0

autocmd Filetype html,gohtmltmpl set formatoptions-=t

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

" Git mappings
nnoremap <SPACE>gs :Gstatus<CR>
nnoremap <SPACE>ga :Gwrite<CR>
nnoremap <SPACE>gp :AsyncRun git push<CR>
nnoremap <SPACE>gl :AsyncRun git pull<CR>

" Go mappings
nnoremap <SPACE>gt :GoTestFunc<CR>
nnoremap <SPACE>fe ddkoreturn fmt.Errorf(": %v", err)<ESC>T:hi

" Jump back to previous file
nnoremap <C-p> <C-^>

" Quit buffer
nnoremap <SPACE>qq :q<CR>

" Async run command under cursor or highlighted selection
noremap <SPACE>br :.AsyncRun -raw zsh<CR>
noremap <SPACE>bs :.AsyncRun -raw cat<CR>

" Close quickfix, location list and preview windows
nnoremap <SPACE>cc :ccl<CR>:pc<CR>:lclose<CR>

" Rest client
map <SPACE>jj :call VrcQuery()<CR>

" FZF Quick bind
nnoremap <SPACE>pf :FZF<CR>
" Print current file path
nnoremap <SPACE>pd :echo @%<CR>

" Ag Quick bind
nnoremap <SPACE>sp :Ag<CR>

" Format JSON quickbind, first is for line, second for file
nnoremap <SPACE>fj :.!python -m json.tool<CR>
nnoremap <SPACE>ff :%!python -m json.tool<CR>

" Rust Bindings
nnoremap <SPACE>rf :%!rustfmt<CR>
nnoremap <SPACE>rr :CargoRun<CR>

" Table mode bindings
nnoremap <SPACE>tt :TableModeToggle<CR>

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

" Insert date with CTRL+d in insert mode
inoremap <C-d> <C-R>=strftime("%F %T %z")<CR>
" Insert human readable date with CTRL+r in insert mode
inoremap <C-r> <C-R>=strftime("%c")<CR>

" Close preview window after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

" Format *.go files on save
" autocmd BufWritePost *.go %!gofumpt

" Delete whitespace
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

nnoremap <SPACE>rw :call DeleteTrailingWS()<CR>

" Setup vim-go save formatters
let g:go_fmt_options = {
\ 'gofmt': '-s',
\ 'goimports': '',
\ }

let g:go_fmt_command = "goimports"

" Markdown table support
let g:table_mode_corner='|'

" Golang break single line into newlines
" e.g. struct{}{test:"something", cool:"another"}
" to   struct{}{
"         test:"something",
"         cool:"another"
"      }
nnoremap gob :s/\({\zs\\|,\ *\zs\\|}\)/\r&/g<CR><Bar>:'[,']normal ==<CR> :nohl<CR>

" Cursorline
set nocursorline
hi CursorLine term=bold cterm=bold

" Search for selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Cue filetype
autocmd BufRead,BufNewFile *.cue setlocal filetype=cue

"
" NVIM LSP
"
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { }

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead  gui=bold guibg=#51517a " original: #5f5f87
      hi LspReferenceText  gui=bold guibg=#51517a
      hi LspReferenceWrite gui=bold guibg=#51517a
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "gopls", "terraformls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gy <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gw <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gn <cmd>lua vim.lsp.buf.rename()<CR>
inoremap <silent> <c-f> <cmd>lua vim.lsp.buf.signature_help()<CR>

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

set completeopt+=menuone,noselect,noinsert

