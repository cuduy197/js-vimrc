"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

let $vimhome=fnamemodify(resolve(expand("~/.vimrc")), ':p:h')
let $vundle=$vimhome."/bundle/Vundle.vim"

" Be iMproved
set nocompatible              " be iMproved, required
set backspace=indent,eol,start
set encoding=utf-8
set fileencodings=utf-8
set wm=2
set tw=79
set number
"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=$vundle
call vundle#begin()

		Plugin 'VundleVim/Vundle.vim'

		" Plugin 'Valloric/YouCompleteMe'
		
		" Ui
		Plugin 'scrooloose/nerdtree'
		Plugin 'jistr/vim-nerdtree-tabs'
		Plugin 'bling/vim-airline'
		Plugin 'mattn/emmet-vim'
		Plugin 'airblade/vim-gitgutter'
		Plugin 'xuyuanp/nerdtree-git-plugin'
		Plugin 'jiangmiao/auto-pairs'
		Plugin 'chrisbra/colorizer'
		
		" Other file type 
		Plugin 'digitaltoad/vim-jade'
		Plugin 'posva/vim-vue'
		Plugin 'ekalinin/dockerfile.vim'
		Plugin 'mustache/vim-mustache-handlebars'
		Plugin 'evanmiller/nginx-vim-syntax'
		" Javascript
		
		Plugin 'pangloss/vim-javascript'
		" Plugin 'millermedeiros/vim-esformatter'
		Plugin 'mitermayer/vim-prettier'
		Plugin 'maksimr/vim-jsbeautify'
		Plugin 'mxw/vim-jsx'


call vundle#end()                           " required

"=====================================================
"" General settings
"=====================================================

syntax on

" Disable preview
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1


"Insert map 
" Exit in insert mode
inoremap jk <Esc>
inoremap <F2> <C-R>=undo<CR>


autocmd vimenter * NERDTree

" Stick needtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Custom setting
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


".JsBeautify
map <c-f> :Prettier<cr>
" or
autocmd FileType javascript noremap <silent> <buffer>  <c-f> :Prettier<cr>
" for json
autocmd FileType json noremap <silent> <buffer> <c-f> :JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <silent> <buffer> <c-f> :Prettier<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :Prettier<cr>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "|",
    \ "Renamed"   : "~",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "!",
    \ "Dirty"     : "@",
    \ "Clean"     : "^",
    \ 'Ignored'   : 'ig',
    \ "Unknown"   : "?"
    \ }

let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_autofind=1

" Pretiter
let g:prettier#config#print_width = 120
" let g:prettier#config#use_tabs = "true"


map <C-Up> :wincmd k<CR>
map <C-Down-Down> :wincmd j<CR>
map <C-Left> :wincmd h<CR>
map <C-Right> :wincmd l<CR>

map <C-e> :NERDTreeToggle<CR>
map <f1> :NERDTreeToggle<CR>
map <f2> :tabnew<CR>
map <f3> :tabn<CR>
map <f4> :q!<CR>

map <f12> :PluginInstall<CR>

map <C-s> :w<CR>
map <C-z> :undo<CR>
map <C-r> :redo<CR>
map <C-q> :q<CR>
