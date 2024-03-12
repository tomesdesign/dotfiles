" designed for vim 8+
" Barebones are used from rwxrob
" https://github.com/rwxrob/dot/blob/main/vim/.vimrc

if has("eval")                               " vim-tiny lacks 'eval'
    let skip_defaults_vim = 1
endif

set nocompatible
let mapleader=" "

" Use this clorscheme as default without plugins
color habamax

"########################### PLUGINS ###################################

if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.local/share/vim/plugins')
        "Plug 'itchyny/lightline.vim'
        Plug 'hardselius/warlock'
        Plug 'dense-analysis/ale'
    call plug#end()

    " pandoc
    "let g:pandoc#modules#disabled = ["formatting", "folding", "bibliographies", "completion",
    "            \  "metadata", "menu", "executors", "keyboard", "toc", "spell", "hypertext"]
    let g:pandoc#modules#enabled = []
    let g:pandoc#filetypes#pandoc_markdown = 0

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

    " warlock
    colorscheme warlock
    let g:lightline = { 'colorscheme': 'Tomorrow_Night'}
endif

"####################### Vi Compatible (~/.exrc) #######################
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


"########################### General  ##################################

" automatically indent new lines
set autoindent " (alpine)

" set noflash " (alpine-ish only) 

set nofoldenable    " disable folding

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

" use :f instead of :find
cabbrev f find

" Find files in path
nnoremap <leader>ff :find<space>

" Find strings in files in path
nnoremap <leader>fs :grep<space>

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

" Quickfix traversing
nnoremap <C-j> :cn<CR>
nnoremap <C-k> :cp<CR>
nnoremap <C-\> :cope<CR>
nnoremap <C-[> :ccl<CR>


"############################# UI  #####################################

if has("syntax")
    syntax enable
endif

set background=dark
set termguicolors

" statusline
hi StatusLine ctermfg=black ctermbg=NONE
hi StatusLineNC ctermfg=black ctermbg=NONE

" Status line left side.
set statusline+=\ %t\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

set laststatus=2
"##################### Do things without plugins #######################

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

" format shell on save 
if executable("shfmt")
    function! s:FormatShell()
        " Saving window view to restore it after running the command
        let l:winview=winsaveview() 
        silent execute "%!shfmt" 
        silent call winrestview(winview) 
    endfunction 
    autocmd FileType sh
        \ autocmd BufWritePre <buffer> call s:FormatShell() 
endif

" format c files on save
if executable("clang-format")
    function! s:FormatC() 
        let l:winview=winsaveview() 
        silent execute "%!clang-format --style=WebKit"
        "-style=File:$HOME/repos/dotfiles/clang-format/.clang-format" 
        silent call winrestview(winview) 
    endfunction 
    autocmd FileType c autocmd BufWritePre <buffer> call s:FormatC()
endif

" set ripgrep as default grep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --ignore-case\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
