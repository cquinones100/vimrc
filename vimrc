set nocompatible               " be iMproved
set number relativenumber
set commentstring
set clipboard=unnamed
set shiftwidth=2
set ruler
set laststatus=2
set tabstop=2 shiftwidth=2 expandtab
set backupcopy=yes
set mouse+=a

syntax on
colorscheme slate

filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'vim-syntastic/syntastic'
Plugin 'thoughtbot/vim-rspec'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'joker1007/vim-ruby-heredoc-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab.git'

call vundle#end()            " required
filetype plugin indent on    " required

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

filetype plugin indent on 

let g:NERDTreeNodeDelimiter = "\u00a0"

"set encoding=UTF-8

let mapleader = ","

" comment
map <leader>/ gcc<ESC>

" remove current file
map <leader>rmf :!rm %<CR>,q<CR>

" copy and paste to sytem clipboard
map <leader>c :!pbcopy<CR>u<CR>
map <leader>p :!pbpaste<CR><CR>

" source vimrc
map <leader>sv :source ~/.vimrc<CR>

" reindent
map <leader>ind =<CR>

" split hash/object into new lines
map <leader>x V:s/, /,\r/g<CR>

map <leader>q :q<CR>
map <leader>s :w<CR>

map <leader>rs :vertical resize +5<CR>
map <leader>rl :vertical resize -5<CR>

" search for ruby test focuses
function! SearchForFocus()
  let found = 'false'
  let ruby_focuses = ['fit ', 'fdescribe ', 'fcontext ', 'fsubject ']

  for i in ruby_focuses
    :call search(i)
  endfor
endfunction

map <leader>fit :call SearchForFocus()<Cr>


" this command uses CtrlP
map <leader>C :CtrlPClearAllCaches<cr>

map <leader>n :NERDTreeFocus<CR>

set t_Co=256

map <leader>bind orequire 'pry'<CR>binding.pry<Esc>

" nerd tree
" open nerdtree on startup and move cursor to file
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"ctrl p
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40


"" leader to split line with spaces into new lines
"map <leader>z f<Space>lxi<CR><ESC>

"map <leader>i magg=G`a
"map <leader>g gg=G
"map <leader>l :vsp<CR>


""add comma to end of line
"map <leader>f, $a,<Esc>

"map <leader>x :s/, /,\r/g<CR>
"map <leader>z :s/=>/ => /g<CR>

