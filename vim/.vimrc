set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" Plugin to automaticallu indent python lines
Plugin 'vim-scripts/indentpython.vim'

" Lightweight status bar and themes for status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Python syntax highlighting
Plugin 'scrooloose/syntastic'

" Plugin for molokai theme
" You need to clone the github project and move the colors file.
Plugin 'tomasr/molokai'

" Plugin 'zxqfl/tabnine-vim'
Plugin 'fatih/vim-go'
set autowrite
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 0
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:go_def_mode = 'godef'
let g:go_decls_includes = "func,type"

" Clipboard
set clipboard=unnamed
:inoremap <C-v> <ESC>"*pa
:vnoremap <C-c> "*y
:vnoremap <C-d> "*d

" All of your Plugins must be added before the following line "Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Make it easier for left hand to not stretch
:inoremap jk <ESC>
":inoremap <ESC> <nop>

"Wean myself off the arrow keys
noremap <Up> <C-U>
noremap <Down> <C-F>
"noremap <Left> <nop>
"noremap <Right> <nop>

"Enable folding
set foldmethod=indent
set foldlevel=99

"Proper PEP8 indentation
au BufNewFile, BufRead *.py, *.txt, *.md
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
  "  set textwidth=79
    set expandtab
    set autoindent
    set smartindent
    set fileformat=unix

" Enable folding with the spacebar
nnoremap <space> za

" set hybrid relative numbering of lines
set relativenumber
set number 

" Set encoding
set encoding =utf-8

" Make python code look pretty
let python_highlight_all=1
syntax on

" Enable mouse scrolling
set mouse=a

" Activate theme
set t_Co=56
colorscheme molokai
call vundle#end()             " required
filetype plugin indent on    " required

set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
