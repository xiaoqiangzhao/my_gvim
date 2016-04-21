" An example for a vimrc file.

"

" Maintainer:     Bram Moolenaar <Bram@vim.org>

" Last change:    2001 Jul 18

"

" To use it, copy it to

"     for Unix and OS/2:  ~/.vimrc

"                    for Amiga:  s:.vimrc

"  for MS-DOS and Win32:  $VIM\_vimrc

"                  for OpenVMS:  sys$login:.vimrc

 

" When started as "evim", evim.vim will already have done these settings.

if v:progname =~? "evim"

  finish

endif

 

" Use Vim settings, rather then Vi settings (much better!).

" This must be first, because it changes other options as a side effect.

set nocompatible
"set spell spelllang=en_us
set wildmenu 

" allow backspacing over everything in insert mode

set backspace=indent,eol,start

 

set autoindent                  " always set autoindenting on

"if has("vms")
"
"  set nobackup                   " do not keep a backup file, use versions instead
"
"else
"
"  set backup                        " keep a backup file
"
"endif

set nobackup                     " do not keep a backup file, use versions instead

set history=100                   " keep 50 lines of command line history

set ruler                               " show the cursor position all the time

set showcmd                     " display incomplete commands

set incsearch                      " do incremental searching

 

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries

" let &guioptions = substitute(&guioptions, "t", "", "g")

 

" Don't use Ex mode, use Q for formatting

map Q gq

 

" Make p in Visual mode replace the selected text with the "" register.

vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR> 
nmap <C-Space>v :!fdef.pl -v <C-R>=expand("<cword>") <CR><CR> 
nmap <Space>c :!fdef.pl -c -v <C-R>=expand("<cword>")  <CR><CR>
nmap <Space>b :!fdef.pl -t -v <C-R>=expand("<cword>")  <CR><CR>
nmap <Space>m :!verilog_rtl.pl -m <C-R>=expand("<cword>") <CR><CR>
nmap <Space>n :!verilog_rtl.pl -d <C-R>=expand("<cword>") <CR><CR>
nmap <Space>o :!/home/b51816/find_sv.pl <C-R>=expand("<cword>") <CR><CR>
nmap <Space>s :!/home/b51816/st_testbench.pl <C-R>=expand("<cword>") <CR><CR>
nmap <Space>q :q <CR><CR>
nmap <Space>w :w <CR><CR>
nmap <Space>i :!jay_memory_locate.py --addr=<C-R>=expand("<cword>") <CR><CR>
nmap tb :tabp <CR><CR>
nmap tn :tabn <CR><CR>
nmap <Space>t :tabedit  
nmap <Space>f :tabedit <C-R>%
map <F4> :%s//&/gn
map <F5> 0i//<ESC>j
map do :! dssc co -noc -lock %<CR>
map di :! dssc ci -noc %<CR>
map cir :! run.pl -f %  -show
map cr :! run.pl -f % 
" This is an alternative that also works in block mode, but the deleted

" text is lost and it only works for putting the current register.

"vnoremap p "_dp
" Switch syntax highlighting on, when the terminal has colors

" Also switch on highlighting the last used search pattern.

"if &t_Co > 2 || has("gui_running")
"
"  syntax on
"
"  set hlsearch
"
"endif

 

" Only do this part when compiled with support for autocommands.

if has("autocmd")

 

  " Enable file type detection.

  " Use the default filetype settings, so that mail gets 'tw' set to 72,

  " 'cindent' is on in C files, etc.

  " Also load indent files, to automatically do language-dependent indenting.

  "filetype off
  "filetype plugin indent on

 

  " For all text files set 'textwidth' to 78 characters.

  "autocmd FileType text setlocal textwidth=78

 

  " When editing a file, always jump to the last known cursor position.

  " Don't do it when the position is invalid or when inside an event handler

  " (happens when dropping a file on gvim).

 

endif " has("autocmd")

set ic

set tags=~/tags
set tags=/proj/imx6ul/design/workarea/b51816/IMX6UL_N1_1.6/tags
set autochdir
set ts=2

set sts=2

set sw=2

set sta

set et

set noai

autocmd BufEnter * cd %:p:h

set nostartofline
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
syntax enable 

runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
set hlsearch
set number
"set cscopequickfix=s-,c-,d-,i-,t-,e-
"colorscheme murphy
"colorscheme slate
"colorscheme torte
"colorscheme desert 
colorscheme  evening
"highlight Normal guibg=white
"
"highlight Cursor guibg=#466789 guifg=white
"
"highlight lCursor guibg=red guifg=NONE
"
"highlight Constant gui=NONE guibg=white
"
"highlight Special gui=NONE guibg=white
set laststatus=2
set background=dark
set encoding=utf-8
"colorscheme desertdoceanburnt
"colorscheme solarized
"colorscheme molokai
let g:Powerline_colorscheme='solarized256'
"let g:Powerline_colorscheme='desertdoceanburnt'
set gcr=a:block-blinkon0
hi Visual               guibg=GREEN guifg=BLACK
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T

let mapleader=";"
nmap <Leader>b 0
nmap <Leader>e $
nmap <Leader>pa %
nmap <Leader>cm :! 
set nowritebackup


set shiftwidth=3

set softtabstop=2


set ignorecase

map M :%s/\s\+$//

":winpos 200 0

set lines=25

