" designed for vim 8+
" Re-used from rwxrob
" https://github.com/rwxrob/dot/blob/main/vim/.vimrc

if has("eval")                               " vim-tiny lacks 'eval'
  let skip_defaults_vim = 1
endif

set nocompatible


"####################### Vi Compatible (~/.exrc) #######################
" Copy this settings into ~/.exrc on a system where VIM is not available

" number of spaces to replace a tab with when expandtab586e75 
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


"######################### General  #########################################

" automatically indent new lines
set autoindent " (alpine)

set noflash " (alpine-ish only) 

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

"######################### Do things without plugins #########################################

" here because plugins and stuff need it
if has("syntax")
  syntax enable
endif

" " Internal plugins are ok :)
filetype plugin on

"" FILES HANDLING
" hit tab to :find by partial match
" " use * to make it fuzzy
" " use :b to autocomplete any open buffer
set path+=**  " search down into subfolders. Provide tab-completion
set wildmenu  " display all matching files when tab complete

"" AUTOCOMPLETION
" better command-line completion
set wildmenu

set completeopt-=preview
set iskeyword+=-
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,longest

""" FILE BROWSING
" netrw files browsing. use :edit .
let g:netrw_banner=0 " disable banner
let g:netrw_liststyle=3 " tree view
"let g:netrw_browse_split=2 " open in prior window
"let g:netrw_altv=3 " open splits to the right
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25


"######################### Keymaps  #########################################
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

" leader key
let mapleader=" "

" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

" always use case insensitive search
nnoremap / /\c


"######################### File Types ##################################

" Just the formatoptions defaults, these are changed per filetype by
" plugins. Most of the utility of all of this has been superceded by the use of
" modern simplified pandoc for capturing knowledge source instead of
" arbitrary raw text files.

" set fo-=t   " don't auto-wrap text using text width
set fo+=c   " autowrap comments using textwidth with leader
set fo-=r   " don't auto-insert comment leader on enter in insert
set formatoptions-=o   " don't auto-insert comment leader on o/O in normal
set fo+=q   " allow formatting of comments with gq
set fo-=w   " don't use trailing whitespace for paragraphs
set fo-=a   " disable auto-formatting of paragraph changes
set fo-=n   " don't recognized numbered lists
set fo+=j   " delete comment prefix when joining
set fo-=2   " don't use the indent of second paragraph line
set fo-=v   " don't use broken 'vi-compatible auto-wrapping'
set fo-=b   " don't use broken 'vi-compatible auto-wrapping'
set fo+=l   " long lines not broken in insert mode
set fo+=m   " multi-byte character line break support
set fo+=M   " don't add space before or after multi-byte char
set fo-=B   " don't add space between two multi-byte chars
set fo+=1   " don't break a line after a one-letter word

" Markdown better highlighting
hi link markdownH1 markdownHxBold
hi link markdownH2 markdownHxBold
hi markdownHxBold  term=bold ctermfg=DarkMagenta gui=bold guifg=Magenta cterm=bold

" C settings
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" Look for incluide header files
let &path.="src/include,/usr/include/AL,"

" Set c build settings
set makeprg=make\ -C\ ../build\ -j9
nnoremap <F2> :make!<cr>

" set indentation for filetypes
au FileType yaml set sw=2
au FileType bash set sw=4
au FileType c set sw=4
au FileType go set sw=4


set cinoptions+=:0

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

nnoremap <silent> <leader>f :call FormatShell()<cr>



" ######################### PLUGINS  #################################

if filereadable(expand("~/.vim/autoload/plug.vim"))

  " github.com/junegunn/vim-plug

  call plug#begin('~/.local/share/vim/plugins')
    Plug 'overcache/NeoSolarized'
    Plug 'gabrielelana/vim-markdown'
	Plug 'preservim/nerdtree'
    Plug 'lifepillar/vim-solarized8'
    Plug 'dense-analysis/ale'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'
  call plug#end()

  " ALE linter
  let g:ale_sign_error = '☠'
  let g:ale_sign_warning = '🙄'
  let g:ale_linters = {'go': ['gometalinter', 'gofmt','gobuild']}

  " fzf
  " set rtp+=/opt/homebrew/opt/fzf
  nnoremap <leader>ff :Files<CR>
  nnoremap <leader>fg :GFiles<CR>
  nnoremap <leader>fs :Rg!

  " color theme
"   colorscheme solarized8_flat
  colorscheme NeoSolarized
  let g:airline_theme='solarized'

  " Nerdtree
  nmap <F4> :NERDTreeToggle<CR>

  " Markdown preview
"   nmap <C-p> <Plug>MarkdownPreviewToggle
  nmap <F3> <Plug>MarkdownPreviewToggle
"   let g:mkdp_browser = '$HOME/.local/bin/lynx'
endif

"######################### UI  ##################################
set background=dark
set termguicolors
set term=xterm-256color
