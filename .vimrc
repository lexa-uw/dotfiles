"
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                       (_)_/ |_|_| |_| |_|_|  \___|
"

" NEOBUNDLE {{{ ===============================================================

set nocompatible             " No to the total compatibility with the ancient vi

" NeoBundle auto-installation and setup {{{

" Auto installing NeoBundle
let firstInstallation=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let firstInstallation=0
endif


" Call NeoBundle
if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand($HOME.'/.vim/bundle/'))

" is better if NeoBundle rules NeoBundle (needed!)
NeoBundle 'Shougo/neobundle.vim'
" }}}

" BUNDLES (plugins administrated by NeoBundle) {{{

" Shougo's way {{{

" Vimproc to asynchronously run commands (NeoBundle, Unite)
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Unite. The interface to rule almost everything
NeoBundle 'Shougo/unite.vim'

" Unite sources
NeoBundleLazy 'Shougo/unite-outline', {'autoload':{'unite_sources':'outline'}}
NeoBundleLazy 'tsukkee/unite-help', {'autoload':{'unite_sources':'help'}}
NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload':{'unite_sources':
            \ 'colorscheme'}}
NeoBundleLazy 'ujihisa/unite-locate', {'autoload':{'unite_sources':'locate'}}
NeoBundleLazy 'thinca/vim-unite-history', { 'autoload' : { 'unite_sources' :
            \ ['history/command', 'history/search']}}
NeoBundleLazy 'osyo-manga/unite-filetype', { 'autoload' : {'unite_sources' :
            \ 'filetype', }}
NeoBundleLazy 'osyo-manga/unite-quickfix', {'autoload':{'unite_sources':
            \ ['quickfix', 'location_list']}}
NeoBundleLazy 'osyo-manga/unite-fold', {'autoload':{'unite_sources':'fold'}}
NeoBundleLazy 'tacroe/unite-mark', {'autoload':{'unite_sources':'mark'}}
NeoBundleLazy 'Shougo/neomru.vim', {'autoload':{'unite_sources':
            \['file_mru', 'directory_mru']}}

" Junk files
NeoBundleLazy 'Shougo/junkfile.vim', {'autoload':{'commands':'JunkfileOpen',
            \ 'unite_sources':['junkfile','junkfile/new']}}

" Unite plugin that provides command line completition
NeoBundle 'joedicastro/unite-cmdmatch'

" Unite plugin that provides spell suggestions
NeoBundle 'kopischke/unite-spell-suggest'
" }}}

" Colorschemes {{{

" jnurmine/Zenburn
NeoBundle 'jnurmine/Zenburn'

" Dark themes
" Improved terminal version of molokai, almost identical to the GUI one
NeoBundleLazy 'joedicastro/vim-molokai256', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}

NeoBundleLazy 'tomasr/molokai', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}

NeoBundleLazy 'sjl/badwolf', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'nielsmadan/harlequin', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}


" Light themes
NeoBundleLazy 'vim-scripts/summerfruit256.vim', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'joedicastro/vim-github256', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}

" Make terminal themes from GUI themes
"NeoBundleLazy 'godlygeek/csapprox', { 'autoload' :
"        \ { 'commands' : ['CSApprox', 'CSApproxSnapshot']}}

" }}}

" DCVS {{{
"
" Admin Git
NeoBundle 'tpope/vim-fugitive'
" Show git repository changes in the current file
NeoBundle 'airblade/vim-gitgutter'
" Git viewer
NeoBundleLazy 'gregsexton/gitv', {'depends':['tpope/vim-fugitive'],
            \ 'autoload':{'commands':'Gitv'}}

" }}}

" Markdown & reStructuredText {{{

" Markdown Syntax
NeoBundleLazy 'joedicastro/vim-markdown'
" reStructuredText in vim. Your personal Wiki in RST
NeoBundleLazy 'Rykka/riv.vim', {'autoload': {'filetypes': ['rst']}}

" }}}

" Linux tools {{{

" A diff tool for directories
NeoBundleLazy 'joedicastro/DirDiff.vim', { 'autoload': { 'commands' : 'DirDiff'}}
" Hexadecimal editor
NeoBundle 'Shougo/vinarise.vim'

" }}}

" Python {{{

" Autocompletion
NeoBundle 'Shougo/neocomplete.vim'
" A Python plugin
NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': ['python']}}
" Admin virtualenvs
NeoBundle 'jmcantrell/vim-virtualenv'
" Show reports from coverage.py
NeoBundleLazy 'alfredodeza/coveragepy.vim', {'autoload': {'filetypes': ['python']}}
" Sort imports
 NeoBundle 'fisadev/vim-isort', {'autoload': {'filetypes': ['python']}}
" }}}

" Code Snippets {{{

" Powerful and advanced Snippets tool
NeoBundle 'SirVer/ultisnips'
" Snippets for Ultisnips
NeoBundle 'honza/vim-snippets'

" }}}

" Syntax {{{

NeoBundleLazy 'elzr/vim-json', {'filetypes' : 'json'}
NeoBundleLazy 'vim-scripts/po.vim--gray', {'autoload': {'filetypes': ['po']}}
NeoBundleLazy 'joedicastro/vim-pentadactyl', {
            \ 'autoload': {'filetypes': ['pentadactyl']}}
NeoBundle 'scrooloose/syntastic'

" }}}

" Text edition {{{

" Autocompletion of (, [, {, ', ", ...
NeoBundle 'delimitMate.vim'
" to surround vim objects with a pair of identical chars
NeoBundle 'tpope/vim-surround'
" toggle comments
NeoBundle 'tomtom/tcomment_vim', { 'autoload' : {'commands': 'TComment'} }
" smart digraphs insertion
NeoBundle 'Rykka/easydigraph.vim'
" browse the vim undo tree
NeoBundleLazy 'sjl/gundo.vim', { 'autoload' : {'commands': 'GundoToggle'}}
" to insert lorem ipsum blocks
NeoBundleLazy 'vim-scripts/loremipsum', { 'autoload' :
            \ { 'commands' : 'Loremipsum'}}
" reveals all the character info, Unicode included
NeoBundle 'tpope/vim-characterize'
" transpose lines and text blocks
NeoBundleLazy 'salsifis/vim-transpose', { 'autoload' :
            \ { 'commands' : 'Transpose'}}
" marks admin
NeoBundle 'kshenoy/vim-signature'

" }}}

" HTML/CSS {{{

" A smart and powerful Color Management tool. Needs to be loaded to be able
" to use the mappings
NeoBundleLazy 'Rykka/colorv.vim', {'autoload' : {
            \ 'commands' : [
                             \ 'ColorV', 'ColorVView', 'ColorVPreview',
                             \ 'ColorVPicker', 'ColorVEdit', 'ColorVEditAll',
                             \ 'ColorVInsert', 'ColorVList', 'ColorVName',
                             \ 'ColorVScheme', 'ColorVSchemeFav',
                             \ 'ColorVSchemeNew', 'ColorVTurn2'],
            \ }}

NeoBundleLazy 'othree/html5.vim', {'autoload':
            \ {'filetypes': ['html', 'xhtml', 'css']}}

NeoBundleLazy 'mattn/emmet-vim', {'autoload':
            \ {'filetypes': ['html', 'xhtml', 'css', 'xml', 'xls', 'markdown']}}

