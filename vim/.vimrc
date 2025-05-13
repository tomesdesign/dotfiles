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
" color retrobox
set background=dark
set termguicolors

" Better markdown
set conceallevel=2

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
  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Plug 'junegunn/fzf.vim' 
  Plug 'ap/vim-css-color'
  Plug 'tpope/vim-commentary'
  Plug 'itchyny/lightline.vim'
  Plug 'shinchu/lightline-gruvbox.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'sainnhe/gruvbox-material'
  " Plug 'yegappan/lsp'
  Plug 'fatih/vim-go'
  Plug 'dense-analysis/ale'
  if has('nvim')
    Plug 'hrsh7th/nvim-cmp'
    Plug 'epwalsh/obsidian.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'MeanderingProgrammer/render-markdown.nvim'
  endif
  call plug#end()

  " color scheme
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
  " let g:currentmode = {
  "   \ 'n'  : 'NORMAL ',
  "   \ 'v'  : 'VISUAL ',
  "   \ 'V'  : 'V-LINE ',
  "   \ 'i'  : 'INSERT ',
  "   \ 'R'  : 'REPLACE ',
  "   \ 'c'  : 'COMMAND ',
  "   \}

  " " Set up statusline with current mode and additional info
  " set statusline=%#ModeColor#%{g:currentmode[mode()]}
  " set statusline+=\ %f\ %l/%L " Filename and line numbers
  " let g:lightline = {
  "       \ 'colorscheme': 'acme',
  "       \ 'active': {
  "       \   'left': [ [ 'mode', 'paste' ],
  "       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  "       \ },
  "       \ 'component_function': {
  "       \   'gitbranch': 'FugitiveHead'
  "       \ },
  "       \ }
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

  " ale
  set signcolumn=yes
  let g:ale_set_signs = 1
  let g:ale_sign_info = '✨'
  let g:ale_sign_error = '🔥'
  let g:ale_sign_warning = '❗️'
  let g:ale_sign_hint = '💡'

  let g:ale_linters = {
        \'go': ['gometalinter','gofmt','gobuild'],
        \'perl': ['perl','perlcritic'],
        \'markdown':['lsp'],
        \}
  let g:ale_linter_aliases = {'bash': 'sh'}
  let g:ale_perl_perlcritic_options = '--severity 3'

  let g:ale_fixers = {
        \'sh': ['shfmt'],
        \'bash': ['shfmt'],
        \'perl': ['perltidy'],
        \}
  " Configure ALE to use Marksman as the LSP server
  let g:ale_lsp_server = {
      \ 'markdown': 'marksman',
  \ }
  let g:ale_set_quickfix = 1
  let g:ale_fix_on_save = 1
  let g:ale_perl_perltidy_options = '-b'
  
endif

" ####################### Vi Compatible (~/.exrc) #######################
" Copy this settings into ~/.exrc on a system where VIM is not available
" number of spaces to replace a tab with
set tabstop=4
set shiftwidth=4
" set ignorecase
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
" use smartcase when searching
" set smartcase
set smarttab
" Set relative number
" set relativenumber
" turn col and row position on in bottom right
" set ruler " see ruf for formatting
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
" Markdown
" autocmd BufNewFile,BufRead *.md set filetype=markdown
" au FileType markdown set tabstop=2
" au FileType markdown set shiftwidth=2
" Force header files to be C files
au bufnewfile,bufRead *.h set ft=c,cpp

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
nnoremap <leader>ff :find<space>
" Find strings in files in path
nnoremap <leader>fs :grep<space>
" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>
set cinoptions+=:0
" Trigger the auto completion with tab 2x
imap <tab><tab> <c-x><c-o>

au FileType go nmap <leader>n iif err != nil {return err}<CR><ESC>
" use :f instead of :find
" cabbrev f find

" ##################### Do things without plugins #######################
" INTELLISENSE enable omni-completion
" set omnifunc=syntaxcomplete#Complete
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
" let lspOpts = #{
"       \ autoHighlightDiags: v:true,
"       \   diagSignErrorText: '🔥',
"       \   diagSignHintText: '💡',
"       \   diagSignInfoText: '✨',
"       \   diagSignWarningText: '❗️',
"       \}
" autocmd User LspSetup call LspOptionsSet(lspOpts)

" " Define all your language servers in one list
" let lspServers = [
"       \ #{
"       \   name: 'clang',
"       \   filetype: ['c', 'cpp'],
"       \   path: '/usr/bin/clangd',
"       \   args: ['--background-index']
"       \ },
"       \ #{
"       \   name: 'typescriptlang',
"       \   filetype: ['javascript', 'typescript', 'javascriptreact', 'typescriptreact'],
"       \   path: '/opt/homebrew/bin/typescript-language-server',
"       \   args: ['--stdio']
"       \ },
"       \ #{
"       \   name: 'vimls',
"       \   filetype: ['vim'],
"       \   path: '/Users/martin/.yarn/bin/vim-language-server',
"       \   args: ['--stdio']
"       \ },
"       \ #{
"       \   name: 'bashls',
"       \   filetype: ['sh'],
"       \   path: '/Users/martin/.yarn/bin/bash-language-server',
"       \   args: ['start']
"       \ },
"       \ #{
"       \   name: 'pylsp',
"       \   filetype: ['python'],
"       \   path: '/opt/homebrew/bin/pylsp',
"       \   args: []
"       \ },
"       \ #{
"       \   name: 'rustanalyzer',
"       \   filetype: ['rust'],
"       \   path: '/Users/martin/.cargo/bin/rust-analyzer',
"       \   args: [],
"       \   syncInit: v:true,
"       \   initializationOptions: #{
"       \    inlayHints: #{
"       \      typeHints: #{
"       \        enable: v:true
"       \      },
"       \      parameterHints: #{
"       \        enable: v:true
"       \      }
"       \    },
"       \  },
"       \ },
"       \ #{
"       \   name: 'gopls',
"       \   filetype: 'go',
"       \   path: '/Users/martin/go/bin/gopls',
"       \   args: ['serve']
"       \ },
"       \ #{
"       \   name: 'marksman',
"       \   filetype: 'markdown',
"       \   path: '/opt/homebrew/bin/marksman',
"       \   args: ['--stdio']
"       \ }
"       \]

" "Add all servers at once
" autocmd User LspSetup call LspAddServer(lspServers)

" " Key Bindings
" nnoremap K :LspHover<CR>
" Creating viminfo files causes problems when using vim and nvim together
set viminfo=
