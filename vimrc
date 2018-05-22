set nocompatible
filetype off

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'thoughtbot/vim-rspec'

call vundle#end()            " required
filetype plugin indent on    " required

" pathogen
execute pathogen#infect()

" move through panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" nerd tree
" open nerdtree on startup and move cursor to file
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" close vim if nerdtree is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set number relativenumber

syntax on

colorscheme desert

"ctrl p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
\ 'file': '\.so$\|\.dat$|\.DS_Store$'
\ }
let g:ctrlp_max_files=0

let mapleader = ","

" leaders for vim
map <leader>g gg=G
map <leader>l :vsp<CR>
map <leader>sv :source ~/.vimrc<CR>
map <leader>q :q<CR>
map <leader>s :w<CR>
map <leader>o o<Esc>
map <leader>O O<Esc>

" leaders for git
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>

" leaders for react
map <leader>imp iimport React from 'react'<Esc>
map <leader>impcom iimport React, { Component } from 'react'<Esc>
map <leader>com oconst  = () =><Esc>7hi
map <leader>cla oclass  extends Component {<CR><CR>}<Esc>2k0eli
map <leader>ren orender() {<CR>  return()<CR>}<Esc>k$i

" leaders for react testing
map <leader>it oit('', () => {<CR>})<Esc>k2la
map <leader>desc odescribe('', () => {<CR>})<Esc>k8la
map <leader>() i () => {<CR>})<Esc><Up>$a<CR>
map <leader>sha oconst component = shallow()<Esc>i
map <leader>exp oexpect().to<Esc>3hi

" leaders for rails
map <leader>par o<%= render partial: '' %><Esc>2ba
map <leader>bind obinding.pry<Esc>

" leaders for rails testing
map <leader>rexp oexpect().to eq()<Esc>8hi

" leaders for javascript
map <leader>con oconsole.log()<Esc>i

" leaders for html
map<leader>div o<div></div><Esc>5hi