NeoBundleLazy 'kchmck/vim-coffee-script',{'autoload' : {
            \ 'commands' : [
                             \ 'CoffeeCompile', 'CoffeeLint', 'CoffeeMake',
                             \ 'CoffeeRun', 'CoffeeWatch'],
            \ 'filetypes' : ['coffee']
            \ }}

" }}}

" GUI {{{

" A better looking status line
NeoBundle 'bling/vim-airline'
" Zooms a window
NeoBundleLazy 'vim-scripts/zoomwintab.vim', {'autoload' :
            \{'commands' : 'ZoomWinTabToggle'}}
" easily window resizing
NeoBundle 'jimsei/winresizer'
" Show indent lines
NeoBundleLazy 'Yggdroot/indentLine', {'autoload':
            \ {'filetypes': ['python', 'php', 'phtml', 'json',
            \ 'html', 'xhtml', 'js', 'rst', 'md', 'css', 'nginx']}}

" }}}

" DBMS {{{

NeoBundleLazy 'joedicastro/dbext.vim', { 'autoload' : { 'filetypes' : 'sql'}}

" }}}

" startify {{{

NeoBundle 'mhinz/vim-startify'

" }}}

" easymotion {{{

NeoBundle  'Lokaltog/vim-easymotion'

" }}}

" majutsushi/tagbar {{{

NeoBundleLazy 'majutsushi/tagbar', {'autoload':
            \ {'filetypes': ['php', 'go', 'python', 'js']}} 

" }}}

" othree/xml.vim {{{

NeoBundleLazy 'othree/xml.vim', {'autoload':
            \ {'filetypes': ['xml', 'sgml', 'xslt']}}   

" }}}

" AndrewRadev/splitjoin.vim {{{

NeoBundle 'AndrewRadev/splitjoin.vim'

" }}}

" PHP {{{

NeoBundleLazy 'joshtronic/php.vim', {'autoload': {'filetypes': ['php']}}
NeoBundleLazy 'tagbar-phpctags', {'autoload': {'filetypes': ['php']}}
NeoBundleLazy 'pdv-standalone', {'autoload': {'filetypes': ['php']}}
NeoBundleLazy 'm2mdas/phpcomplete-extended',
            \ {'autoload': {'filetypes': ['php']}}
NeoBundleLazy 'evidens/vim-twig', {'depends': ['joshtronic/php.vim']}

" }}}

" GO {{{

NeoBundleLazy 'fatih/vim-go', {'autoload': {'filetypes': ['go']}}
NeoBundleLazy 'nsf/gocode', {'autoload': {'filetypes': ['go']}}
NeoBundleLazy 't-yuki/vim-go-coverlay', {'autoload': {'filetypes': ['go']}}

" }}}

" nginx {{{

NeoBundleLazy 'nginx.vim', {'autoload': {'filetypes': ['nginx']}}

" }}}

" puppet {{{

NeoBundleLazy 'rodjek/vim-puppet', {'autoload': {'filetypes': ['puppet']}}

" }}}

" END BUNDLES }}}

call neobundle#end()

" Auto install the Plugins {{{

" First-time plugins installation
if firstInstallation == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    set nomore
    NeoBundleInstall
endif

" Check if all of the plugins are already installed, in other case ask if we
" want to install them (useful to add plugins in the .vimrc)
NeoBundleCheck

" }}}

filetype plugin indent on      " Indent and plugins by filetype

" END NEOBUNDLE }}}

" VIM Setup {{{ ===============================================================

" <Leader> & <LocalLeader> mapping {{{

let mapleader=','
let maplocalleader= ' '

" }}}

" Basic options {{{

scriptencoding utf-8
set encoding=utf-8              " setup the encoding to UTF-8
set fileformat=unix
set ls=2                        " status line always visible
set go-=T                       " hide the toolbar
set go-=m                       " hide the menu
" The next two lines are quite tricky, but in Gvim, if you don't do this, if you
" only hide all the scrollbars, the vertical scrollbar is showed anyway
set go+=rRlLbh                  " show all the scrollbars
set go-=rRlLbh                  " hide all the scrollbars
set visualbell                  " turn on the visual bell
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly
set backspace=indent,eol,start  " defines the backspace key behavior
set virtualedit=all             " to edit where there is no actual character
set more                        " to show pages using `more` in command outpouts
" Line numbers. Also see 'Toggle line numbers'
set number
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,winpos,slash

" }}}

" Searching {{{

set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

" }}}

" History and permanent undo levels {{{

set history=1000
set undofile
set undoreload=1000

" }}}

" Make a dir if no exists {{{

function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

" }}}

" Backups {{{

set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set viminfo+=n$HOME/.vim/tmp/viminfo

" make this dirs if no exists previously
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" }}}

" Wildmenu {{{

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options

set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats

" }}}

" Tabs, space and wrapping {{{

set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent
set smarttab

" Last tab toggle
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()
nmap <Leader>ta :exe "tabn ".g:lasttab<CR>
imap <F2> <Esc> :exe "tabn ".g:lasttab<CR>
map  <F2> :exe "tabn ".g:lasttab<CR>

" New tab
map  <Leader>tt <Esc>:browse tabnew<CR>

" Go to prev tab
map  <Leader>tp :tabprev <CR>
imap <F3> <Esc> :tabprev <CR>
map  <F3> :tabprev <CR>

" Go to next tab
map  <Leader>tn :tabnext <CR>
imap <F4> <Esc> :tabnext <CR>
map  <F4> :tabnext <CR>

" Move tabs
function MoveTabLeft()
    let current_tab = tabpagenr()
    if current_tab > 1
        let current_tab = current_tab - 2
        execute 'tabmove' current_tab
    endif
endfunction

function MoveTabRight()
    let current_tab = tabpagenr()
    execute 'tabmove' current_tab
endfunction

map <Leader>tl :call MoveTabLeft()<CR>
map <Leader>tr :call MoveTabRight()<CR>

" set formatoptions=qrn1ct
set textwidth=80
set colorcolumn=81

function! ToggleWrap()
    let s:nowrap_cc_bg = [22, '#005f00']
    redir => s:curr_cc_hi
    silent hi ColorColumn
    redir END
    let s:curr_cc_ctermbg = matchstr(s:curr_cc_hi, 'ctermbg=\zs.\{-}\s\ze\1')
    let s:curr_cc_guibg = matchstr(s:curr_cc_hi, 'guibg=\zs.\{-}\_$\ze\1')
    if s:curr_cc_ctermbg != s:nowrap_cc_bg[0]
        let g:curr_cc_ctermbg = s:curr_cc_ctermbg
    endif
    if s:curr_cc_guibg != s:nowrap_cc_bg[1]
        let g:curr_cc_guibg = s:curr_cc_guibg
    endif
    if &textwidth == 80
        set textwidth=0
        exec 'hi ColorColumn ctermbg='.s:nowrap_cc_bg[0].
                    \' guibg='.s:nowrap_cc_bg[1]
    elseif &textwidth == 0
        set textwidth=80
        exec 'hi ColorColumn ctermbg='.g:curr_cc_ctermbg.
                    \' guibg='.g:curr_cc_guibg
    endif
endfunction

nmap <silent><Leader>ew :call ToggleWrap()<CR>

" }}}

" Ok, a vim for men, get off the cursor keys {{{

nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

