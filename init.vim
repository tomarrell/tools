call plug#begin('~/.local/share/nvim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/goyo.vim'

  Plug 'yuttie/comfortable-motion.vim'
  Plug 'ramitos/jsctags'
  Plug 'w0rp/ale'

  " Solarized Color Scheme
  Plug 'iCyMind/NeoSolarized'

  " NerdTree vim tabs
  Plug 'jistr/vim-nerdtree-tabs'

  " Vim Airline status-bar
  Plug 'bling/vim-airline'

  " Easy modification of bracket pairs
  " read :help surround for detailed information
  Plug 'tpope/vim-surround'

  " The best Git wrapper of all time
  Plug 'tpope/vim-fugitive'

  " Nerd commenter
  Plug 'scrooloose/nerdcommenter'

  " Fuzzy file find
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Javascript + syntax highlighting
  Plug 'pangloss/vim-javascript'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'elzr/vim-json'
  " Get out of here with that includeexpr override... temporarily
  " Plug 'moll/vim-node'
  Plug 'mxw/vim-jsx'
  " Javascript smart gf
  Plug 'tomarrell/vim-npr'

  " Go
  Plug 'fatih/vim-go'
call plug#end()


" Solarized color scheme setup
colorscheme NeoSolarized
let g:neosolarized_contrast = "high"
set background=dark

" Opens NERDTree automatically on startup
autocmd VimEnter * NERDTree

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

" Prevents highlight of text when searching
set nohlsearch

" No annoying sound on errors
set noerrorbells
set novisualbell

" Add a bit extra margin to the left
set foldcolumn=1

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
set wrap " Wrap lines

" NERD Commenter
" Enable filetype plugins
filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Setup smooth scroll
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>

nnoremap <silent> <C-f> :call comfortable_motion#flick(200)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-200)<CR>

" Prevent vim-nerdtree-tabs from autoclosing vim when NERDTree is last buffer
let g:nerdtree_tabs_autoclose=0

" Allow JSX syntax highlighting in files without .jsx extension i.e. .js files
let g:jsx_ext_required = 0

" Setup easy cd command to current file directory
nnoremap ,cd :cd %:p:h<CR>

" Max number of directory levels gf will traverse upwards
" to find a package.json file.
let g:find_file_max_levels = 5
" Default file names to try if gf is run on a directory rather than a specific file.
" Checked in order of appearance. Empty string to check for exact file match first.
let g:find_file_file_names = ["", ".js", "/index.js"]

function! FindFileJS(fname) abort
  let foundPackage = 0
  let levels = 0

  " Traverse up directories and attempt to find package.json
  while foundPackage != 1 && levels < g:find_file_max_levels
    echo levels
    let levels = levels + 1
    let foundPackage = filereadable(expand('%:p'.repeat(':h', levels)) . '/package.json')
  endwhile

  if foundPackage == 0
    echo "Failed to find package.json, try increasing the levels."
    return a:fname
  endif

  " Handy paths to package.json and parent dir
  let packagePath = globpath(expand('%:p'.repeat(':h', levels)), 'package.json')
  let packageDir = fnamemodify(packagePath, ':h')

  try
    let resolveDirs = json_decode(join(readfile(packagePath))).resolve
  catch
    echo "Couldn't find 'resolve' key in package.json"
    return a:fname
  endtry

  echo resolveDirs

  " Iterate over potential directories and search for the file
  for dir in resolveDirs
    let possiblePath = packageDir . "/" . dir . "/" . a:fname
    echo possiblePath

    for filename in g:find_file_file_names
      if filereadable(possiblePath . filename)
        return possiblePath . filename
      endif
    endfor
  endfor

  " echo "FindFileJS failed to find file specified."
  return a:fname
endfunction

 set includeexpr=FindFileJS(v:fname)

