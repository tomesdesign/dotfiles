" designed for v9+
" Barebones are used from rwxrob
" https://github.com/rwxrob/dot/blob/main/vim/.vimrc

if has("eval")                               " vim-tiny lacks 'eval'
  let skip_defaults_vim = 1
endif

syntax enable

" Map <space> to leader
let mapleader=" "

" ########################### EXTERNAL PLUGINS ###################################
if filereadable(expand("~/.vim/autoload/plug.vim"))

  call plug#begin('~/.local/share/vim/plugins')

      Plug 'jiangmiao/auto-pairs'
      Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
      Plug 'junegunn/fzf.vim' 
      Plug 'ap/vim-css-color'
      Plug 'tpope/vim-commentary'
      Plug 'itchyny/lightline.vim'
      Plug 'shinchu/lightline-gruvbox.vim'
      Plug 'airblade/vim-gitgutter'
      Plug 'sainnhe/gruvbox-material'
      Plug 'yegappan/lsp'
      Plug 'dense-analysis/ale'

  call plug#end()

  " " color scheme
  colorscheme gruvbox-material
  let g:gruvbox_material_background = 'medium'

  " FZF
  nnoremap <leader>ff :Files<CR>
  nnoremap <leader>fg :GFiles<CR>
  nnoremap <leader>fs :Rg<CR>

  " Lightline
  set laststatus=2
  let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

  " " ale
  set signcolumn=yes
  let g:ale_set_signs = 1
  let g:ale_sign_info = '✨'
  let g:ale_sign_error = '🔥'
  let g:ale_sign_warning = '❗️'
  let g:ale_sign_hint = '💡'

  let g:ale_linters = {
        \'markdown':['lsp'],
        \'python': ['ruff'],
        \}
  let g:ale_linter_aliases = {'bash': 'sh'}

  let g:ale_fixers = {
        \'sh': ['shfmt'],
        \'bash': ['shfmt'],
        \'python': ['ruff'],
        \}

  let g:ale_set_quickfix = 1
  let g:ale_fix_on_save = 1
  " let g:ale_python_flake8_options = '--ignore=E501,W291'
  
endif


" ####################### Vi Compatible (~/.exrc) #######################
" Copy this settings into ~/.exrc on a system where VIM is not available
" number of spaces to replace a tab with
set tabstop=4
set shiftwidth=4
" automatically write files when changing when multiple files open
set autowrite
" activate line numbers
set number
" show command and insert mode
set showmode
" uncomment this for vi
" set verbose
" set leftright
" map tp :?^$?,//!fmt -pw 72
" map tt :%s/[[:space:]]\{1,\}$//g
" set cedit=\
" set filec=\
" set autoindent cedit=

"########################### General  ##################################
" vim hardcodes background color erase even if the terminfo file does not contain bce (not to
" mention that libvte based terminals incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a background color.
let &t_ut=''

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8
set background=dark
set termguicolors

" Better markdown
set conceallevel=2

set nocompatible

" Sets how many lines of history VIM has to remember
set history=500
"Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" better ascii friendly listchars
set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>
" use smartcase when searching
" set smartcase
set smarttab
" disable annoying paste mode
set nopaste
" Always show current position
set ruler
" Height of the command bar
set cmdheight=1
" Fix ^H/backspace not working
set backspace=2
" automatically indent new lines
set autoindent " (alpine)
" set noflash " (alpine-ish only)
set nofoldenable    " disable folding
" replace tabs with spaces automatically
set expandtab " (alpine)
" autowrap text
set textwidth=100
set formatoptions+=t
" more risky, but cleaner
set nobackup
set noswapfile
set nowritebackup
" highlight search hits
set hlsearch
set incsearch
set linebreak
" Avoid most of the 'Hit Enter ...' annoying messages
set shortmess=aoOtTI
" faster scrolling
set ttyfast
" Disable spellcheck
set nospell

"########################### File types ################################
" Enable filetype plugins
filetype plugin on
filetype indent on
" Markdown
" autocmd BufNewFile,BufRead *.md set filetype=markdown
" au FileType markdown set tabstop=2
" au FileType markdown set shiftwidth=2

" Force header files to be C files
au bufnewfile,bufRead *.h set ft=c,cpp

" Do not insert command header on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"########################## Keymaps  ###################################
" I want to stick with the default vi as much as possible
" Disable Arrow keys in insert mode

inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
" Traverse buffers
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
" better list and change buffers
nnoremap <leader>l :ls<CR>:b<space>
" Copy into clipboard
vnoremap <leader>c "+y
nnoremap <leader>c "+y
" Quickfix traversing
nnoremap <leader>j :cn<CR>
nnoremap <leader>k :cp<CR>
" Fixing ctrl ergonomy
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" Find files in path
" nnoremap <leader>ff :find<space>
" " Find strings in files in path
" nnoremap <leader>fs :grep<space>
" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>
set cinoptions+=:0
" Trigger the auto completion with tab 2x
" imap <tab><tab> <c-x><c-o>

" use :f instead of :find
" cabbrev f find

" ##################### Do things without plugins #######################
" INTELLISENSE enable omni-completion
set omnifunc=syntaxcomplete#Complete
" imap <tab><tab> <c-x><c-o>

"" FILES HANDLING
" hit tab to :find by partial match
" " use * to make it fuzzy
" " use :b to autocomplete any open buffer
set path+=**  " search down into subfolders. Provide tab-completion
set wildmenu  " display all matching files when tab complete
" Set pumvisibility for command mode
set wildmode=longest:full,full
set wildoptions=pum
" Ignore folders and files
set wildignore+=*/__pycache__/*,*/.git/*,**/*venv*/*,**/*venv*/**

""" FILE BROWSING
" netrw files browsing. use :edit . or 'e .'
let g:netrw_banner=0 " disable banner
let g:netrw_liststyle=3 " tree view
let g:netrw_list_hide= '.*\.swp$,.*\.DS_Store'

" set ripgrep as default grep
if executable("rg")
  set grepprg=rg\ --vimgrep\ --ignore-case\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Creating viminfo files causes problems when using vim and nvim together
set viminfo=
