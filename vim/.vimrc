" ========== Vim Basic Settings ============="

" Pathogen settings.
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#infect()
Helptags
filetype plugin indent on

" Make vim incompatbile to vi.
set nocompatible
set modelines=0

"TAB settings.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" More Common Settings.
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
syntax on

"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

"set relativenumber
set number
set norelativenumber

"set undofile
set shell=/bin/bash
set lazyredraw
set matchtime=3

"Changing Leader Key
let mapleader = ","
""""
" Set title to window
set title 
" Dictionary path, from which the words are being looked up.
set dictionary=/usr/share/dict/words

" Make pasting done without any indentation break."
set pastetoggle=<F3>

" Make Vim able to edit corntab fiels again.
set backupskip=/tmp/*,/private/tmp/*"

" Enable Mouse
set mouse=a
"set smartindent

"Settings for Searching and Moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %


" Make Vim to handle long lines nicely.
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=80

" To  show special characters in Vim
"set list
set listchars=tab:▸\ ,eol:¬

" Naviagations using keys up/down/left/right
" Disabling default keys to learn the hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"nnoremap j gj
"nnoremap k gk

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Map : to ; also in command mode.
"nnoremap ; :

" Set vim to save the file on focus out.
au FocusLost * :wa

" Adding More Shorcuts keys using leader kye.
" Leader Kye provide separate namespace for specific commands.
",W Command to remove white space from a file.
""nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ,ft Fold tag, helpful for HTML editing.
nnoremap <leader>ft vatzf

" ,q Re-hardwrap Paragraph
nnoremap <leader>q gqip

" ,v Select just pasted text.
nnoremap <leader>v V`]

" ,ev Shortcut to edit .vimrc file on the fly on a vertical window.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" jj For Qicker Escaping between normal and editing mode.
"inoremap jj <ESC>


" Working with split screen nicely
" Resize Split When the window is resized"
au VimResized * :wincmd =


" Wildmenu completion "
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"

"Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

nnoremap g; g;zz

" =========== END Basic Vim Settings ===========


" >>> Special binding rules <<<

" > Folding the leftcolumn toggle. < "
nnoremap <leader>f :call FoldColumnToggle()<cr>

" direct mapping may disable other mappings done on this keybinding.
"imap <leader>f :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction

" > Quick Fix Toggle to see the quickfix window < "
nnoremap <leader>q :call QuickFixToggle()<cr>

" Global variable keeping track of the state of the quick fix window.
let g:quickfix_is_open = 0

function! QuickFixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

" > Spell checker Toggler <
nnoremap <leader>c :call SpellChecker()<cr>

let g:spell_checker_is_active = 0
function! SpellChecker()
    if g:spell_checker_is_active
        setlocal spell spelllang=
        let g:spell_checker_is_active = 0
    else
        setlocal spell spelllang=en_us
        let g:spell_checker_is_active = 1
    endif
endfunction

" >>> END Special binding rules <<<

" =========== Gvim Settings =============
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Inconsolata\ 12
    elseif has("gui_win32")
        set guifont=Consolas:h11:cANSI
    endif
endif
" Removing scrollbars
if has("gui_running")
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style

    " set guifont=Cousine\ 10
else
    set t_Co=256
endif

set background=dark
"let g:solarized_termcolors=256
colorscheme badwolf



" Source the vimrc file after saving it
"autocmd bufwritepost .vimrc source ~/.vimrc

" ========== END Gvim Settings ==========


" ========== Plugin Settings =========="

" =========== END Plugin Settings =========="
"

set rtp+=~/.fzf

syntax enable
set background=dark
colorscheme solarized
nnoremap <C-p> :FZF<cr>
"let g:rustfmt_autosave = 1

au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap <leader>b :bp<cr>
nnoremap <leader>n :bn<cr>
nnoremap <C-b> :bp<cr>
nnoremap <C-n> :bn<cr>

nnoremap <C-e> :e<space>
nnoremap ; :

nnoremap <leader>we :VimwikiAll2HTML<cr>

