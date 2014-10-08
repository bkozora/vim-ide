"
" MAIN CUSTOMIZATION FILE
"

" Removed Vundle "
"
"  set nocompatible              " be iMproved, required
"  filetype off                  " required

" set the runtime path to include Vundle and initialize
"   set rtp+=~/.vim/bundle/Vundle.vim
"   call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
"   Plugin 'gmarik/Vundle.vim'
"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" All of your Plugins must be added before the following line
"   call vundle#end()            " required
"   filetype plugin indent on    " required

" Purge previous auto commands (in case vimrc is run twice)
autocmd!

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = ['ack', 'simpledb', 'vim-pastie', 'vim-signature', 'Vundle.vim', 'webapi-vim']

" Generate our help files for all bundles
call pathogen#helptags()

" Gundo requires at least vim 7.3
if v:version < '703' || !has('python')
    call add(g:pathogen_disabled, 'gundo')
endif

if v:version < '702'
    call add(g:pathogen_disabled, 'fuzzyfinder')
endif

" Load pathogen
execute pathogen#infect()

" Enable loading filetype and indentation plugins
filetype plugin indent on

" Turn syntax highlighting on
syntax on

" default color scheme (based on wombat)
if has("gui_macvim")
    set guifont=Menlo:h14
    set background=light
    colorscheme solarized
else
    set background=dark
    colorscheme wombat
endif

" vim-airline status bar customizations
" let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0

" Always show status line
set laststatus=2
" Show Git Branch info
let g:airline#extensions#hunks#enabled=1

" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Set our theme
" let g:airline_theme = 'airlineish'

"let g:airline_section_b       (branch)
"let g:airline_section_c       (bufferline or filename)
"let g:airline_section_gutter  (readonly, csv)
"let g:airline_section_x       (tagbar, filetype, virtualenv)
let g:airline_section_y = ''
"let g:airline_section_z       (percentage, line number, column number)
"let g:airline_section_warning (syntastic, whitespace)

" here is an example of how you could replace the branch indicator with
" the current working directory, followed by the filename.
"let g:airline_section_b = '%{getcwd()}'
"let g:airline_section_c = '%t'


" make sure that cyrillic input is supported
"set keymap=russian-jcukenwin
"set iminsert=0
"set imsearch=0
"highlight lCursor guifg=NONE guibg=#cae682

" make sure that ZF standards for maximum line height are honoured
set colorcolumn=80,120

" Switch between the last two files
nnoremap <leader><leader> <C-^>

" enable new 7.3 persistent undo feature

set undofile
set undodir=~/.vim/undo
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Map undotree
nnoremap <Leader>t :UndotreeToggle<cr>

" Map gundo tree view of undos

" Layout, undotree right, diff bottom
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 4
endif


" undotree window width
if !exists('g:undotree_SplitWidth')
    let g:undotree_SplitWidth = 40
endif

" diff window height
if !exists('g:undotree_DiffpanelHeight')
    let g:undotree_DiffpanelHeight = 10
endif

" Highlight changed text
if !exists('g:undotree_HighlightChangedText')
    let g:undotree_HighlightChangedText = 0
endif

" Map gundo tree view of undos
" nnoremap <Leader>u :GundoToggle<CR>

" Disable gundo preview screen (it's sllllooooowwwwww)...
" let g:gundo_tree_statusline

" enable 256 colors in screen
set t_Co=256

" make sure that mouse is enabled

set mouse=a

"nnoremap <F1> :call ToggleMouse()
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
        set nonumber
        echo "Mouse usage disabled"
    else
        set mouse=a
        set number
        echo "Mouse usage enabled"
    endif
endfunction

" GLOBAL SETTINGS
"

" Make sure that unrecognized files are still indented
set autoindent

" Write contents of the file, if it has been modified, on buffer exit
" set autowrite

" Allow buffer to go into background - w/o losing the undo history and
" w/o prior saving
set hidden

" Allow backspacing over everything
set backspace=indent,eol,start

" Highlight current line - allows you to track cursor position more easily
set cursorline

" Insert mode completion options
set completeopt=menuone

" Allow smarter completion by infering the case
set infercase

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Enable incremental search
set incsearch

" Highlight results of a search
set hlsearch

" Ignore case when searching
set ignorecase

" Ignore case only if seach string is all lowercase
set smartcase

" Make sure that tabline is always present
set showtabline=2

" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2


" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Use F4 to toggle 'paste' mode
"
nnoremap <F4> :set invpaste paste?<CR>
set pastetoggle=<F4>
set showmode


" Show line, column number, and relative position within a file in the status line
set ruler

" Show line numbers - could be toggled on/off on-fly by pressing F6
set number

" Enable word wrap
set wrap

" Scroll when cursor gets within 10 characters of top/bottom edge
set scrolloff=10 "999

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=4

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" Expand tabs to spaces
set expandtab

" Wrap text after hitting the 120-char length
set textwidth=120

" do not wrap lines by default
set wrap "nowrap

" Write swap file to disk after every 50 characters
set updatecount=50

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" /20  - remember 20 items in search history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,/20,%,n~/.viminfo