" And enable C-h,j,k,l as cusrsor in edit mode.
inoremap <C-k>  <up>
inoremap <C-j>  <down>
inoremap <C-l>  <right>
inoremap <C-h>  <left>

" }}}

" Colorscheme {{{

syntax enable                  " enable the syntax highlight
set background=dark            " set a dark background
set t_Co=256                   " 256 colors for the terminal
colorscheme zenburn

" }}}

" Font {{{

set guifont=Dejavu\ Sans\ Mono\ for\ Powerline\ 11

" }}}

" Resize the divisions if the Vim window size changes {{{

au VimResized * exe "normal! \<c-w>="

" }}}

" New windows {{{

nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s

" }}}

" Fast window moves {{{

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" }}}

" Fast window & buffer close and kill {{{

nnoremap <Leader>k <C-w>c
nnoremap <silent><Leader>K :bd<CR>

" }}}

" Toggle line numbers {{{

nnoremap <silent><Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if !&number && !&relativenumber
      set number
      set norelativenumber
  elseif &number && !&relativenumber
      set nonumber
      set relativenumber
  elseif !&number && &relativenumber
      set number
      set relativenumber
  elseif &number && &relativenumber
      set nonumber
      set norelativenumber
  endif
endfunction

" }}}

" Show hidden chars {{{

nmap <Leader>eh :set list!<CR>
set listchars=tab:→\ ,eol:¬,trail:·,extends:>,precedes:<

" }}}

" Folding {{{

set foldenable
set foldmethod=marker

" Toggle folding

nnoremap \ za
vnoremap \ za

" }}}

" Cut/Paste {{{

" to/from the clipboard
map <Leader>y "*y
map <Leader>p "*p

" toggle paste mode
set pastetoggle=<leader>P

" }}}

" Autoload configuration when this file changes ($MYVIMRC) {{{

autocmd! BufWritePost vimrc source %

" }}}

" Spelling {{{

" turn on the spell checking and set the Russian language
nmap <Leader>sr :setlocal spell spelllang=ru<CR>
" turn on the spell checking and set the English language
nmap <Leader>se :setlocal spell spelllang=en<CR>
" turn off the spell checking
nmap <Leader>so :setlocal nospell <CR>
" jump to the next bad spell word
nmap <Leader>sn ]s
" suggest words
" nmap <Leader>sp z=
nmap <Leader>sp :Unite spell_suggest<CR>
" jump to the next bad spell word and suggests a correct one
" nmap <Leader>sc ]sz=
nmap <Leader>sc ]s :Unite spell_suggest<CR>
" add word to the dictionary
nmap <Leader>sa zg

" }}}

" Save as root {{{

cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" }}}

" Quick saving {{{

nmap <silent> <Leader>w :update<CR>

" }}}

" Delete trailing whitespaces {{{

nmap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" }}}

" Toggle the Quickfix window {{{

function! s:QuickfixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            lclose
            return
        endif
    endfor
    copen
endfunction
command! ToggleQuickfix call <SID>QuickfixToggle()

nnoremap <silent> <Leader>q :ToggleQuickfix<CR>

" }}}

" Text statistics {{{

" get the total of lines, words, chars and bytes (and for the current position)
map <Leader>es g<C-G>

" get the word frequency in the text
function! WordFrequency() range
  let all = split(join(getline(a:firstline, a:lastline)), '\A\+')
  let frequencies = {}
  for word in all
    let frequencies[word] = get(frequencies, word, 0) + 1
  endfor
  let lst = []
  for [key,value] in items(frequencies)
    call add(lst, value."\t".key."\n")
  endfor
  call sort(lst)
  echo join(lst)
endfunction
command! -range=% WordFrequency <line1>,<line2>call WordFrequency()
map <Leader>ef :Unite output:WordFrequency<CR>

" }}}

" Count lines of code {{{

" Needs to install "cloc"
function! LinesOfCode()
    echo system('cloc --quiet '.bufname("%"))
endfunction

map <silent><Leader>ec :Unite -default-action= output:call\\ LinesOfCode()<CR>

"}}}

" Toggle the search results highlighting {{{

map <silent><Leader>eq :set invhlsearch<CR>

" }}}

" Quick exiting without save {{{

nnoremap <Leader>`` :qa!<CR>

" }}}

" Execution permissions by default to shebang (#!) files {{{

augroup shebang_chmod
  autocmd!
  autocmd BufNewFile  * let b:brand_new_file = 1
  autocmd BufWritePost * unlet! b:brand_new_file
  autocmd BufWritePre *
        \ if exists('b:brand_new_file') |
        \   if getline(1) =~ '^#!' |
        \     let b:chmod_post = '+x' |
        \   endif |
        \ endif
  autocmd BufWritePost,FileWritePost *
        \ if exists('b:chmod_post') && executable('chmod') |
        \   silent! execute '!chmod '.b:chmod_post.' "<afile>"' |
        \   unlet b:chmod_post |
        \ endif
augroup END

" }}}

" Load matchit by default {{{

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" }}}

" Make the Y behavior similar to D & C {{{

nnoremap Y y$

" }}}

" END VIM SETUP }}}

" PLUGINS Setup {{{ ===========================================================

" Airline {{{

set noshowmode

let g:airline_theme="dark"
let g:airline_powerline_fonts=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#whitespace#enabled=1


" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#buffer_min_count = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" }}}

" CoffeeScript {{{

map <Leader>rw :CoffeeWatch vert<CR>

" }}}

" ColorV {{{

let g:colorv_cache_file=$HOME.'/.vim/tmp/vim_colorv_cache'
let g:colorv_cache_fav=$HOME.'/.vim/tmp/vim_colorv_cache_fav'

" }}}

" tcomment_vim {{{ -------------------------------------------------------------

nmap <Leader>c :TComment<CR>
xmap <Leader>c :TComment<CR>

" }}}

" DBext {{{

let g:dbext_default_type = 'SQLITE'
let g:dbext_default_user = ""
let g:dbext_default_passwd = ""
let g:dbext_default_display_cmd_line = 0
let g:dbext_default_prompt_for_parameters=0
let g:dbext_default_history_file = $HOME.'./vim/tmp/dbext_sql_history.txt'

" Mappings

let g:dbext_default_usermaps = 0
let g:dbext_map_or_cmd = 'cmd'

vnoremap <Leader>Se :DBExecVisualSQL<CR>
vnoremap <Leader>St :DBSelectFromTable<CR>
vnoremap <Leader>Sdt :DBDescribeTable<CR>
vnoremap <Leader>Sdp :DBDescribeProcedure<CR>
vnoremap <Leader>Slt :DBListTable<CR>
vnoremap <Leader>Slp :DBListProcedure<CR>
vnoremap <Leader>Slv :DBListView<CR>
vnoremap <Leader>Slc :DBListColumn<CR>

