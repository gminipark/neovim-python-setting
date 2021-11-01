set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'

let g:ycm_confirm_extra_conf = 0

"To avoid conflict snippets
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>gg :YcmCompleter GoToImprecise<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>p :YcmCompleter GetParent<CR>

Plugin 'hynek/vim-python-pep8-indent'   " python 자동 들여쓰기 Plugin
filetype plugin indent on               " python 자동 들여쓰기 on

Plugin 'vim-airline/vim-airline' " 사용자의 하단 상태바 지원
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='onedark'

Plugin 'vim-syntastic/syntastic' " 문법 체크

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

Plugin 'Yggdroot/indentLine' " indent위치 표시

" color scheme
Plugin 'joshdick/onedark.vim'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'

Plugin '907th/vim-auto-save' " 자동 저장

call vundle#end()

let g:syntastic_python_checkers = ['pylint']

colorscheme onedark

" Nerdcommenter setting
"Create default mappings
let mapleader=","

let g:NERDCreateDefaultMappings = 1
"Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'p': {'left' : '#'} }
" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" auto-save
let g:auto_save = 1 
let g:auto_save_events = ['InsertLeave', "TextChanged"]

if has("syntax")
syntax on           "구문 강조
endif

set nu              "Line 출력
set tabstop=4       "<Tab> key 4칸 이동
set cursorline      "현재 줄 강조
set noswapfile 		"swap 파일 생성안함
set hlsearch		"검색어 강조
set clipboard=unnamed "clipboard
"set t_Co=256
"highlight Visual cterm=reverse ctermbg=NONE