" Define what to save with :mksession
" blank - empty windows
" buffers - all buffers not only ones in a window
" curdir - the current directory
" folds - including manually created ones
" help - the help window
" options - all options and mapping
" winsize - window sizes
" tabpages - all tab pages
set sessionoptions=blank,buffers,curdir,folds,help,options,winsize,tabpages

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Fix my <Backspace> key (in Mac OS X Terminal)
set t_kb=
fixdel

" Avoid loading MatchParen plugin
let loaded_matchparen = 1

" netRW: Open files in a split window
let g:netrw_browse_split = 1

" Make sure cursor is not blinking
set gcr=a:blinkwait0,a:block-cursor
if has("gui_macvim")
    hi CursorColumn guibg=#cae682
endif

" TeX/LaTeX support (via vim-latex-suite)
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'

"
" Tags
"
"
"set tags+=$HOME/.vim/tags/python2.ctags

"
" Plugins tuning
"

" NERDTree
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let NERDTreeWinSize = 35
" Make sure that when NT root is changed, Vim's pwd is also updated
let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 0
nmap <Leader>o :NERDTreeToggle<CR>
" Open NERDTree on startup, when no file has been specified
autocmd VimEnter * if !argc() | NERDTree | endif

" Close vim without prompting if NERDTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Project
let g:proj_flags="FisLt"
let g:proj_window_width = 40

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

