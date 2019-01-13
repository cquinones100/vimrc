set nocompatible
filetype off

let g:NERDTreeNodeDelimiter = "\u00a0"

set encoding=UTF-8

set number relativenumber
set commentstring

set shiftwidth=2
set ruler
set laststatus=2

set tabstop=2 shiftwidth=2 expandtab
set backupcopy=yes

syntax on
colorscheme desert

set t_Co=256

call plug#begin('~/.vim/bundle')
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"ctrl p
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

let mapleader = ","

" leaders for vim
" this command uses vim-commentary
map <leader>/ gcc<ESC>

map <leader>sv :source ~/.vimrc<CR>
map <leader>ind =<CR>

" leader to split hash into new lines
map <leader>x V:s/, /,\r/g<CR>

" leader to split line with spaces into new lines
map <leader>z f<Space>lxi<CR><ESC>

map <leader>i magg=G`a
map <leader>g gg=G
map <leader>l :vsp<CR>
map <leader>q :q<CR>
map <leader>s :w<CR>

function! SearchForFocus()
  let found = 'false'
  let ruby_focuses = ['fit ', 'fdescribe ', 'fcontext ', 'fsubject ']

  for i in ruby_focuses
    :call search(i)
  endfor
endfunction

" RSpec.vim mappings
map <Leader>rt :call RunCurrentSpecFile()<CR>
" map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" search in file
map <leader>f ?

" search for ruby test focuses
map <leader>fit :call SearchForFocus()<Cr>

"add comma to end of line
map <leader>f, $a,<Esc>

map <leader>x :s/, /,\r/g<CR>
map <leader>z :s/=>/ => /g<CR>

" map <leader>o o<Esc>
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
map <leader>rdesc odescribe '' do<CR>end<Esc>k3h9la
map <leader>rcont ocontext '' do<CR>end<Esc>k3h8la
map <leader>rit oit '' do<CR>end<Esc>k3h3la
map <Leader>ij :call search('it')<CR>
map <Leader>ik ?it<CR>
map <Leader>dj :call search('describe')<CR>
map <Leader>dk ?describe<CR>

" leaders for javascript
map <leader>con oconsole.log()<Esc>i

" leaders for html
map<leader>div o<div></div><Esc>5hi

" RSpec.vim mappings
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'vim-syntastic/syntastic'
Plugin 'thoughtbot/vim-rspec'
Plugin 'JamshedVesuna/vim-markdown-preview'

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
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'
set mouse+=a
