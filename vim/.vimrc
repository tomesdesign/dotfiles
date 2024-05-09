" designed for v9+
" Barebones are used from rwxrob
" https://github.com/rwxrob/dot/blob/main/vim/.vimrc

if has("eval")                               " vim-tiny lacks 'eval'
    let skip_defaults_vim = 1
endif

set nocompatible
let mapleader=" "
" Turn on internal plugins for netrw
filetype plugin on
" Fallback colorscheme if no color plugin
color retrobox

"########################### PLUGINS ###################################

if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.local/share/vim/plugins')
        Plug 'vim-pandoc/vim-pandoc'
        Plug 'vim-pandoc/vim-pandoc-syntax'  
        Plug 'jiangmiao/auto-pairs'
        Plug 'sainnhe/gruvbox-material'
        Plug 'unblevable/quick-scope'
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
        Plug 'ap/vim-css-color'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
    call plug#end()

    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    "" Use <c-space> to trigger completion
    "if has('nvim')
    "    inoremap <silent><expr> <c-space> coc#refresh()
    "else
    "    inoremap <silent><expr> <c-@> coc#refresh()
    "endif
    "" GoTo code navigation
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)     
    "" Use K to show documentation in preview window
    nnoremap <silent> K :call ShowDocumentation()<CR>
    "
    "function! ShowDocumentation()
    "    if CocAction('hasProvider', 'hover')
    "        call CocActionAsync('doHover')
    "    else
    "        call feedkeys('K', 'in')
    "    endif
    "endfunction

    " colorscheme
    colorscheme gruvbox-material  "msvcpp6     
    let g:gruvbox_material_better_performance = 1
    let g:gruvbox_material_background = 'medium'

    " pandoc
    let g:pandoc#formatting#mode = 'h' " A'
    let g:pandoc#formatting#textwidth = 72
    let g:pandoc#folding#fold_fenced_codeblocks = 1
    let g:pandoc#spell#enabled = 0

endif

"####################### Vi Compatible (~/.exrc) #######################
" Copy this settings into ~/.exrc on a system where VIM is not available

" number of spaces to replace a tab with
set tabstop=2
set shiftwidth=2

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

" disable annoying paste mode
set nopaste

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
set wrap

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
" au bufnewfile,bufRead *.md set ft=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'c++=cpp', 'viml=vim',]

" Wrap text for markdown
au FileType markdown,pandoc set wrap

" Use 80 line width when coding
au FileType c,cpp,python set textwidth=79
au FileType c,cpp,python set colorcolumn=80
au FileType c,cpp,python set wrap

" Force header files to be C files
au bufnewfile,bufRead *.h set ft=c,cpp


"########################## Keymaps  ###################################
" I want to stick with the default vi as much as possible

" buffers 
nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprevious<CR>
" better list and change buffers
nnoremap <leader>l :ls<CR>:b<space>

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

" Moving lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

" Find files in path
"nnoremap <leader>ff :find<space>

" Find strings in files in path
"nnoremap <leader>fs :grep<space>

" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

set cinoptions+=:0

" Quickfix traversing
nnoremap <C-j> :cn<CR>
nnoremap <C-k> :cp<CR>
"nnoremap <C-\> :cope<CR>
"nnoremap <C-[> :ccl<CR>

"############################# UI  #####################################

if has("syntax")
    syntax enable
endif

set background=dark
set termguicolors

" show matching part of pairs [] {} and ()
set showmatch

hi StatusLine ctermfg=black ctermbg=NONE
hi StatusLineNC ctermfg=black ctermbg=NONE

" statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\

set laststatus=2
    
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
" netrw files browsing. use :edit .
let g:netrw_banner=0 " disable banner
let g:netrw_liststyle=3 " tree view
let g:netrw_list_hide= '.*\.swp$,.*\.DS_Store'

" format shell on save 
" If shfmt outputs error, this overwrittes the whole file with the error
"if executable("shfmt")
"    function! s:FormatShell()
"        " Saving window view to restore it after running the command
"        let l:winview=winsaveview() 
"        silent execute "%!shfmt" 
"        silent call winrestview(winview) 
"    endfunction 
"    autocmd FileType sh
"        \ autocmd BufWritePre <buffer> call s:FormatShell() 
"endif

" format c files on save
if has ("eval")
    function! s:FormatC()
        let l:winview=winsaveview()
        silent execute "%!clang-format -style=File:$HOME/repos/tomesink/dotfiles/clang-format/.clang-format"
        silent call winrestview(winview)
    endfunction
    autocmd FileType c autocmd BufWritePre <buffer> call s:FormatC()
endif

" set ripgrep as default grep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --ignore-case\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