" Command-T Plugin
let g:CommandTMaxHeight = 25
" never show auto-generated api-docs files
set wildignore=api-docs/**,public/api-docs/**,app/cache/**,*.php~

" Gist
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/mydata/snippets"
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

"
" Folding
"
let g:php_folding = 2
set foldlevel=5


"
" Large File
"

"
" PHP
"
au FileType php set omnifunc=phpcomplete#CompletePHP
" LESS
au BufNewFile,BufRead *.less set filetype=less
" WSGI
au BufNewFile,BufRead *wsgi set filetype=python
" HTML
au BufRead,BufNewFile *.twig set filetype=html
" highlight trailing space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" Remove trailing spaces
au FileType vim,php,c,python,html,twig,yml,xml,js,md au BufWritePre *.* :%s/\s\+$//e


"run file with PHP CLI (CTRL-M)
"au FileType php noremap <C-M> :w!<CR>:!php %<CR>
" " PHP parser check (CTRL-L)
au FileType php noremap <C-L> :!php -l %<CR>
"au FileType python set omnifunc=pythoncomplete#Complete
"au FileType python set foldmethod=indent
"au FileType python set foldnestmax=2
augroup sh
    au!
    "smart indent really only for C like languages
    au FileType sh set nosmartindent autoindent
    au FileType sh map <C-M> :QuickRun<CR>
augroup END

"
" MAPPINGS
"

" Set the <Leader> for combo commands
let mapleader = ","

imap <Leader>z <ESC>l
vmap <Leader>z <ESC><ESC>l

" Easy window resizing (good to use with NERDTree)
map <Leader>h 1<C-w><Bar>
map <Leader>hh 25<C-w><Bar>
nmap <Leader>cat :!cat ~/.vbuf<CR>

" Large file
let g:LargeFile = 2

" Gist plugin
let g:gist_show_privates = 1
let g:gist_private = 1

" Easy keymap switing
imap <Leader>r <C-^>
nmap <Leader>r a<C-^><ESC>

" Phrozn key
nmap <Leader>phr :!phr up ./src .<CR>
nmap <Leader>jek :!jekyll build<CR>

" Easy tab navigation
map tn :tabnext<CR>
map tp :tabprevious<CR>
map tc :tabnew<CR>
map td :tabclose<CR>

" Allows you to enter sudo pass and save the file
" when you forgot to open your file with sudo
cmap w!! %!sudo tee > /dev/null %

" Auto-complete - more smart menu see: http://bit.ly/d1ILFI
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Keyword (from current file only) completion - NetBeans habits
imap <C-k> <C-x><C-n>

" easy way to edit reload .vimrc
nmap <Leader>V :source $MYVIMRC<CR>
nmap <Leader>v :vsp $MYVIMRC<CR>
nmap <Leader>todo :vsp ~/projects.todo.txt<CR>

" F2 allow to utilize screen
"map <F2> :!screen -x cli<CR>
"imap <F2> <ESC>:!screen -x cli<CR>
"vmap <F2> <ESC><ESC>:!screen -x cli<CR>

" F3 search lines with FuzzyFinder

if has("gui_macvim")
    map <F3> :FufLine<CR>
    imap <F3> <ESC>:FufLine<CR>
    vmap <F3> <ESC><ESC>:FufLine<CR>
endif

au FileType php noremap <Leader>k <ESC>:!phpunit --configuration tests/phpunit.xml --group cur %<CR>
au FileType php noremap <Leader>j <ESC>:!phpunit --configuration tests/phpunit.xml %<CR>
au FileType php noremap <F5> <ESC>:!php -f %<CR>
"au FileType python noremap <F5> <ESC>:!python %<CR>
au FileType sql noremap <F5> <ESC>:!mysql < %<CR>
au FileType javascript noremap <F5> <ESC>:!js -strict -w -f %<CR>
au FileType vim noremap <F5> <ESC>:so %<CR>

map <Leader>l :BufExplorer<CR>
imap <Leader>l <ESC>:BufExplorer<CR>
vmap <Leader>l <ESC>:BufExplorer<CR>

" vimdiff
map ]] ]c
map [[ [c
map <Leader>gdi :Gdiff<CR>
map <Leader>gst :Gstatus<CR>
map <Leader>dup :diffupdate<CR>

" F8 See List of Bookmarks
map <F7> :MarksBrowser<CR>
imap <F7> <ESC>:MarksBrowser<CR>
vmap <F7> <ESC>:MarksBrowser<CR>

" " Open and close the taglist.vim separately
map <F10> :TrinityToggleTagList<CR>
imap <F10> <ESC>:TrinityToggleTagList<CR>
nmap <F10>  <ESC>:TrinityToggleTagList<CR>

" " Open and close the NERD_tree.vim separately
nmap <F11>  :TrinityToggleNERDTree<CR>

" Open and close all the three plugins on the same time
nmap <F12>  :TrinityToggleAll<CR>

" Ability to open tag'ed document as vertical split
" or a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


" Allow to copy/paste between VIM instances
"copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
"copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
"paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

" save changes
map <Leader>s :w<CR>
imap <Leader>s <ESC>:w<CR>
vmap <Leader>s <ESC><ESC>:w<CR>
" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>l
nnoremap JJJJ <Nop>
inoremap <C-[> <Esc>

" reload uwsgi
map <Leader>u :silent !touch /tmp/uwsgi-reload.txt<CR><C-l>
imap <Leader>u <ESC>:silent !touch /tmp/uwsgi-reload.txt<CR><C-l>
vmap <Leader>u <ESC><ESC>:silent !touch /tmp/uwsgi-reload.txt<CR><C-l>
" Locate file in hierarchy quickly
map <Leader>T :NERDTreeFind<CR>
" change the directory to the current file I'm working on
" plays nicely with NERDTree - when file opened
map ,cd :cd %:p:h
" close buffer using bclose plugin (window is not closed)
map ,w :Bclose<CR>
map ,diff :call Svndiff('next')<CR>
imap ,diff <ESC>:call Svndiff('next')<CR>
map ,diffc :call Svndiff('clear')<CR>
imap ,diffc <ESC>:call Svndiff('clear')<CR>
" switch to upper/lower window quickly
map <C-J> 5j
map <C-K> 5k
" use CTRL-F for omni completion
imap <C-F> 
" map CTRL-L to piece-wise copying of the line above the current one
imap <C-L> @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s
" map ,f to display all lines with keyword under cursor and ask which one to
" jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>
" page down with <Space>
nmap <Space> <PageDown>
" open filename under cursor in a new window (use current file's working
" directory)
nmap gf :new %:p:h/<cfile><CR>
" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" turn off search highlighting
nmap <silent> <Leader>n :silent :nohlsearch<CR>

" Make sure that CTRL-A (used by gnu screen) is redefined
noremap <Leader>inc <C-A>
nmap <Leader>sc :set scrolloff=1<CR>
nmap <Leader>scc :set scrolloff=999<CR>

map <Leader>cn :cn<CR>
map <Leader>co <Esc>:call CompileRunGcc()<CR>
map <Leader>m <Esc>:!clear && make clean && make && ./randomstring<CR>
map <Leader>m <Esc>:!clear && make clean && make assignment5 && ./testdominion<CR>
func! CompileRunGcc()
    exec "w"
    exec "!clear && gcc -Wall -std=c99 -pedantic-errors % -o %< && echo '\\n--------------------------------------------\\n' && ./%<"
    "exec "! ./%<"
endfunc

nmap <F8> :Cnext<CR>
nmap <F10> :Cstep<CR>
nmap <Leader>pep :!pep8 %<CR>
nmap <Leader>x :TagbarToggle<CR>

" xdebugger
" let g:debuggerPort=9999

"map <Leader><F1> :python debugger_resize()<cr>
"map <Leader><F2> :python debugger_command('step_into')<cr>
"map <Leader><F3> :python debugger_command('step_over')<cr>
"map <Leader><F4> :python debugger_command('step_out')<cr>
"map <Leader><F5> :call <SID>startDebugging()<cr>
"map <Leader><F6> :call <SID>stopDebugging()<cr>
"map <Leader><F7> :python debugger_context()<cr>
"map <Leader><S-F7> :python debugger_property()<cr>
"map <F11> :python debugger_watch_input("context_get")<cr>A<cr>
"map <F12> :python debugger_watch_input("property_get", '<cword>')<cr>A<cr>
"nnoremap ,e :python debugger_watch_input("eval")<cr>A

imap <C-o> :set paste<CR>:exe PhpDoc()<CR>:set nopaste<CR>i

let g:syntastic_mode_map = { 'mode': 'active',
         \ 'active_filetypes': ['php', 'ruby'], }

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
"let g:syntastic_phpmd_args = " text cleancode"
"--standard=PSR2
let g:syntastic_php_phpcs_args = "--standard=PSR2 -n --report=csv"

if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif
