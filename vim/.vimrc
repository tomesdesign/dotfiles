set number

color retrobox

syntax on

filetype plugin indent on
set tabstop=4
set shiftwidth=4

set wildmenu
set hidden

set wildignore=*.exe,*.dll,*.pdb

set cursorline

if filereadable(expand("~/.vim/autoload/plug.vim"))
	call plug#begin('~/vimplugins')

	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'

    Plug 'catppuccin/vim'
    Plug 'itchyny/lightline.vim'

	call plug#end()

	function! s:on_lsp_buffer_enabled() abort
		setlocal omnifunc=lsp#complete
		setlocal signcolumn=yes
		nmap <buffer> gi <plug>(lsp-definition)
		nmap <buffer> gd <plug>(lsp-declaration)
		nmap <buffer> gr <plug>(lsp-references)
		nmap <buffer> gl <plug>(lsp-document-diagnostics)
		nmap <buffer> R <plug>(lsp-rename)
		nmap <buffer> K <plug>(lsp-hover)
	endfunction

	augroup lsp_install
		au!
		autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
	augroup END

	colorscheme catppuccin_macchiato
	let g:lightline = {'colorscheme': 'catppuccin_macchiato'}
	set laststatus=2
endif

set spell

set is

set ignorecase
set smartcase

" grep to find strings
set gp=git\ grep\ -n

set ruler

packadd! matchit

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
