" language
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

" set row number
set number

" enable mouse
set mouse=a

" colors
colorscheme spacegray
let g:spacegray_underline_search = 1
" let g:spacegray_italicize_comments = 1
syntax enable

" indent
set expandtab "$B%?%VF~NO$rJ#?t$N6uGrF~NO$KCV$-49$($k(B
set tabstop=2 "$B2hLL>e$G%?%VJ8;z$,@j$a$kI}(B
set shiftwidth=2 "$B<+F0%$%s%G%s%H$G$:$l$kI}(B
set softtabstop=2 "$BO"B3$7$?6uGr$KBP$7$F%?%V%-!<$d%P%C%/%9%Z!<%9%-!<$G%+!<%=%k$,F0$/I}(B
set autoindent "$B2~9T;~$KA0$N9T$N%$%s%G%s%H$r7QB3$9$k(B
set smartindent "$B2~9T;~$KF~NO$5$l$?9T$NKvHx$K9g$o$;$F<!$N9T$N%$%s%G%s%H$rA}8:$9$k(B

" complete parent
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>

"---------- NEOBUNDLE ---------- 

" $B5/F0;~$K(B runtimepath $B$K(B NeoBundle $B$N%Q%9$rDI2C$9$k(B
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
 
" NeoBundle$B@_Dj$N3+;O(B
call neobundle#begin(expand('~/.vim/bundle'))
 
" NeoBundle$B$N%P!<%8%g%s$r(BNeoBundle$B<+?H$G4IM}$9$k(B
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
			\ 'build' : {
			\     'windows' : 'tools\\update-dll-mingw',
			\     'cygwin' : 'make -f make_cygwin.mak',
			\     'mac' : 'make -f make_mac.mak',
			\     'linux' : 'make',
			\     'unix' : 'gmake',
			\    },
			\ }
" $B%$%s%9%H!<%k$7$?$$%W%i%0%$%s$r5-=R(B
" emmet
NeoBundle 'mattn/emmet-vim'
" let g:user_emmet_leader_key='<c-t>'
" $B%U%!%$%k%^%M!<%8%c(B
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" TypeScript
if v:version >= 704
  NeoBundle 'Quramy/tsuquyomi'
endif
NeoBundle 'https://github.com/leafgarland/typescript-vim.git'
NeoBundle 'clausreinke/typescript-tools.vim'
" $B$=$NB>(B
NeoBundle 'scrooloose/syntastic'


" NeoBundle$B@_Dj$N=*N;(B
call neobundle#end()
 
filetype plugin indent on
 
" vim$B5/F0;~$KL$%$%s%9%H!<%k$N%W%i%0%$%s$r%$%s%9%H!<%k$9$k(B
NeoBundleCheck

"---------- VUNDLE ---------- 
" set nocompatible
" filetype off
" 
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" 
" " let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'chriskempson/base16-vim'
" 
" " All of Plugins must be added before the following line
" call vundle#end()
" filetype plugin indent on
 
"---------- PATHOGEN ----------
execute pathogen#infect()

