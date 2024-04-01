" designed for v9+
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
        Plug 'vim-pandoc/vim-pandoc'
        Plug 'vim-pandoc/vim-pandoc-syntax'  
        " Good for debugging but I prefer atlas
        Plug 'davidosomething/vim-colors-meh'
        Plug 'huyvohcmc/atlas.vim'
        Plug 'itchyny/lightline.vim'
        " TODO: Make Ale work and abandon COC which is non-vim way 
        "Plug 'dense-analysis/ale'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
    call plug#end()

    "COC
    "inoremap <silent><expr> <TAB>
    "            \ coc#pum#visible() ? coc#pum#next(1) :
    "            \ coc#refresh()
    "inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to
    " format <C-g>u breaks current undo, please make your own choice
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


    " Use <c-space> to trigger completion
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif
    " GoTo code navigation
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)     
    " Use K to show documentation in preview window
    nnoremap <silent> K :call ShowDocumentation()<CR>
    
    function! ShowDocumentation()
        if CocAction('hasProvider', 'hover')
            call CocActionAsync('doHover')
        else
            call feedkeys('K', 'in')
        endif
    endfunction

    " ALE
    "let g:ale_sign_error = '☠'
    "let g:ale_sign_warning = '🙄'

    "nmap gd :ALEGoToDefinition<CR>
    "nmap K :ALEHover<CR>

    " let g:ale_linters = {'c': ['ccls']}
    "let g:ale_completion_enabled = 1
    let g:ale_lint_on_enter = 1
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_insert_leave = 1
    let g:ale_lint_on_save = 1
    let g:ale_hover_to_floating_preview = 1
    let g:ale_floating_preview = 1
    
    "set omnifunc=ale#completion#OmniFunc
    "set completeopt=menu,preview

    " colorscheme
    colorscheme atlas
    let g:lightline = { 'colorscheme': 'atlas'}

    " pandoc
    let g:pandoc#formatting#mode = 'h' " A'
    let g:pandoc#formatting#textwidth = 72

endif

"####################### Vi Compatible (~/.exrc) #######################
" Copy this settings into ~/.exrc on a system where VIM is not available

" number of spaces to replace a tab with
set tabstop=4 " (alpine)
set shiftwidth=4

" use smartcase when searching
set ignorecase
set smartcase

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

" Fix ^H/backspace not working
"set bs=indent,eol,start
set backspace=2

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

"########################### File types ################################
" File specific settings

" Force some files to be specific file types
au bufnewfile,bufRead *.md set ft=markdown


" markdown specific 
au FileType markdown nnoremap <leader>tt :r! date "+\%Y\%m\%d\%H\%M\%S"<CR>


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
"imap <tab><tab> <c-x><c-o>

" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>


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

" show matching part of pairs [] {} and ()
set showmatch

" highlight current line
:highlight Cursorline cterm=bold ctermbg=yellow

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
" Set pumvisibility for command mode
set wildmode=longest:full,full
set wildoptions=pum

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
"if executable("shfmt")
"    function! s:FormatShell()
"        " Saving window view to restore it after running the command
"        let l:winview = winsaveview()
"        let l:formatted_output = systemlist("shfmt", expand("%"))
"        if v:shell_error
"            echohl ErrorMsg
"            echomsg "Error formatting shell script with shfmt"
"            echohl None
"        else
"            " Replace buffer content with formatted output
"            silent %delete _
"            call append(0, l:formatted_output)
"        endif
"        silent call winrestview(l:winview)
"    endfunction
"    autocmd FileType sh autocmd BufWritePre <buffer> call s:FormatShell()
"endif

" set ripgrep as default grep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --ignore-case\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