nnoremap <Leader>Se :DBExecSQLUnderCursor<CR>
nnoremap <Leader>SE :DBExecSQLTopX<CR>
nnoremap <Leader>Sea :1,$DBExecRangeSQL<CR>
nnoremap <Leader>Sel :.,.DBExecRangeSQL<CR>
nnoremap <Leader>Sep :'<,'>DBExecRangeSQL<CR>
nnoremap <Leader>St :DBSelectFromTable<CR>
nnoremap <Leader>ST :DBSelectFromTableTopX<CR>
nnoremap <Leader>Stw :DBSelectFromTableWithWhere<CR>
nnoremap <Leader>Sta :DBSelectFromTableAskName<CR>
nnoremap <Leader>Sd :DBDescribeTable<CR>
nnoremap <Leader>Sda :DBDescribeTableAskName<CR>
nnoremap <Leader>Sdp :DBDescribeProcedure<CR>
nnoremap <Leader>Sdpa :DBDescribeProcedureAskName<CR>
nnoremap <Leader>Slt :DBListTable<CR>
nnoremap <Leader>Slp :DBListProcedure<CR>
nnoremap <Leader>Slv :DBListView<CR>
nnoremap <Leader>Slc :DBListColumn<CR>
nnoremap <Leader>Svr :DBListVar<CR>
nmap <silent> <Leader>Sal :.,.DBVarRangeAssign<CR>
nmap <silent> <Leader>Saa :1,$DBVarRangeAssign<CR>
nmap <silent> <Leader>Sap :'<,'>DBVarRangeAssign<CR>
xmap <silent> <Leader>Sa :DBVarRangeAssign<CR>
nnoremap <Leader>Sh :DBHistory<CR>
nnoremap <Leader>So :DBOrientation<CR>
nnoremap <Leader>Sbp <Plug>DBPromptForBufferParameters<CR>

" SQLite
let g:dbext_default_SQLITE_bin = 'sqlite3'
" let g:dbext_default_SQLITE_cmd_header        = ".mode column\n.headers ON\n"
" let g:dbext_default_SQLITE_cmd_terminator    = ';'
" let g:dbext_default_SQLITE_cmd_terminator    = ';'
" let g:dbext_default_SQLITE_extra             = ''

" }}}

" delimitmate {{{

let delimitMate_expand_space = 1

" }}}

" easydigraph {{{

let g:EasyDigraph_nmap = '<Leader>dd'

" }}}

" Fugitive {{{

nnoremap <Leader>gn :Unite output:echo\ system("git\ init")<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gp :Git! push<CR>
nnoremap <Leader>gP :Git! pull<CR>
nnoremap <Leader>gi :Git!<Space>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gE :Gedit<Space>
nnoremap <Leader>gl :exe "silent Glog <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gL :exe "silent Glog -- <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
nnoremap <Leader>gS :exe "silent !shipit"<CR>:redraw!<CR>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite
            \ quickfix -no-quit<CR>
nnoremap <Leader>ggm :exe 'silent Glog --grep='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>
nnoremap <Leader>ggt :exe 'silent Glog -S='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>

nnoremap <Leader>ggc :silent! Ggrep -i<Space>

" for the diffmode
noremap <Leader>du :diffupdate<CR>

if !exists(":Gdiffoff")
    command Gdiffoff diffoff | q | Gedit
endif
noremap <Leader>dq :Gdiffoff<CR>

" }}}

" Gitv {{{

nnoremap <silent> <leader>gv :Gitv --all<CR>
nnoremap <silent> <leader>gV :Gitv! --all<CR>
vnoremap <silent> <leader>gV :Gitv! --all<CR>

let g:Gitv_OpenHorizontal = 'auto'
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1
" let g:Gitv_WrapLines = 1

autocmd FileType git set nofoldenable

" }}}

" Gundo {{{

nnoremap <Leader>u :GundoToggle<CR>

let g:gundo_preview_bottom = 1

" }}}

" indentLine {{{

function! IndentLinesAndLeadingSpaceToggle()
    :IndentLinesToggle
    :LeadingSpaceToggle
endfunction

let g:indentLine_enabled = 0
let g:indentLine_char = '¦'
let g:indentLine_color_term = 245
let g:indentLine_leadingSpaceChar='˰'
let g:indentLine_leadingSpaceEnabled=0

map <silent> <Leader>L :call IndentLinesAndLeadingSpaceToggle()<CR>

" }}}

" Neocomplete {{{

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#max_list = 30
let g:neocomplete#min_keyword_length = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#data_directory = $HOME.'/.vim/tmp/neocomplete'

" disable the auto select feature by default to speed up writing without
" obstacles (is optimal for certain situations)
let g:neocomplete#enable_auto_select = 0

" toggle the auto select feature
function! ToggleNeoComplete()
  if !g:neocomplete#disable_auto_complete && g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 0
  elseif !g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 1
      let g:neocomplete#enable_auto_select = 0
  elseif g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 1
  endif
endfunction
nnoremap <silent><Leader>ea :call ToggleNeoComplete()<CR>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType go setlocal omnifunc=gocomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.python='[^. \t]\.\w*'

" }}}

" Neobundle {{{

let g:neobundle#log_filename = $HOME.'/.vim/tmp/neobundle.log'

" }}}

" neomru {{{

let g:neomru#file_mru_path = $HOME.'/.vim/tmp/neomru/file'
let g:neomru#directory_mru_path = $HOME.'/.vim/tmp/neomru/directory'

" }}}

" Po.vim {{{ -----------------------------------------------------------------

let g:po_translator = "user name <email@host.com>"

" }}}

" PythonMode {{{ -------------------------------------------------------------

nmap <silent><Leader>n :PymodeLint<CR>

let g:pymode_breakpoint_bind = '<Leader>B'

let g:pymode_lint = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pep257']
let g:pymode_lint_ignore = ''
let g:pymode_virtualenv = 0
let g:pymode_rope = 1

let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 1

" }}}

" Syntastic {{{

nmap <silent><Leader>N :SyntasticCheck<CR>:Errors<CR>

let g:syntastic_python_pylint_exe = "pylint2"
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['python'] }

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='w'
let g:syntastic_style_error_symbol  = 'S✗'
let g:syntastic_style_warning_symbol  = 'Sw'

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_stl_format="%t:%e/%w"

" }}}

" Unite {{{

" files
nnoremap <silent><Leader>o :Unite -silent -start-insert file<CR>
nnoremap <silent><Leader>O :Unite -start-insert file_rec/async<CR>
nnoremap <silent><Leader>m :Unite -silent file_mru<CR>
" buffers
nnoremap <silent><Leader>b :Unite -silent buffer<CR>
" tabs
nnoremap <silent><Leader>B :Unite -silent tab<CR>
" buffer search
nnoremap <silent><Leader>f :Unite -silent -no-split -start-insert -auto-preview
            \ line<CR>
nnoremap <silent>[menu]8 :UniteWithCursorWord -silent -no-split -auto-preview
            \ line<CR>
" yankring
nnoremap <silent><Leader>i :Unite -silent history/yank<CR>
" grep
nnoremap <silent><Leader>a :Unite -silent -no-quit grep<CR>
" help
nnoremap <silent> g<C-h> :UniteWithCursorWord -silent help<CR>
" tasks
nnoremap <silent><Leader>; :Unite -silent -toggle
            \ grep:%::FIXME\|TODO\|NOTE\|XXX\|COMBAK\|@todo<CR>
" outlines (also ctags)
nnoremap <silent><Leader>t :Unite -silent -vertical -winwidth=40
            \ -direction=topleft -toggle outline<CR>
" junk files
nnoremap <silent><Leader>d :Unite -silent junkfile/new junkfile<CR>

" menus {{{
let g:unite_source_menu_menus = {}

