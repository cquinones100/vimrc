set nocompatible
filetype off

set number relativenumber
set commentstring

syntax on
colorscheme desert

set t_Co=256
call plug#begin('~/.vim/bundle')
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

"ctrl p
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

let mapleader = ","

" leaders for vim
" this command uses vim-commentary
map <leader>/ gcc

map <leader>g gg=G
map <leader>l :vsp<CR>
map <leader>q :q<CR>
map <leader>s magg=G`a:w<CR>
map <leader>o o<Esc>
map <leader>O O<Esc>
" this command uses CtrlP
map <leader>C :CtrlPClearAllCaches<cr>
" this command uses NerdTree
map <leader>c :set norelativenumber nonumber<CR>:NERDTreeFocus<CR>:q<CR>
map <leader>num :set relativenumber number<CR>
map <leader>n :NERDTreeFocus<CR>

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
map <leader>bind orequire 'pry'<CR>binding.pry<Esc>

" leaders for rails testing
map <leader>rexp oexpect().to eq()<Esc>8hi
map <leader>rdesc odesc '' do<Esc>3hi
map <leader>rit oit '' do<Esc>3hi

" leaders for javascript
map <leader>con oconsole.log()<Esc>i

" leaders for html
map<leader>div o<div></div><Esc>5hi

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" pathogen
execute pathogen#infect()

" nerd tree
" open nerdtree on startup and move cursor to file
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" " close vim if nerdtree is the only window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
" b:NERDTree.isTabTree()) | q | endif

let NERDTreeDirArrowExpandable='+'
let NERDTreeDirArrowCollapsible='~'
set mouse+=a
