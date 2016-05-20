" -- lang
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

nnoremap <silent><C-e> :NERDTreeToggle<CR>

" -- colors
" syntax enable
" set background=light
" colorscheme solarized
" let g:solarized_termcolrs=256

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Shougo/vimproc'
if v:version >= 704
	NeoBundle 'Quramy/tsuquyomi'
endif
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/neomru'
" NeoBundle 'git://github.com/kien/ctrlp.vim.git'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'groenewege/vim-less'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" -- unite.vim $B$N@_Dj(B

" $BF~NO%b!<%I$G3+;O$9$k(B
let g:unite_enable_start_insert=1
" $B%P%C%U%!0lMw(B
noremap <C-P> :Unite buffer<CR>
" $B%U%!%$%k0lMw(B
noremap <C-N> :Unite -buffer-name=file file<CR>
" $B:G6a;H$C$?%U%!%$%k$N0lMw(B
noremap <C-Z> :Unite file_mru<CR>
" sources$B$r!V:#3+$$$F$$$k%U%!%$%k$N%G%#%l%/%H%j!W$H$9$k(B
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" $B%&%#%s%I%&$rJ,3d$7$F3+$/(B
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split') 
" $B%&%#%s%I%&$r=D$KJ,3d$7$F3+$/(B
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESC$B%-!<$r(B2$B2s2!$9$H=*N;$9$k(B
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>


" -- TypeScript
" Bundle 'typescript-vim'
" autocmd BufRead,BufNewFile, *.ts set filetype=typescript

" -- Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'typescript-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