" menu prefix key (for all Unite menus) {{{
nnoremap [menu] <Nop>
nmap <LocalLeader> [menu]
" }}}

" menus menu
nnoremap <silent>[menu]u :Unite -silent -winheight=20 menu<CR>

" files and dirs menu {{{
let g:unite_source_menu_menus.files = {
    \ 'description' : '          files & dirs
        \                                          [space]o',
    \}
let g:unite_source_menu_menus.files.command_candidates = [
    \['• open file                                                  ,o',
        \'Unite -start-insert file'],
    \['• open more recently used files                              ,m',
        \'Unite file_mru'],
    \['• open file with recursive search                            ,O',
        \'Unite -start-insert file_rec/async'],
    \['• edit new file',
        \'Unite file/new'],
    \['• search directory',
        \'Unite directory'],
    \['• search recently used directories',
        \'Unite directory_mru'],
    \['• search directory with recursive search',
        \'Unite directory_rec/async'],
    \['• make new directory',
        \'Unite directory/new'],
    \['• change working directory',
        \'Unite -default-action=lcd directory'],
    \['• know current working directory',
        \'Unite output:pwd'],
    \['• junk files                                                 ,d',
        \'Unite junkfile/new junkfile'],
    \['• save as root                                               :w!!',
        \'exe "write !sudo tee % >/dev/null"'],
    \['• quick save                                                 ,w',
        \'normal ,w'],
    \['• open vimfiler                                              ,x',
        \'VimFiler'],
    \]
nnoremap <silent>[menu]o :Unite -silent -winheight=17 -start-insert
            \ menu:files<CR>
" }}}

" file searching menu {{{
let g:unite_source_menu_menus.grep = {
    \ 'description' : '           search files
        \                                          [space]a',
    \}
let g:unite_source_menu_menus.grep.command_candidates = [
    \['• grep (ag → ack → grep)                                     ,a',
        \'Unite -no-quit grep'],
    \['• find',
        \'Unite find'],
    \['• locate',
        \'Unite -start-insert locate'],
    \['• vimgrep (very slow)',
        \'Unite vimgrep'],
    \]
nnoremap <silent>[menu]a :Unite -silent menu:grep<CR>
" }}}

" buffers, tabs & windows menu {{{
let g:unite_source_menu_menus.navigation = {
    \ 'description' : '     navigate by buffers, tabs & windows
        \                   [space]b',
    \}
let g:unite_source_menu_menus.navigation.command_candidates = [
    \['• buffers                                                    ,b',
        \'Unite buffer'],
    \['• tabs                                                       ,B',
        \'Unite tab'],
    \['• windows',
        \'Unite window'],
    \['• location list',
        \'Unite location_list'],
    \['• quickfix',
        \'Unite quickfix'],
    \['• resize windows                                             C-C C-W',
        \'WinResizerStartResize'],
    \['• new vertical window                                        ,v',
        \'vsplit'],
    \['• new horizontal window                                      ,h',
        \'split'],
    \['• close current window                                       ,k',
        \'close'],
    \['• toggle quickfix window                                     ,q',
        \'normal ,q'],
    \['• zoom                                                       ,z',
        \'ZoomWinTabToggle'],
    \['• delete buffer                                              ,K',
        \'bd'],
    \]
nnoremap <silent>[menu]b :Unite -silent menu:navigation<CR>
" }}}

" buffer internal searching menu {{{
let g:unite_source_menu_menus.searching = {
    \ 'description' : '      searchs inside the current buffer
        \                     [space]f',
    \}
let g:unite_source_menu_menus.searching.command_candidates = [
    \['• search line                                                ,f',
        \'Unite -auto-preview -start-insert line'],
    \['• search word under the cursor                               [space]8',
        \'UniteWithCursorWord -no-split -auto-preview line'],
    \['• search outlines & tags (ctags)                             ,t',
        \'Unite -vertical -winwidth=40 -direction=topleft -toggle outline'],
    \['• search marks',
        \'Unite -auto-preview mark'],
    \['• search folds',
        \'Unite -vertical -winwidth=30 -auto-highlight fold'],
    \['• search changes',
        \'Unite change'],
    \['• search jumps',
        \'Unite jump'],
    \['• search undos',
        \'Unite undo'],
    \['• search tasks                                               ,;',
        \'Unite -toggle grep:%::FIXME|TODO|NOTE|XXX|COMBAK|@todo'],
    \]
nnoremap <silent>[menu]f :Unite -silent menu:searching<CR>
" }}}

" yanks, registers & history menu {{{
let g:unite_source_menu_menus.registers = {
    \ 'description' : '      yanks, registers & history
        \                            [space]i',
    \}
let g:unite_source_menu_menus.registers.command_candidates = [
    \['• yanks                                                      ,i',
        \'Unite history/yank'],
    \['• commands       (history)                                   q:',
        \'Unite history/command'],
    \['• searches       (history)                                   q/',
        \'Unite history/search'],
    \['• registers',
        \'Unite register'],
    \['• messages',
        \'Unite output:messages'],
    \['• undo tree      (gundo)                                     ,u',
        \'GundoToggle'],
    \]
nnoremap <silent>[menu]i :Unite -silent menu:registers<CR>
" }}}

" spelling menu {{{
let g:unite_source_menu_menus.spelling = {
    \ 'description' : '       spell checking
        \                                        [space]s',
    \}
let g:unite_source_menu_menus.spelling.command_candidates = [
    \['• spell checking in Russian                                  ,ss',
        \'setlocal spell spelllang=ru'],
    \['• spell checking in English                                  ,se',
        \'setlocal spell spelllang=en'],
    \['• turn off spell checking                                    ,so',
        \'setlocal nospell'],
    \['• jumps to next bad spell word and show suggestions          ,sc',
        \'normal ,sc'],
    \['• jumps to next bad spell word                               ,sn',
        \'normal ,sn'],
    \['• suggestions                                                ,sp',
        \'normal ,sp'],
    \['• add word to dictionary                                     ,sa',
        \'normal ,sa'],
    \]
nnoremap <silent>[menu]s :Unite -silent menu:spelling<CR>
" }}}

" text edition menu {{{
let g:unite_source_menu_menus.text = {
    \ 'description' : '           text edition
        \                                          [space]e',
    \}
let g:unite_source_menu_menus.text.command_candidates = [
    \['• toggle search results highlight                            ,eq',
        \'set invhlsearch'],
    \['• toggle line numbers                                        ,l',
        \'call ToggleRelativeAbsoluteNumber()'],
    \['• toggle wrapping                                            ,ew',
        \'call ToggleWrap()'],
    \['• toggle auto-completion state (manual → disabled → auto)    ,ea',
        \'call ToggleNeoCompleteAutoSelect()'],
    \['• show hidden chars                                          ,eh',
        \'set list!'],
    \['• toggle fold                                                /',
        \'normal za'],
    \['• open all folds                                             zR',
        \'normal zR'],
    \['• close all folds                                            zM',
        \'normal zM'],
    \['• copy to the clipboard                                      ,y',
        \'normal ,y'],
    \['• paste from the clipboard                                   ,p',
        \'normal ,p'],
    \['• toggle paste mode                                          ,P',
        \'normal ,P'],
    \['• remove trailing whitespaces                                ,et',
        \'normal ,et'],
    \['• text statistics                                            ,es',
        \'Unite output:normal\ ,es -no-cursor-line'],
    \['• show word frequency                                        ,ef',
        \'Unite output:WordFrequency'],
    \['• show available digraphs',
        \'digraphs'],
    \['• insert lorem ipsum text',
        \'exe "Loremipsum" input("numero de palabras: ")'],
    \['• show current char info                                     ga',
        \'normal ga'],
    \]
