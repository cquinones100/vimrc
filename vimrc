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
Plugin 'rhysd/vim-crystal'
Plugin 'christoomey/vim-tmux-runner'

call vundle#end()            " required
filetype plugin indent on    " required

" let g:indentguides_tabchar = '|'

" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=blue   ctermbg=9
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=blue ctermbg=8

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
map <leader>rss :vertical resize 80<CR>
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

function! GitAddCurrentFile()
  let current_path = expand('%:p')

  :call system('git add ' . current_path)
endfunction

map <leader>add :call GitAddCurrentFile()<CR>

function! GitCheckoutCurrentFile()
  let current_path = expand('%:p')

  :call system('git checkout -- ' . current_path)
endfunction

map <leader>checkout :call GitCheckoutCurrentFile()<CR>

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

map <leader>runner :VtrOpenRunner { "orientation": "h" }<cr>
map <leader>send :VtrSendLinesToRunner<CR>
map <leader>killrunner :VtrKillRunner<cr>

function! FindInstanceVariables()
  :normal o
  :normal o
  :normal iprivate
  :normal o
  :normal o

  let array = []
  let currentPos = getpos('.')
  
  :call search("@")

  while index(array, expand("<cword>")) == -1
    :call add(array, expand("<cword>"))

    :call search("@")
  endwhile

  :call setpos('.', currentPos)

  :normal iattr_reader

  for i in array
    :call append(line('.'), ":")
    :normal J
    :call append(line('.'), i)
    :normal Jx
  endfor

  :normal ,ind
endfunction

map <leader>aa :call FindInstanceVariables()<CR>

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

