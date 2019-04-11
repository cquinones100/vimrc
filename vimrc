set nocompatible               " be iMproved
set number relativenumber
set clipboard=unnamed
set shiftwidth=2
set ruler
set laststatus=2
set tabstop=2 shiftwidth=2 expandtab
set backupcopy=yes
set mouse+=a
set textwidth=80
set colorcolumn=+0
set cursorcolumn
set noswapfile
au BufNewFile,BufRead *.jbuilder set ft=ruby

syntax enable
set background=dark
colorscheme solarized

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
Plugin 'tpope/vim-fugitive.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized.git'

call vundle#end()            " required
filetype plugin indent on    " required

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:NERDTreeNodeDelimiter = "\u00a0"

let mapleader = ","

" comment
map <leader>/ gcc<ESC>

" remove current file
map <leader>rmf :!rm %<CR>,q<CR>

" copy and paste to sytem clipboard
map <leader>c :!pbcopy<CR>u<CR>
map <leader>p :!pbpaste<CR><CR>

map <leader>sv :source ~/.vimrc<CR>:call SetColorAndCursorColumn()<CR>

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

function! GoToSpec()
  let current_path = expand('%:p')
  let relative_path = split(current_path, 'app/')[-1]
  let prefix = ['spec/']
  let suffix = ['_spec.rb']
  let extension_stripped_path = [split(relative_path, '.rb')[0]]

  let concatenated_path = prefix + extension_stripped_path + suffix

  let spec_path = join(concatenated_path, '')

  :execute "vsp" spec_path
endfunction

map <leader>spec :call GoToSpec()<CR>

function! OpenKnotchProjectInBrowser()
  let current_path = expand('%:p')
  let parent_directory = 'knotch/'
  let project_path = split(current_path, parent_directory)[-1]
  let project_name = split(project_path, '/')[0]

  :call system('chrome-cli open ' . 'https://github.com/KnotchLabs/' . project_name)
endfunction

map <leader>kgh :call OpenKnotchProjectInBrowser()<Cr>

map <leader>: 0f:xea: 

" this command uses CtrlP
map <leader>C :CtrlPClearAllCaches<cr>

map <leader>n :NERDTreeFocus<CR>

set t_Co=256

map <leader>bind orequire 'pry'<CR>binding.pry<Esc>

function! SetColorAndCursorColumn() 
  highlight ColorColumn ctermbg=0 guibg=lightgrey
  highlight CursorColumn ctermbg=0 guibg=lightgrey
endfunction

function! RunStartupScript() 
  NERDTree
  wincmd p
  :call SetColorAndCursorColumn()
endfunction

autocmd VimEnter * :call RunStartupScript()

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