nnoremap <silent>[menu]e :Unite -silent -winheight=20 menu:text <CR>
" }}}

" neobundle menu {{{
let g:unite_source_menu_menus.neobundle = {
    \ 'description' : '      plugins administration with neobundle
        \                 [space]n',
    \}
let g:unite_source_menu_menus.neobundle.command_candidates = [
    \['• neobundle',
        \'Unite neobundle'],
    \['• neobundle log',
        \'Unite neobundle/log'],
    \['• neobundle lazy',
        \'Unite neobundle/lazy'],
    \['• neobundle update',
        \'Unite neobundle/update'],
    \['• neobundle search',
        \'Unite neobundle/search'],
    \['• neobundle install',
        \'Unite neobundle/install'],
    \['• neobundle check',
        \'Unite -no-empty output:NeoBundleCheck'],
    \['• neobundle docs',
        \'Unite output:NeoBundleDocs'],
    \['• neobundle clean',
        \'NeoBundleClean'],
    \['• neobundle rollback',
        \'exe "NeoBundleRollback" input("plugin: ")'],
    \['• neobundle list',
        \'Unite output:NeoBundleList'],
    \['• neobundle direct edit',
        \'NeoBundleExtraEdit'],
    \]
nnoremap <silent>[menu]n :Unite -silent -start-insert menu:neobundle<CR>
" }}}

" git menu {{{
let g:unite_source_menu_menus.git = {
    \ 'description' : '            admin git repositories
        \                                [space]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['• tig                                                        ,gt',
        \'normal ,gt'],
    \['• git viewer             (gitv)                              ,gv',
        \'normal ,gv'],
    \['• git viewer - buffer    (gitv)                              ,gV',
        \'normal ,gV'],
    \['• git status             (fugitive)                          ,gs',
        \'Gstatus'],
    \['• git diff               (fugitive)                          ,gd',
        \'Gdiff'],
    \['• git commit             (fugitive)                          ,gc',
        \'Gcommit'],
    \['• git log                (fugitive)                          ,gl',
        \'exe "silent Glog | Unite -no-quit quickfix"'],
    \['• git log - all          (fugitive)                          ,gL',
        \'exe "silent Glog -all | Unite -no-quit quickfix"'],
    \['• git blame              (fugitive)                          ,gb',
        \'Gblame'],
    \['• git add/stage          (fugitive)                          ,gw',
        \'Gwrite'],
    \['• git checkout           (fugitive)                          ,go',
        \'Gread'],
    \['• git rm                 (fugitive)                          ,gR',
        \'Gremove'],
    \['• git mv                 (fugitive)                          ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['• git push               (fugitive, buffer output)           ,gp',
        \'Git! push'],
    \['• git pull               (fugitive, buffer output)           ,gP',
        \'Git! pull'],
    \['• git command            (fugitive, buffer output)           ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['• git edit               (fugitive)                          ,gE',
        \'exe "command Gedit " input(":Gedit ")'],
    \['• git grep               (fugitive)                          ,gg',
        \'exe "silent Ggrep -i ".input("Pattern: ") | Unite -no-quit quickfix'],
    \['• git grep - messages    (fugitive)                          ,ggm',
        \'exe "silent Glog --grep=".input("Pattern: ")." | Unite -no-quit quickfix"'],
    \['• git grep - text        (fugitive)                          ,ggt',
        \'exe "silent Glog -S".input("Pattern: ")." | Unite -no-quit quickfix"'],
    \['• git init                                                   ,gn',
        \'Unite output:echo\ system("git\ init")'],
    \['• git cd                 (fugitive)',
        \'Gcd'],
    \['• git lcd                (fugitive)',
        \'Glcd'],
    \['• git browse             (fugitive)                          ,gB',
        \'Gbrowse'],
    \['• github dashboard       (github-dashboard)                  ,gD',
        \'exe "GHD! " input("Username: ")'],
    \['• github activity        (github-dashboard)                  ,gA',
        \'exe "GHA! " input("Username or repository: ")'],
    \['• github issues & PR                                         ,gS',
        \'normal ,gS'],
    \]
nnoremap <silent>[menu]g :Unite -silent -winheight=29 -start-insert menu:git<CR>
" }}}

" code menu {{{
let g:unite_source_menu_menus.code = {
    \ 'description' : '           code tools
        \                                            [space]p',
    \}
let g:unite_source_menu_menus.code.command_candidates = [
    \['• run python code                            (pymode)        ,r',
        \'PymodeRun'],
    \['• show docs for the current word             (pymode)        K',
        \'normal K'],
    \['• insert a breakpoint                        (pymode)        ,B',
        \'normal ,B'],
    \['• pylint check                               (pymode)        ,n',
        \'PymodeLint'],
    \['• sort imports                               (isort)',
        \'Isort'],
    \['• go to definition                           (pymode-rope)   C-C g',
        \'call pymode#rope#goto_definition()'],
    \['• find where a function is used              (pymode-rope)   C-C f',
        \'call pymode#rope#find_it()'],
    \['• show docs for current word                 (pymode-rope)   C-C d',
        \'call pymode#rope#show_doc()'],
    \['• reorganize imports                         (pymode-rope)   C-C r o',
        \'call pymode#rope#organize_imports()'],
    \['• refactorize - rename                       (pymode-rope)   C-C r r',
        \'call pymode#rope#rename()'],
    \['• refactorize - inline                       (pymode-rope)   C-C r i',
        \'call pymode#rope#inline()'],
    \['• refactorize - move                         (pymode-rope)   C-C r v',
        \'call pymode#rope#move()'],
    \['• refactorize - use function                 (pymode-rope)   C-C r u',
        \'call pymode#rope#use_function()'],
    \['• refactorize - change signature             (pymode-rope)   C-C r s',
        \'call pymode#rope#signature()'],
    \['• refactorize - rename current module        (pymode-rope)   C-C r 1 r',
        \'PymodeRopeRenameModule'],
    \['• refactorize - module to package            (pymode-rope)   C-C r 1 p',
        \'PymodeRopeModuleToPackage'],
    \['• syntastic toggle                           (syntastic)',
        \'SyntasticToggleMode'],
    \['• syntastic check & errors                   (syntastic)     ,N',
        \'normal ,N'],
    \['• list virtualenvs                           (virtualenv)',
        \'Unite output:VirtualEnvList'],
    \['• activate virtualenv                        (virtualenv)',
        \'VirtualEnvActivate'],
    \['• deactivate virtualenv                      (virtualenv)',
        \'VirtualEnvDeactivate'],
    \['• run coverage2                              (coveragepy)',
        \'call system("coverage2 run ".bufname("%")) | Coveragepy report'],
    \['• run coverage3                              (coveragepy)',
        \'call system("coverage3 run ".bufname("%")) | Coveragepy report'],
    \['• toggle coverage report                     (coveragepy)',
        \'Coveragepy session'],
    \['• toggle coverage marks                      (coveragepy)',
        \'Coveragepy show'],
    \['• coffeewatch                                (coffeescript)  ,rw',
        \'CoffeeWatch vert'],
    \['• count lines of code',
        \'Unite -default-action= output:call\\ LinesOfCode()'],
    \['• toggle indent lines                                        ,L',
        \'IndentLinesToggle'],
    \]
