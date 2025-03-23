" designed for v9+
" Barebones are used from rwxrob
" https://github.com/rwxrob/dot/blob/main/vim/.vimrc

" Do not mess the home folder
set viminfofile=~/.vim/viminfo


syntax enable

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

" Fallback colorscheme
color retrobox
set background=dark
set termguicolors

if has("eval")                               " vim-tiny lacks 'eval'
  let skip_defaults_vim = 1
endif
set nocompatible
let mapleader=" "
" Sets how many lines of history VIM has to remember
set history=500
" Enable filetype plugins
filetype plugin on
filetype indent on
"Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" better ascii friendly listchars
set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>


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
  Plug 'lervag/wiki.vim'
  Plug 'yegappan/lsp'
  Plug 'fatih/vim-go'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'rwxrob/vim-pandoc-syntax-simple'
  call plug#end()

  " color scheme
  colorscheme gruvbox-material
  let g:gruvbox_material_background = 'medium'

  " FZF
  nnoremap <leader>ff :Files<CR>
  nnoremap <leader>fg :GFiles<CR>
  nnoremap <leader>fs :Rg!

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
  " Wiki 
  let g:wiki_root = expand("%:p:h")
  let g:wiki_filetypes=["md"]
  let g:wiki_link_target_type='md'
  let g:wiki_mappings_use_defaults='all'
  let g:wiki_mappings_local = {
        \ '<plug>(wiki-journal-prev)' : '<c-h>',
        \ '<plug>(wiki-journal-next)' : '<c-l>',
        \}
  call wiki#init#option('wiki_index_name', 'contents')
  call wiki#init#option('wiki_journal', {
        \ 'name' : 'journals',
        \ 'root' : '',
        \ 'frequency' : 'daily',
        \ 'date_format' : {
        \   'daily' : '%Y_%m_%d',
        \   'weekly' : '%Y_w%V',
        \   'monthly' : '%Y_m%m',
        \ },
        \})
  " pandoc
  let g:pandoc#formatting#mode = 'h' " A'
  let g:pandoc#formatting#textwidth = 72
  " golang
  let g:go_fmt_fail_silently = 0
  "let g:go_fmt_options = '-s'
  let g:go_fmt_command = 'goimports'
  let g:go_fmt_autosave = 1
  let g:go_gopls_enabled = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_variable_declarations = 1
  let g:go_highlight_variable_assignments = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_diagnostic_errors = 1
  let g:go_highlight_diagnostic_warnings = 1
  let g:go_code_completion_enabled = 1
  let g:go_doc_popup_window = 1
  let g:go_auto_sameids = 0
  let g:go_def_mode='gopls'
  let g:go_info_mode='gopls'
  set updatetime=100
  " enable omni-completion
  " set omnifunc=syntaxcomplete#Complete
  " imap <tab><tab> <c-x><c-o>
endif

" ####################### Vi Compatible (~/.exrc) #######################
" Copy this settings into ~/.exrc on a system where VIM is not available
" number of spaces to replace a tab with
set tabstop=2
set shiftwidth=2
" use smartcase when searching
set ignorecase
set smartcase
set smarttab
" automatically write files when changing when multiple files open
set autowrite
" activate line numbers
set number
set relativenumber
" turn col and row position on in bottom right
set ruler " see ruf for formatting
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
autocmd BufNewFile,BufRead *.py set filetype=python 
autocmd BufNewFile,BufRead *.go set filetype=go
"Setup for C and Python
au FileType c,cpp,python set tabstop=4
au FileType c,cpp,python set shiftwidth=4
" Force header files to be C files
au bufnewfile,bufRead *.h set ft=c,cpp

" common go macros
au FileType go nmap <leader>m ilog.Print("made")<CR><ESC>
au FileType go nmap <leader>n iif err != nil {return err}<CR><ESC>

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
" Save
nmap <leader>s :w!<cr>
" Copy into clipboard
vnoremap <leader>c "+y
nnoremap <leader>c "+y
" use :f instead of :find
cabbrev f find
" Moving lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
" Find files in path
" nnoremap <leader>ff :find<space>
" Find strings in files in path
" nnoremap <leader>fs :grep<space>
" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>
set cinoptions+=:0
" Quickfix traversing
nnoremap <leader>j :cn<CR>
nnoremap <leader>k :cp<CR>
" Fixing ctrl ergonomy
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz



"##################### Do things without plugins #######################

"" FILES HANDLING
" hit tab to :find by partial match
" " use * to make it fuzzy
" " use :b to autocomplete any open buffer
set path+=**  " search down into subfolders. Provide tab-completion
set wildmenu  " display all matching files when tab complete
" Set pumvisibility for command mode
set wildmode=longest:full,full
set wildoptions=pum

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

"################### Language Server Settings ##########################
" Set LSP options
let lspOpts = #{
      \ autoHighlightDiags: v:true,
      \   diagSignErrorText: '🔥',
      \   diagSignHintText: '💡',
      \   diagSignInfoText: '✨',
      \   diagSignWarningText: '❗️',
      \}
autocmd User LspSetup call LspOptionsSet(lspOpts)

" Define all your language servers in one list
let lspServers = [
      \ #{
      \   name: 'clang',
      \   filetype: ['c', 'cpp'],
      \   path: '/usr/bin/clangd',
      \   args: ['--background-index']
      \ },
      \ #{
      \   name: 'typescriptlang',
      \   filetype: ['javascript', 'typescript', 'javascriptreact', 'typescriptreact'],
      \   path: '/opt/homebrew/bin/typescript-language-server',
      \   args: ['--stdio']
      \ },
      \ #{
      \   name: 'vimls',
      \   filetype: ['vim'],
      \   path: '/Users/martin/.yarn/bin/vim-language-server',
      \   args: ['--stdio']
      \ },
      \ #{
      \   name: 'bashls',
      \   filetype: ['sh'],
      \   path: '/Users/martin/.yarn/bin/bash-language-server',
      \   args: ['start']
      \ },
      \ #{
      \   name: 'pylsp',
      \   filetype: ['python'],
      \   path: '/opt/homebrew/bin/pylsp',
      \   args: []
      \ },
      \ #{
      \   name: 'rustanalyzer',
      \   filetype: ['rust'],
      \   path: '/Users/martin/.cargo/bin/rust-analyzer',
      \   args: [],
      \   syncInit: v:true,
      \   initializationOptions: #{
      \    inlayHints: #{
      \      typeHints: #{
      \        enable: v:true
      \      },
      \      parameterHints: #{
      \        enable: v:true
      \      }
      \    },
      \  },
      \ },
      \ #{
      \   name: 'gopls',
      \   filetype: 'go',
      \   path: '/Users/martin/go/bin/gopls',
      \   args: ['serve']
      \ }
      \]

"Add all servers at once
autocmd User LspSetup call LspAddServer(lspServers)

" Key Bindings
nnoremap K :LspHover<CR>
