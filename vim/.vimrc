" designed for vim 8+
" Barebones are used from rwxrob
" https://github.com/rwxrob/dot/blob/main/vim/.vimrc

if has("eval")                               " vim-tiny lacks 'eval'
    let skip_defaults_vim = 1
endif

set nocompatible
let mapleader=" "

" Use this clorscheme as default without plugins
color retrobox

"########################### PLUGINS ####################################

if filereadable(expand("~/.vim/autoload/plug.vim"))

    " github.com/junegunn/vim-plug

    call plug#begin('~/.local/share/vim/plugins')
        Plug 'gabrielelana/vim-markdown'
        Plug 'itchyny/lightline.vim'
       " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
       " Plug 'junegunn/fzf.vim'
        Plug 'tpope/vim-fugitive'
        Plug 'dense-analysis/ale'
        Plug 'catppuccin/vim'
        Plug 'airblade/vim-gitgutter'
    call plug#end()

    " ALE
    let g:ale_sign_error = '☠'
    let g:ale_sign_warning = '🙄'

    nmap gd :ALEGoToDefinition<CR>
    nmap K :ALEHover<CR>

    " let g:ale_linters = {'c': ['ccls']}
    let g:ale_completion_enabled = 1
    let g:ale_lint_on_enter = 1
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_insert_leave = 1
    let g:ale_lint_on_save = 1
    let g:ale_hover_to_floating_preview = 1
    let g:ale_floating_preview = 1
    
    set omnifunc=ale#completion#OmniFunc

    " fzf
    " leader key
   " nnoremap <leader>ff :Files<CR>
   " nnoremap <leader>fg :GFiles<CR>
   " nnoremap <leader>fs :Rg!

    " catppuccin
    colorscheme catppuccin_macchiato

    " Lightline
    set laststatus=2
    let g:lightline = {
      \ 'colorscheme': 'catppuccin_macchiato',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

    " Markdown
    let g:markdown_enable_spell_checking = 0

    " Markdown preview
    "   nmap <C-p> <Plug>MarkdownPreviewToggle
    " nmap <F3> <Plug>MarkdownPreviewToggle
    "   let g:mkdp_browser = '$HOME/.local/bin/lynx'
endif

"####################### Vi Compatible (~/.exrc) ########################
" Copy this settings into ~/.exrc on a system where VIM is not available

" number of spaces to replace a tab with
set tabstop=4 " (alpine)
set shiftwidth=4

" use case when searching
set noignorecase

" automatically write files when changing when multiple files open
set autowrite

" activate line numbers
set number

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


"########################### General  ###################################

" automatically indent new lines
set autoindent " (alpine)

" set noflash " (alpine-ish only) 

" replace tabs with spaces automatically
set expandtab " (alpine)

" enough for line numbers + gutter within 80 standard
set textwidth=72
set colorcolumn=73

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

" Do not insert comment leaders
" set formatoptions-=cro " for somereason this not working at all
augroup NoAutoComment
  au!
  au FileType * setlocal formatoptions-=cro
augroup end

"########################## Keymaps  ####################################
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

" Better autocompletion trigger
imap <tab><tab> <c-x><c-o>

" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

" always use case insensitive search
nnoremap / /\c

" set indentation for filetypes
au FileType yaml set sw=2
au FileType bash set sw=4
au FileType c set sw=4

set cinoptions+=:0

"############################# UI  ######################################

if has("syntax")
    syntax enable
endif

set background=dark
set termguicolors

"##################### Do things without plugins ########################

" " Internal plugins are ok :)
filetype plugin on

"" FILES HANDLING
" hit tab to :find by partial match
" " use * to make it fuzzy
" " use :b to autocomplete any open buffer
set path+=**  " search down into subfolders. Provide tab-completion
set wildmenu  " display all matching files when tab complete

""" FILE BROWSING
" netrw files browsing. use :edit .
let g:netrw_banner=0 " disable banner
let g:netrw_liststyle=3 " tree view
"let g:netrw_browse_split=2 " open in prior window
"let g:netrw_altv=3 " open splits to the right
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25

" format shell on save 
if has("eval") " vim-tiny detection
    function! s:FormatShell()
        " Saving window view to restore it after running the command
        let l:winview=winsaveview()
        silent execute "%!shfmt"
        silent call winrestview(winview)
    endfunction
    autocmd FileType sh autocmd BufWritePre <buffer> call s:FormatShell()
endif

" format c files on save
if has ("eval")
    function! s:FormatC()
        let l:winview=winsaveview()
        silent execute "%!clang-format -style=File:$HOME/repos/dotfiles/clang-format/.clang-format"
        silent call winrestview(winview)
    endfunction
    autocmd FileType c autocmd BufWritePre <buffer> call s:FormatC()
endif