nnoremap <silent>[menu]p :Unite -silent -winheight=42 menu:code<CR>
" }}}

" reST menu {{{
let g:unite_source_menu_menus.rest = {
    \ 'description' : '           reStructuredText
    \                                      [space]r',
    \}
let g:unite_source_menu_menus.rest.command_candidates = [
    \['• CheatSheet',
        \'RivCheatSheet'],
    \['• reStructuredText Specification',
        \'RivSpecification'],
    \]
nnoremap <silent>[menu]r :Unite -silent menu:rest<CR>
" }}}

" bookmarks menu {{{
let g:unite_source_menu_menus.bookmarks = {
    \ 'description' : '      bookmarks
        \                                             [space]m',
    \}
let g:unite_source_menu_menus.bookmarks.command_candidates = [
    \['• open bookmarks',
        \'Unite bookmark:*'],
    \['• add bookmark',
        \'UniteBookmarkAdd'],
    \]
nnoremap <silent>[menu]m :Unite -silent menu:bookmarks<CR>
" }}}

" colorv menu {{{
function! GetColorFormat()
    let formats = {'r' : 'RGB',
                  \'n' : 'NAME',
                  \'s' : 'HEX',
                  \'ar': 'RGBA',
                  \'pr': 'RGBP',
                  \'pa': 'RGBAP',
                  \'m' : 'CMYK',
                  \'l' : 'HSL',
                  \'la' : 'HSLA',
                  \'h' : 'HSV',
                  \}
    let formats_menu = ["\n"]
    for [k, v] in items(formats)
        call add(formats_menu, "  ".k."\t".v."\n")
    endfor
    let fsel = get(formats, input('Choose a format: '.join(formats_menu).'? '))
    return fsel
endfunction

function! GetColorMethod()
    let methods = {
                   \'h' : 'Hue',
                   \'s' : 'Saturation',
                   \'v' : 'Value',
                   \'m' : 'Monochromatic',
                   \'a' : 'Analogous',
                   \'3' : 'Triadic',
                   \'4' : 'Tetradic',
                   \'n' : 'Neutral',
                   \'c' : 'Clash',
                   \'q' : 'Square',
                   \'5' : 'Five-Tone',
                   \'6' : 'Six-Tone',
                   \'2' : 'Complementary',
                   \'p' : 'Split-Complementary',
                   \'l' : 'Luma',
                   \'g' : 'Turn-To',
                   \}
    let methods_menu = ["\n"]
    for [k, v] in items(methods)
        call add(methods_menu, "  ".k."\t".v."\n")
    endfor
    let msel = get(methods, input('Choose a method: '.join(methods_menu).'? '))
    return msel
endfunction

let g:unite_source_menu_menus.colorv = {
    \ 'description' : '         color management
        \                                      [space]c',
    \}
let g:unite_source_menu_menus.colorv.command_candidates = [
    \['• open colorv                                                ,cv',
        \'ColorV'],
    \['• open colorv with the color under the cursor                ,cw',
        \'ColorVView'],
    \['• preview colors                                             ,cpp',
        \'ColorVPreview'],
    \['• color picker                                               ,cd',
        \'ColorVPicker'],
    \['• edit the color under the cursor                            ,ce',
        \'ColorVEdit'],
    \['• edit the color under the cursor (and all the concurrences) ,cE',
        \'ColorVEditAll'],
    \[' insert a color                                             ,cii',
        \'exe "ColorVInsert " .GetColorFormat()'],
    \['• color list relative to the current                         ,cgh',
        \'exe "ColorVList " .GetColorMethod() "
        \ ".input("number of colors? (optional): ")
        \ " ".input("number of steps?  (optional): ")'],
    \['• show colors list (Web W3C colors)                          ,cn',
        \'ColorVName'],
    \['• choose color scheme (ColourLovers, Kuler)                  ,css',
        \'ColorVScheme'],
    \['• show favorite color schemes                                ,csf',
        \'ColorVSchemeFav'],
    \['• new color scheme                                           ,csn',
        \'ColorVSchemeNew'],
    \['• create hue gradation between two colors',
        \'exe "ColorVTurn2 " " ".input("Color 1 (hex): ")
        \" ".input("Color 2 (hex): ")'],
    \]
nnoremap <silent>[menu]c :Unite -silent menu:colorv<CR>
" }}}

" vim menu {{{
let g:unite_source_menu_menus.vim = {
    \ 'description' : '            vim
        \                                                   [space]v',
    \}
let g:unite_source_menu_menus.vim.command_candidates = [
    \['• choose colorscheme',
        \'Unite colorscheme -auto-preview'],
    \['• mappings',
        \'Unite mapping -start-insert'],
    \['• edit configuration file (vimrc)',
        \'edit $MYVIMRC'],
    \['• choose filetype',
        \'Unite -start-insert filetype'],
    \['• vim help',
        \'Unite -start-insert help'],
    \['• vim commands',
        \'Unite -start-insert command'],
    \['• vim functions',
        \'Unite -start-insert function'],
    \['• vim runtimepath',
        \'Unite -start-insert runtimepath'],
    \['• vim command output',
        \'Unite output'],
    \['• unite sources',
        \'Unite source'],
    \['• kill process',
        \'Unite -default-action=sigkill -start-insert process'],
    \['• launch executable (dmenu like)',
        \'Unite -start-insert launcher'],
    \]
nnoremap <silent>[menu]v :Unite menu:vim -silent -start-insert<CR>
" }}}

" db menu {{{
let g:unite_source_menu_menus.db = {
    \ 'description' : '             database (SQL)
        \                                        [space]S',
    \}
let g:unite_source_menu_menus.db.command_candidates = [
    \['• Execute SQL',
        \'exe "DBExecSQL" " ".input("SQL?: ")'],
    \['• Execute SQL (with limit of n rows)',
        \'exe "DBExecSQL" " ".input("SQL?: ")'],
    \['• SQL SELECT statement',
        \'exe "Select" " ".input("SELECT ")'],
    \['• SQL UPDATE statement',
        \'exe "Update" " ".input("UPDATE")'],
    \['• SQL INSERT statement',
        \'exe "Insert" " ".input("INSERT")'],
    \['• SQL DELETE statement',
        \'exe "Delete" " ".input("DELETE")'],
    \['• SQL CALL statement',
        \'exe "Call" " ".input("CALL")'],
    \['• SQL DROP statement',
        \'exe "Drop" " ".input("DROP")'],
    \['• SQL ALTER statement',
        \'exe "Alter" " ".input("ALTER")'],
    \['• SQL CREATE statement',
        \'exe "Create" " ".input("CREATE")'],
    \['• List all Tables                                            ,Slt',
        \'DBListTable'],
    \['• List all Procedures                                        ,Slp',
        \'DBListProcedure'],
    \['• List all Views                                             ,Slv',
        \'DBListView'],
    \['• List all Variables                                         ,Svr',
        \'DBListVar'],
    \['• DBext Get Options',
        \'DBGetOption'],
    \['• DBext Set Option',
        \'exe "DBSetOption" " ".input("Option: ")'],
    \['• DBext Set Var',
        \'exe "DBSetVar" " ".input("Var: ")'],
    \['• DBext Set Buffer Parameters',
        \'DBPromptForBufferParameters'],
    \['• List all Connections       (only DBI/ODBC)',
        \'DBListConnections'],
    \['• Commit                     (only DBI/ODBC)',
        \'DBCommit'],
    \['• Rollback                   (only DBI/ODBC)',
        \'DBRollback'],
    \['• Connect                    (only DBI/ODBC)',
        \'DBConnect'],
    \['• Disconnect                 (only DBI/ODBC)',
        \'DBDisconnect'],
    \]

nnoremap <silent>[menu]S :Unite menu:db -silent -winheight=25 -start-insert<CR>

" }}}

" }}}

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
            \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))
