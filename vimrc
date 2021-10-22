syntax enable
colorscheme solarized
set background=dark

set nocompatible              " be iMproved, required
filetype off                  " required
set nocompatible               
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
set noswapfile
set tags=./tags,tags;

" syntax enable
" set background=dark
" colorscheme solarized
" set cursorcolumn
"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-rails'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'tpope/vim-commentary'

Plugin 'thoughtbot/vim-rspec'

Plugin 'neoclide/coc.nvim'
Plugin 'dense-analysis/ale'

Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

let mapleader = ","

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" move through panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> <C-W> :q<CR>
nmap <silent> <C-]> :call CocAction('jumpDefinition', 'vsplit')<CR>

set guicursor=
" Workaround some broken plugins which set guicursor indiscriminately.
autocmd OptionSet guicursor noautocmd set guicursor=
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let g:ale_completion_enabled = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_linters = {
\   'ruby': ['solargraph', 'rubocop'],
\   'javascript.jsx': ['eslint'],
\ }
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'scss': ['prettier'],
\   'ruby': ['rubocop'],
\   'eruby.yaml': ['prettier'],
\ }

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

function! SearchInProject()
  let l:word = expand("<cword>")

  execute "normal! :Ack" . word
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

noremap <Leader>s :call SearchInProject()<CR>
