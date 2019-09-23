call plug#begin('~/.local/share/nvim/plugged')
  " Look into https://vimawesome.com/plugin/vim-polyglot
  Plug 'sheerun/vim-polyglot'

  " Vim markdown viewer
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

  " Vim Airline status-bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Vim incsearch
  Plug 'haya14busa/is.vim'

  " Async command runner
  " Look at https://github.com/skywind3000/asyncrun.vim
  Plug 'skywind3000/asyncrun.vim'

  " File explorer sidebar
  Plug 'scrooloose/nerdtree'

  " 'Distraction free editing'
  Plug 'junegunn/goyo.vim'

  " Plug 'yuttie/comfortable-motion.vim'

  " Javascript tags
  Plug 'ramitos/jsctags'

  " Vim REST client
  Plug 'diepm/vim-rest-console'

  " Asynchronous linting
  Plug 'w0rp/ale', { 'tag': 'v2.5.0' }

  " Magit inside Vim
  Plug 'jreybert/vimagit', { 'branch': 'next' }

  "" Color Schemes
  " Solarized Color Scheme
  Plug 'iCyMind/NeoSolarized'
  " Lots of colors
  Plug 'rafi/awesome-vim-colorschemes'
  " Nova color scheme
  Plug 'trevordmiller/nova-vim'

  " NerdTree vim tabs
  " Plug 'jistr/vim-nerdtree-tabs'

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
  Plug 'heavenshell/vim-jsdoc'
  Plug 'elzr/vim-json'
  Plug 'moll/vim-node'
  Plug 'mxw/vim-jsx'
  " Javascript smart gf
  Plug 'tomarrell/vim-npr'

  " Go
  Plug 'fatih/vim-go'

  " Rust
  Plug 'rust-lang/rust.vim'
  Plug 'timonv/vim-cargo'
  " Plug 'racer-rust/vim-racer'

  " Automcomplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Typescript
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'leafgarland/typescript-vim'

  " Markdown Table
  Plug 'dhruvasagar/vim-table-mode'
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

" Set completeoptions
set completeopt=menu,preview,noinsert,noselect

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

" Insert Date with CTRL+d in insert mode
imap <C-d> <C-R>=strftime("%FT%T%z")<CR>

" Deoplete Autocompletion
let g:deoplete#enable_at_startup=1

call deoplete#custom#option({
\ 'auto_complete_delay': 200,
\ 'refresh_always': v:true,
\ })

call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" Close preview window after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

" Delete whitespace
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

nnoremap <SPACE>rw :call DeleteTrailingWS()<CR>

" Setup vim-go save formatters
let g:go_fmt_options = {
\ 'gofmt': '',
\ 'goimports': '',
\ }


" ALE Linting and Language Server configuration
let g:ale_linters = {
\ 'rust': ['rls'],
\ 'ruby': ['solargraph'],
\ 'javascript': ['eslint', 'flow', 'flow-language-server', 'jscs', 'jshint', 'standard', 'xo'],
\ 'go': ['gofmt', 'golint', 'gopls', 'govet'],
\ 'css': ['stylelint']
\}

" ALE Fixers
let g:ale_fixers = {
\ 'css': ['stylelint', 'prettier'],
\ 'javascript': ['prettier'],
\ 'go': ['goimports']
\}

let g:ale_fix_on_save = 1

let g:ale_rust_rls_toolchain = 'stable'

let g:ale_set_loclist = 0

" Markdown table support
let g:table_mode_corner='|'

" Golang break single line into newlines
" e.g. struct{}{test:"something", cool:"another"}
" to   struct{}{
"         test:"something",
"         cool:"another"
"      }
nnoremap gob :s/\({\zs\\|,\ *\zs\\|}\)/\r&/g<CR><Bar>:'[,']normal ==<CR> :nohl<CR>

" Stop LSPs
nnoremap gq :ALEStopAllLSPs<CR>

" Set gd as ALEGoToDefinition
nnoremap gd :ALEGoToDefinition<CR>

" Set gh as ALEHover
nnoremap gh :ALEHover<CR>

" Set gr as ALEFindReferences
nnoremap gr :ALEFindReferences<CR>