call unite#custom#source('file_rec/async', 'ignore_globs',
    \ ['*.jpg', '*.gif', '*.png', '*.pdf', '*.ico', '*.ttf'
    \   , '.idea/**', 'data/**', 'logs/**', 'vendor*/**'])

let g:default_context = {
    \ 'winheight' : 15,
    \ 'update_time' : 200,
    \ 'prompt' : '>>> ',
    \ 'enable_start_insert' : 0,
    \ 'enable_short_source_names' : 0,
    \ 'marked_icon' : '✓',
    \ 'ignorecase' : 1,
    \ 'smartcase' : 1,
\ }

call unite#custom#profile('default', 'context', default_context)

let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_split_rule = 'botright'
let g:unite_data_directory = $HOME.'/.vim/tmp/unite'
let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -a -S'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-group --no-color'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
endif

let g:junkfile#directory=expand($HOME."/.vim/tmp/junk")

" }}}

" VimFiler {{{

nnoremap <silent><Leader>x :VimFiler<CR>

let g:vimfiler_as_default_explorer = 1

let g:vimfiler_tree_leaf_icon = '├'
let g:vimfiler_tree_opened_icon = '┐'
let g:vimfiler_tree_closed_icon = '─'
let g:vimfiler_file_icon = '…'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'

let g:vimfiler_force_overwrite_statusline = 0

let g:vimfiler_time_format = '%d-%m-%Y %H:%M:%S'
let g:vimfiler_data_directory = $HOME.'/.vim/tmp/vimfiler'

" }}}

" Vinarise {{{

map <F9> :Vinarise<CR>

let g:vinarise_enable_auto_detect = 1

au FileType vinarise let g:airline_section_warning = ''

" }}}

" Virtualenv {{{

let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '(%n)'

" }}}

" winresizer {{{

let g:winresizer_start_key = '<C-C><C-W>'
" cancelar pulsando ESC
let g:winresizer_finish_with_escape = 1

" }}}

" zoomwintab {{{

map <Leader>z :ZoomWinTabToggle<CR>

" }}}

" startify {{{

let g:rooter_patterns = ['.git', '.git/']
let g:startify_bookmarks = ['/etc/vim/vimrc.local', '~/.vimrc', '/etc/nginx/nginx.conf', '/etc/fstab', '/etc/portage/make.conf/custom']
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_enable_special = 1
let g:startify_files_number = 5
let g:startify_session_autoload = 1
let g:startify_session_dir = '~/.vim/tmp/sessions'
let g:startify_session_persistence = 1
let g:startify_list_order = [
    \ ['   These are my sessions:'],
    \ 'sessions',
    \ ['   My last recently opened files:'],
    \ 'files',
    \ ['   My last recently modified files in the current directory:'],
    \ 'dir',
    \ ['   These are my bookmarks:'],
    \ 'bookmarks',
    \ ]

silent! call MakeDirIfNoExists(startify_session_dir)

" }}}

" Lokaltog/vim-easymotion {{{

" map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-sn)
nmap t <Plug>(easymotion-t2)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

" JK motions: Line motions
map <Leader><C-j> <Plug>(easymotion-j)
map <Leader><C-k> <Plug>(easymotion-k)

"}}}

" majutsushi/tagbar  {{{

let g:tagbar_autofocus=1
let g:tagbar_iconchars= ['+', '-']
nnoremap <silent> <C-t> :TagbarToggle<CR>

" }}}

" SirVer/ultisnips {{{

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" }}}

" PHP {{{

" php.vim {{{

let g:php_folding            = 1
let g:php_sql_query          = 1
let g:php_html_in_strings    = 1
let g:php_parent_error_close = 1
let g:php_parent_error_open  = 1
let g:php_no_shorttags       = 1

" }}}

" pdv-standalone {{{

" PHP documenter script bound to Control-P
autocmd FileType php inoremap <C-p> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-p> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-p> :call PhpDocRange()<CR>

let g:pdv_cfg_Author    = 'Your Name <your.name@example.com>'
let g:pdv_cfg_Copyright = 'Copyright 2015 by Your Name <your.name@example.com>'
let g:pdv_cfg_License   = 'Provided under the GPL (http://www.gnu.org/copyleft/gpl.html)'
" }}}

" }}}

" GO {{{

let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_fmt_fail_silently = 1

au FileType go nmap <leader>gi :GoImport <c-r>=expand("<cword>")<CR><Esc>
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
" au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

" t-yuki/vim-go-coverlay
au FileType go nmap <leader>c <Plug>(go-coverlay)
au FileType go nmap <leader>C <Plug>(go-clearlay)

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" }}}

" END PLUGINS SETUP }}}

" FILETYPES  {{{ ==============================================================

" DJANGO HTML (Templates) {{{

au BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html

" }}}

" JSON {{{ -------------------------------------------------------------------

augroup json_autocmd
  autocmd FileType json set foldmethod=syntax
augroup END

" }}}

" LUA {{{

au BufRead,BufNewFile rc.lua setlocal foldmethod=marker

" }}}

" PYTHON {{{

au FileType python setlocal foldlevel=1000

" }}}

" MARKDOWN {{{

" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
autocmd FileType markdown NeoBundleSource vim-markdown
autocmd FileType markdown NeoBundleSource vim-markdown-extra-preview

" }}}

" RUBY {{{

au FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

" }}}

" SQL {{{

autocmd FileType sql DBCheckModeline

" }}}

" GO {{{

au BufRead,BufNewFile *.go set filetype=go
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
augroup go_autocmd
    autocmd FileType go set foldmethod=syntax
augroup END

" }}}

" PHP {{{

autocmd BufRead,BufNewFile /etc/php*/*.conf set syntax=dosini
autocmd BufRead,BufNewFile /etc/php*/*.ini set syntax=dosini

" }}}

" nginx {{{

au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*
    \ if &ft == '' | setfiletype nginx | endif

" }}}

" puppet {{{

au BufRead,BufNewFile /etc/puppet/*.pp
    \ if &ft == '' | setfiletype puppet | endif
au BufRead,BufNewFile /etc/puppet/*.conf
    \ if &ft == '' | setfiletype dosini | endif

" }}}

" END FILETYPES }}}

" Other Customizations {{{ ====================================================

" Show alert message if file was changed {{{

autocmd CursorHold * call Timer()
function! Timer()
    call feedkeys("f\e", 'n')
    checktime
endfunction
set updatetime=2000  " milliseconds

autocmd FileChangedShell * echo "File changed in another editor. Please, reload file."

" }}}

" }}}

" vim:foldmethod=marker
