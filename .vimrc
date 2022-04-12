set nocompatible              " be iMproved, required
filetype off                  " required
" ============================================

" ============================================
" VUNDLE PLUGINS
" ============================================
" Test to see if this changes the linked file on the other side
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ADD PLUGINS HERE
" ============================================
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'https://github.com/907th/vim-auto-save'
Plugin 'vim-airline/vim-airline'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'godlygeek/tabular'
Plugin 'dense-analysis/ale'
" Plugin 'fatih/vim-go'
" Plugin 'chrisbra/unicode.vim'
" Plugin 'Yggdroot/indentLine'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
" Plugin 'https://github.com/tkhren/vim-fake'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
"
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on

" VUNDLE HELP
" ============================================
" Install with:  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ============================================

" ============================================
" BASIC VIM SETTINGS
" ============================================
"Copy indent from current line when starting a new line(typing <CR> in Insert mode or when using the "o" or "O" command) 
set autoindent  

"Expand tabs into spaces
set expandtab

"Need to set tabstop and shiftwidth to 2 in conjunction with expandtab (default tabstop is 8!)
set tabstop=2
set shiftwidth=2
set softtabstop=2

" set colorcolumn=80    " setting end point

set hlsearch            " highlight matches; turn off with :nohlsearch when done searching 
set incsearch           " search as characters are entered
set linebreak           " set linebreak on so that full words are wrapped
set laststatus=2        " set the title of the vim window to show the filename
set ttyfast             " helps with screen redraws smoothness
set title               " set the title of the window to be the name of the file

"This is to see special/hidden characters
" use leader h to toggle this on and off
set listchars=eol:$,tab:>-,space:·,nbsp:␣,trail:~,extends:>,precedes:<
" ============================================

" ============================================
" ADVANCED VIM SETTINGS
"l ============================================
" Plugin Configurations 
let g:auto_save = 1  " enable AutoSave on Vim startup
" autocmd BufReadPost *.ejs set filetype=html "mark my ejs as html to enable sparkup
let g:tex_flavor='latex'  "makes use of .tex files
autocmd BufEnter *.tex set sw=2

" Setting for text and markdown files
" autocmd BufEnter *.txt,*.md set spell

" Config to be able to yank and paste from Vim
set clipboard=unnamed

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType go set ts=2 sw=2 sts=2 noet nolist autowrite

" This option if uncommented will remove parens matching 
" let g:loaded_matchparen=1

" changing trigger key for emmet
let g:user_emmet_leader_key='<C-E>'


" ============================================

" ============================================
" SET INTIAL SETTINGS
" ============================================
set number
set relativenumber
set noswapfile

" ============================================
" LEADER KEY ',' SHORTCUTS
" ============================================

" Set leader to , 
let mapleader = ","

" Toggle highlighting of search results
nnoremap <leader><space> :nohlsearch<cr>

" Toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>w <C-w><C-w>

" Toggle Hybrid Line Numbers
nnoremap <leader>m :set number! relativenumber!<cr>

" Automatic Spell Correction
nnoremap <leader>sp :set spell!<cr>
nnoremap <leader>sc 1z=

" Add date/time stamp
nnoremap <leader>d :r !date<cr>

" Toggle cursorcolumn
nnoremap <leader>l :set cursorcolumn!<cr>

" Toggle paste so I don't get that odd indent thing
nnoremap <leader>p :set paste!<cr>

" Create quotes around a word
:nnoremap <leader>q" ciw""<Esc>P
:nnoremap <leader>q' ciw''<Esc>P
:nnoremap <leader>q` ciw``<Esc>P

" Toggle list to see hidden characters
nnoremap <leader>h :set list!<cr>
" ============================================

" ============================================
" SHORTCUTS
" ============================================
" NERDTree
map <S-j> :tabp<CR>
map <S-k> :tabn<CR>
map <C-n> :tabnew<CR>

" ============================================
" KEY REMAP SHORTCUTS for parens and similar stuffs
" ============================================
inoremap ( ()<Left>
" inoremap (; ()<Left>
" inoremap (<CR> (<CR>)<Esc>
inoremap { {}<Left>
" inoremap {; {}<Left>
" inoremap {<CR> {<CR>}<Esc>
inoremap [ []<Left>
" inoremap [; []<Left>
" inoremap [<CR> [<CR>]<Esc>
" inoremap ({<CR> ({<CR>});<Esc>
inoremap < <><Left>
" inoremap <; <><Left>
inoremap /; //<Left>
inoremap ' ''<Left>
" inoremap '; ''<Left>
inoremap " ""<Left>
" inoremap "; ""<Left>
inoremap ` ``<Left>
" inoremap `; ``<Left>
inoremap ;. ...
inoremap `<CR> ```<CR>```<Esc>
inoremap ;a =><Space>
inoremap ;A =><Space>{<CR>}<Esc>
inoremap ;l ${}<Left>
inoremap ;( ()<Space>{<CR>}<Esc>
inoremap ;[ [[]]<Left><Left><Space><Space><Left>
inoremap ;{ {{}}<Left><Left><Space><Space><Left>

" ============================================
" ABBREVIATIONS (TEXTEXPANDERS)
" ============================================

"  This is a function to eat a trailing space after
"+ abbreviation expansion. Just place this after
"+ the abbreviation `<c-r>=Eatchar('\s')<cr>`
func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" +++ BASH +++
iab binb #!/bin/bash<c-r>=Eatchar('\s')<cr>
iab pf printf<Space>""<Left><c-r>=Eatchar('\s')<cr>

" +++ PYTHON +++
inoremap """ """"""<Left><Left><Left>
inoremap ;def def __init__():<Left><Left>
inoremap ;ppo print()<Left><c-r>=Eatchar('\s')<cr>
inoremap ;inp input("")<Left><Left><c-r>=Eatchar('\s')<cr>
inoremap ;pps print("")<Left><Left><c-r>=Eatchar('\s')<cr>
inoremap ;ppf print(f"")<Left><Left><c-r>=Eatchar('\s')<cr>
inoremap ;binp #!/usr/bin/env python3<c-r>=Eatchar('\s')<cr>
inoremap ;impplt import matplotlib.pyplot as plt
" This will allow me to run a python program from within vim using the F9 key
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>

" +++ JAVA +++
iab sout System.out.println();<Left><Left>
iab sprt System.out.print();<Left><Left>
iab impscn import java.util.Scanner;
iab newscn Scanner input = new Scanner(System.in);
iab scninp [TYPE] name = input.next();

iab jvamn 
\<CR>public class [CLASSNAME] {
\<CR><Space><Space>public static void main(String [] args) {
\<CR>
\<CR><Space><Space><Space><Space>System.out.println( "Hello Borld!" );
\<CR>
\<CR><C-]>}
\<CR>}

" +++ JAVASCRIPT +++
iab csl console.log()<Left>

iab trycat 
\<CR>try {
\<CR>} catch (err) {
\<CR>console.error(err.message)
\<CR>}<Up><Up><Up>
\<C-]>

" +++ REACT +++
" ab imr import<Space>React<Space>from<Space>'react'
" ab imd import<Space>ReactDOM<Space>from<Space>'react-dom'
" ab impt import<Space>PropTypes<Space>from<Space>'prop-types'
" ab exd export<Space>default<Space>
" ab rdr ReactDOM.render(, document.getElementById('root'))

" ============================================

" ============================================
" MAKING VIM PRETTY
" ============================================
colorscheme desert
syntax on

" CURSOR SHAPE CHANGE IN DIFFERENT MODES
" ============================================
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" ============================================
