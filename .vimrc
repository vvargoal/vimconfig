"vim-plug
" Install vim-plug automatically if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
":PlugUpdate
":PlugUpgrade
call plug#begin('~/.vim/bundle')
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'mattn/vdbi-vim'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" then :GoInstallBinaries
Plug 'tpope/vim-surround',
" then vim -u NONE -c "helptags surround/doc" -c q
call plug#end()

" vim-jsx, vim-javascript
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" ale
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wextra' 
let g:ale_cpp_gcc_options = '-std=c++17 -Wall -Wextra'
" -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include -I/Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk/usr/include' 
let g:ale_cpp_clangtidy_checks = ['*,-misc-unused-parameters,-llvm-header-guidelines,-readability-named-parameter,-clang-diagnostic-error,-fuchsia-*,-readability-implicit-bool-conversion']
let g:ale_cpp_clangtidy_options = '-- -std=c++17 -Wall -Wextra'
" -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include -I/Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk/usr/include'
let g:ale_cpp_clang_executable = '/usr/local/opt/llvm/bin/clang++'
let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"

" let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wextra -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include -I/Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk/usr/include'
" " '-I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1 -I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/10.0.0/include -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/usr/include'
" let g:ale_cpp_clangtidy_executable = '/usr/local/Cellar/llvm/7.0.1/bin/clang-tidy'
" let g:ale_cpp_gcc_executable = '/usr/local/bin/gcc'

" Allows correct version of python to be detected
" let $PATH = '/usr/local/bin:'.$PATH

" enables detecting of filetypes and indents
filetype plugin on
filetype indent on

set cursorline
set showmode

color wombat

syntax on

set vb                          " disable bells

" set nowrap                      " wrap long lines
set autoindent                  " indent at the same level of the
set shiftwidth=4                " use indents of 4 spaces
set expandtab                   " tabs are spaces, not tabs
set tabstop=4                   " an indentation every four
set softtabstop=4               " let backspace delete indent

autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype javascript.jsx setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype coffeescript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 sts=2 expandtab

" Be smart when using tabs ;)
set smarttab
set ai "Auto indent
set si "Smart indent

set mouse=a
let loaded_matchparen=1       " turn off highlighting of matched parens
set virtualedit=onemore
set history=1000
" set spell
set tabpagemax=15
set showmode
set cursorline
set backspace=indent,eol,start  " backspace for dummys
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " show matching
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set winminheight=0              " windows can be 0 line high 
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set wildmenu                    " show list instead of justcompleting
set wildmode=list:longest,full  " command <Tab> completion, list
set whichwrap=b,s,<,>,[,]       " backspace and not cursor keys wrap
" set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap
set scrolljump=5                " lines to scroll when cursor
set scrolloff=3                 " minimum lines to keep above and
set foldenable                  " auto fold code
" set gdefault                    " the /g flag on :s substitutions
" set list                  jk    " highlight non-characters
set listchars=tab:>.,trail:.,extends:\#,nbsp:. " Highlight
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
" A buffer becomes hidden when it is abandoned
set hid
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" wrap on full words
set linebreak

au BufEnter *.c compiler gcc " set gcc as default c compiler

" YouCompleteMe
" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" let g:ycm_confirm_extra_conf = 1
let g:ycm_autoclose_preview_window_after_completion = 1 " Close the preview window automatically
set noequalalways " Turn off window resize on closing preview window
" let g:ycm_python_binary_path = '/usr/local/bin/python3' " Don't use anaconda version
let g:ycm_seed_identifiers_with_syntax = 1

" hi cursorline guibg=\#333333     " highlight bg color of current
" hi CursorColumn guibg=\#333333   " highlight cursor

if has('cmdline_info')
    set ruler                   " show the ruler
    set showcmd                 " show partial commands in status
endif

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set undofile
set undodir=~/.vim/undodir " Persistent undo

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)