set columns=100

set confirm

set expandtab

"set clipboard+=unnamed

"taglist 
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"winmanager
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>

filetype on 

filetype plugin on 

filetype indent on
map <silent> gn :NERDTree<cr>
let NERDTreeMinimalUI=1
set viminfo+=! 

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2

let g:indent_guides_guide_size=1
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
"set foldmethod=syntax
set foldmethod=indent
set nofoldenable
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }
" *.cpp 和 *.h 间切换
"nmap <Leader>ch :A<CR>
" 子窗口中显示 *.cpp 或 *.h
nmap <Leader>ch :AT<CR>

let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1:0',
        \ 'p:prototypes:1:0',
        \ 'g:enums',
        \ 'e:enumerators:0:0',
        \ 't:typedefs:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:variables:0:0',
    \ ],
\ }

let g:tagbar_type_verilog = {
    \ 'kinds' : [
        \ 'c:constants:0:0',
        \ 'e:events',
        \ 'f:functions',
        \ 'm:modules',
        \ 'n:net data types',
        \ 'p:ports',
        \ 'r:register data types',
        \ 't:tasks',
    \ ],
\ }

let g:tagbar_type_c = {
    \ 'kinds' : [
        \ 'd:macros:1:0',
        \ 'p:prototypes:1:0',
        \ 'g:enums',
        \ 'e:enumerators:0:0',
        \ 't:typedefs:0:0',
        \ 's:structs',
        \ 'u:unions',
        \ 'm:members:0:0',
        \ 'v:variables:0:0',
        \ 'f:functions',
    \ ],
\ }
"\ 'r:variables:1:0',

let g:tagbar_type_perl = {
    \ 'kinds' : [
        \ 'p:packages:1:0',
        \ 'c:constants:0:0',
        \ 'f:formats:0:0',
        \ 'l:labels',
        \ 's:subroutines',
    \ ],
\ }
let g:tagbar_type_vhdl = {
    \ 'kinds' : [
        \ 'P:packages:1:0',
        \ 'c:constants:0:0',
        \ 't:types',
        \ 'T:subtypes',
        \ 'r:records',
        \ 'e:entities',
        \ 'f:functions',
        \ 'p:procedures',
    \ ],
\ }
"let g:tagbar_type_systemverilog = {
"    \ 'kinds' : [
"        \ 'b:blocks:1',
"        \ 'c:classes:1:0',
"        \ 'e:events:1:0',
"        \ 'f:functions:1:0',
"        \ 'm:modules',
"        \ 'n:nets:1:0',
"        \ 'p:ports:1:0',
"        \ 't:tasks:1',
"        \ 'A:assertions:1',
"        \ 'C:contraints:1:0',
"        \ 'V:covergroups:1:0',
"        \ 'v:coverpoints:1:0',
"        \ 'I:interfaces',
"        \ 'M:modport',
"        \ 'K:packages',
"        \ 'P:programs',
"        \ 'R:properties',
"        \ 'T:typedefs',
"    \ ],
"\ }

let g:tagbar_type_systemverilog = {
        \ 'ctagstype'   : 'SystemVerilog',
        \ 'kinds'       : [
            \ 'b:blocks:1:1',
            \ 'c:classes:1:0',
            \ 'e:events:1:0',
            \ 'f:functions:1:0',
            \ 'm:modules:0:1',
            \ 'n:nets:1:0',
            \ 'p:ports:1:0',
            \ 't:tasks:1:1',
            \ 'A:assertions:1:1',
            \ 'C:contraints:1:0',
            \ 'V:covergroups:1:0',
            \ 'v:coverpoints:1:0',
            \ 'I:interfaces:0:1',
            \ 'M:modport:0:1',
            \ 'K:packages:0:1',
            \ 'P:programs:0:1',
            \ 'R:properties:0:1',
            \ 'T:typedefs:0:1'
        \ ],
        \ 'sro'         : '.',
    \ }
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1
let g:tagbar_width =  20
let g:tagbar_ctags_bin = '/home/b51816/ctags-5.8/ctags'
"let g:tagbar_show_linenumbers = 1
let g:tagbar_foldlevel = 3
let g:tagbar_autoshowtag = 1
nnoremap <Leader>tb  :TagbarToggle<CR>
nnoremap <Leader>tf  :TagbarSetFoldlevel 0<CR>
nnoremap <Leader>ts  :TagbarShowTag<CR>
"set linespace=0
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>


" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
imap <F9> <C-X><C-O>
"enable backspace  
"set whichwrap+=<,>,h,l 
"let g:UltiSnipsSnippetDirectories=["vim-snippets/UltiSnips"]    need vim-v7.4
"set noerrorbells
"set fillchars=vert:\ ,stl:\ ,stlnc:\
set guifont=NimbusMonoL\ 12   "set the font of gvim
"colorscheme slate
set cursorline  
  hi cursorline guibg=#555555
set cursorcolumn
  hi CursorColumn guibg=#555555 
  "hi CursorColumn guibg=grey
set noeb "not enable the bell, below is the value of the bell
"set vb vb_t=<Esc>|1f
set tags+=~/tags/socqm_021.8.capi_vip
set tags+=~/tags/sigmtel.tags
"source ~/.vim/bundle/tabular/plugin/Tabular.vim
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 0
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
set omnifunc=syntaxcomplete#Complete
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


