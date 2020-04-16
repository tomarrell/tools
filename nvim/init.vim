call plug#begin('~/.local/share/nvim/plugged')
  " Vim markdown viewer
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

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
  Plug 'fatih/vim-go'
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

  " Use release branch (Recommend)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Or build from source code by use yarn: https://yarnpkg.com
  " Plug 'neoclide/coc.nvim', {'do': 'npm install'}

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
nnoremap <SPACE>gt :GoTests<CR>

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

" Restart Coc
nnoremap <SPACE>cs :CocRestart<CR>

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

" Setup vim-go save formatters
let g:go_fmt_options = {
\ 'gofmt': '-s',
\ 'goimports': '',
\ }

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

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" https://github.com/neoclide/coc.nvim#example-vim-configuration
inoremap <silent><expr> <c-space> coc#refresh()

" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" gr - find references
nmap <silent> gr <Plug>(coc-references)

" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <silent> <leader>co :<C-u>CocList outline<cr>
nnoremap <silent> <leader>cs :<C-u>CocList -I symbols<cr>

" List errors
nnoremap <silent> <leader>cl :<C-u>CocList locationlist<cr>

" list commands available in tsserver (and others)
nnoremap <silent> <leader>cc :<C-u>CocList commands<cr>

" restart when tsserver gets wonky
nnoremap <silent> <leader>cR :<C-u>CocRestart<CR>

" view all errors
nnoremap <silent> <leader>cl :<C-u>CocList locationlist<CR>

" manage extensions
nnoremap <silent> <leader>cx :<C-u>CocList extensions<cr>

" rename the current word in the cursor
nmap <leader>cr <Plug>(coc-rename)
nmap <leader>cf <Plug>(coc-format-selected)
vmap <leader>cf <Plug>(coc-format-selected)

" run code actions
vmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>ca <Plug>(coc-codeaction-selected)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go :OR

" Search for selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Cue filetype
autocmd BufRead,BufNewFile *.cue setlocal filetype=cue

