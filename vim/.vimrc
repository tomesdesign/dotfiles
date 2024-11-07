" designed for v9+
" Barebones are used from rwxrob
" https://github.com/rwxrob/dot/blob/main/vim/.vimrc

" Do not mess the home folder
set viminfofile=~/.vim/viminfo

syntax enable

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

" syntax off
set background=dark
" Fallback colorscheme if no color plugin
color retrobox
set termguicolors

if has("eval")                               " vim-tiny lacks 'eval'
    let skip_defaults_vim = 1
endif
set nocompatible
let mapleader=" "
" Turn on internal plugins for netrw
" Sets how many lines of history VIM has to remember
set history=500
" Enable filetype plugins
filetype plugin on
filetype indent on
"Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

colorscheme gruvbox_material_simple

" ########################### PLUGINS ###################################
if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.local/share/vim/plugins')
        Plug 'jiangmiao/auto-pairs'
        Plug 'unblevable/quick-scope'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        " Plug 'junegunn/fzf.vim'
        Plug 'ap/vim-css-color'
        Plug 'tpope/vim-commentary'
        Plug 'dense-analysis/ale'
        Plug 'junegunn/fzf.vim'
        Plug 'itchyny/lightline.vim'
        Plug 'shinchu/lightline-gruvbox.vim'
        " Plug 'airblade/vim-gitgutter'
    call plug#end()

    " Quick navigation for f,F,t,T
    highlight QuickScopePrimary guifg='#835723' gui=underline ctermfg=155 cterm=underline
    highlight QuickScopeSecondary guifg='#835723' gui=underline ctermfg=81 cterm=underline
    " Trigger a highlight in the appropriate direction when pressing these keys:
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

    " Ale linter settings
    set signcolumn=yes
    let g:ale_set_signs = 1
    let g:ale_sign_error = '>>'
    let g:ale_sign_warning = '--'
    let g:ale_sign_info = '!'

    " let g:ale_sign_error = '☠'
    " " let g:ale_sign_error = '‼️'
    " let g:ale_sign_warning = '🙄'

    nmap gd :ALEGoToDefinition<CR>
    nmap K :ALEHover<CR>

    let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['prettier','eslint'],
    \   'javascriptreact': ['prettier','eslint'],
    \    'typescript': ['prettier', 'tslint'],
    \    'scss': ['prettier'],
    \    'html': ['prettier'],
    \}

    augroup MyALESignHighlights
      autocmd!
      autocmd User ALELintPost hi ALEComment guifg=#fb4934
      hi ALEErrorSign guifg=#fb4934 guibg=#282828   " Set foreground and background for error sign
      hi ALEWarningSign guifg=#fabd2f guibg=#282828  " Set foreground and background for warning sign
      hi ALEInfoSign guifg=#83a598 guibg=#282828     " Set foreground and background for info sign
      hi ALEHint guifg=#b8bb26     " Change to your desired color for hints (green)
    augroup END

    let g:ale_fix_on_save = 1
    let g:ale_completion_enabled = 1
    let g:ale_lint_on_enter = 1
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_insert_leave = 1
    let g:ale_lint_on_save = 1
    let g:ale_hover_to_floating_preview = 1
    let g:ale_floating_preview = 1

    let g:ale_virtualtext_cursor = 'disabled'

    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    
    " let g:ale_linter_aliases = { 
    " \   'Dockerfile': 'dockerfile',
    " \   'javascriptreact': ['javascript', 'jsx'],
    " \   'plaintex': 'tex',
    " \   'typescriptreact': ['typescript', 'tsx'],
    " \   'verilog_systemverilog': ['verilog_systemverilog', 'verilog'],
    " \   'vimwiki': 'markdown',
    " \   'vue': ['vue', 'javascript'],
    " \   'xsd': ['xsd', 'xml'],
    " \   'xslt': ['xslt', 'xml'],
    " \   'zsh': 'sh',
    " \}

    nnoremap <leader>] :ALENextWrap<CR>     " move to the next ALE warning / error
    nnoremap <leader>[ :ALEPrevious<CR> " move to the previous ALE warning / error
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
set textwidth=100
" set wrapmargin=0
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
" Use 80 line width when coding
au FileType c,cpp,python set textwidth=79
au FileType c,cpp,python set colorcolumn=80
au FileType c,cpp,python set wrap
au FileType c,cpp,python set tabstop=4
au FileType c,cpp,python set shiftwidth=4
" Force header files to be C files
au bufnewfile,bufRead *.h set ft=c,cpp
" au bufnewfile,bufRead *.jsx set ft=javascript

" au FileType javascript setlocal formatprg=prettier
" au FileType javascript.jsx setlocal formatprg=prettier
" au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
" au FileType html setlocal formatprg=js-beautify\ --type\ html
" au FileType scss setlocal formatprg=prettier\ --parser\ css
" au FileType css setlocal formatprg=prettier\ --parser\ css

"########################## Keymaps  ###################################
" I want to stick with the default vi as much as possible 
" Disable Arrow keys in normal mode 
noremap <up> :echoerr "Umm, use k instead"<CR>
noremap <down> :echoerr "Umm, use j instead"<CR>
noremap <left> :echoerr "Umm, use h instead"<CR>
noremap <right> :echoerr "Umm, use l instead"<CR>
" Disable Arrow keys in insert mode 
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>
" Disable h and j in normal mode 
nnoremap h <NOP>
nnoremap l <NOP>
" Traverse buffers
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
" better list and change buffers
nnoremap <leader>l :ls<CR>:b<space>
" Save
nmap <leader>s :w!<cr>
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
nnoremap <C-j> :cn<CR>
nnoremap <C-k> :cp<CR>


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
