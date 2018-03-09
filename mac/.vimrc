set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'derekwyatt/vim-scala'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'leafgarland/typescript-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" leader key
let mapleader = ","

" syntax highlight
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_highlight_all=1
syntax on

" YCM
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd p
map <C-n> :NERDTreeToggle<CR>
"let NERDTreeMapOpenInTab='e'

" tab
map <leader>w :bdelete<CR>

" Python Indent 
map <C-z> :IndentGuidesToggle<CR>
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red    ctermbg=11
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green  ctermbg=12
"hi IndentGuidesOdd  ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey

" Two Split Window Scroll Down Synchronized
map <F3> :call ScbToggle()<CR>
function! ScbToggle()
    if &scrollbind
        windo set scb!
    else
	windo set scb
    endif
endfunction

" Super Search
map <F2> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" trival setting
set clipboard=unnamed
set hlsearch
set splitbelow
set splitright
colorscheme zenburn
set cursorline
set backspace=indent,eol,start
set nu

" typescript
"let g:typescript_compiler_binary = 'tsc'
"let g:typescript_compiler_options = ''

" NumberToggleSwitch (Not working)
" set nu
" let g:NumberToggleTrigger="<F2>"
