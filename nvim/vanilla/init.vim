autocmd BufRead,BufNewFile * start
if has('nvim')
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !wget -P ~/.config/nvim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !wget -P ~/.vim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

"----------------------------------------------------------------------------------------------------------------------------------------
"MIGHT NEED TO DELETE LATER
set foldmethod=marker
set rtp+=pathofIndentLine
" :verbose set modifiable
" :autocmd BufNewFile *.txt :write
if has("autocmd")
    augroup templates
        autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh | :2 | startinsert
        autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c | :5 | startinsert
        autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp | :28 | startinsert
        autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex | :8 | startinsert
    augroup END
endif
" All files
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd l


" JS + JSX files 
autocmd VimEnter *.js 75VTerm 
autocmd VimEnter *.js Term
autocmd VimEnter *.js wincmd h
autocmd VimEnter *.jsx 75VTerm 
autocmd VimEnter *.jsx Term 
autocmd VimEnter *.jsx wincmd h

" Bash scripts
autocmd VimEnter *.sh 75VTerm
autocmd VimEnter *.sh wincmd h

" C + CPP files
autocmd VimEnter *.c 75VTerm
autocmd VimEnter *.c wincmd h
autocmd VimEnter *.cpp 75VTerm
autocmd VimEnter *.cpp wincmd h

" Python files
autocmd VimEnter *.py 75VTerm
autocmd VimEnter *.py wincmd h

"autocmd VimEnter * IndentLinesEnable
command! JsonB :%!python -m json.tool
"----------------------------------------------------------------------------------------------------------------------------------------

call plug#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plug 'tpope/vim-fugitive'

" :GV - commit browser
" :GV! only commits for current file
"  o or <cr> on a commit to display the content of it
"  o or <cr> on commits to display the diff in the range
"  O opens a new tab instead
"  gb for :Gbrowse
"  ]] and [[ to move between commits
"  . to start command-line with :Git [CURSOR] SHA à la fugitive
"  q to close
Plug 'junegunn/gv.vim'

Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'


Plug 'tomtom/tcomment_vim'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'

Plug 'easymotion/vim-easymotion'

Plug 'terryma/vim-multiple-cursors'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'jpo/vim-railscasts-theme'

Plug 'scrooloose/nerdTree'

Plug 'vim-scripts/indentpython.vim'

" aa ia - around argument, in argument
Plug 'vim-scripts/argtextobj.vim'

" Alt+c - modify color
" Alt+r - insert new color RGB
" Alt+2 - insert new color RGBA
" :ColorPicker - color picker
" origin: KabbAmine/vCoolor.vim
Plug 'kracejic/vcoolor.vim'

" new text objects
Plug 'kana/vim-textobj-user'
" f F text objects
Plug 'kana/vim-textobj-function'
" User defined operators/actions
Plug 'kana/vim-operator-user'
Plug 'michaeljsmith/vim-indent-object'


Plug 'vimwiki/vimwiki'

" gs
Plug 'christoomey/vim-sort-motion'

Plug 'tomasr/molokai'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'pearofducks/ansible-vim'

" :Tabularize
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown' "better markdown support


" better cooperation with tmux
Plug 'christoomey/vim-tmux-navigator'

" gutter for marks
Plug 'kshenoy/vim-signature'

" Vim Plug for switching between companion source files (e.g. .h and .cpp)
Plug 'derekwyatt/vim-fswitch'

Plug 'rhysd/vim-clang-format'
Plug 'sbdchd/neoformat'

" session management
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'gikmx/ctrlp-obsession'

" vim abolish does three things,
" :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}
" :Subvert/blog{,s}/post{,s}/g
" coercion - crs, crc change to snake case,
"              change to camel case, cru upper case
Plug 'tpope/vim-abolish'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'kracejic/snippetinabox.vim'

Plug 'scrooloose/syntastic'

Plug 'majutsushi/tagbar'

Plug 'joereynolds/gtags-scope'

" nice search in files
Plug 'dyng/ctrlsf.vim'
" :FS [pattern]

"-----------------------------------------------------------------------------------------------------------------------------
" NEW STUFF
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimlab/split-term.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'thaerkh/vim-indentguides'
Plug 'rhysd/git-messenger.vim'
let g:indentguides_tabchar = '│'
let g:indentguides_spacechar = '│'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'jiangmiao/auto-pairs'
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''
"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
"let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = ''
let g:split_term_default_shell = "zsh"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'prettier/vim-prettier', {
            \ 'do': 'yarn install',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let NERDTreeShowHidden=1
autocmd BufWritePre *.py execute ':Black'
Plug 'justinmk/vim-sneak'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'rakr/vim-one'
Plug 'wadackel/vim-dogrun'
Plug 'v15hv4/vim1s'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"-----------------------------------------------------------------------------------------------------------------------------
" search with :Ack [options] {pattern] [{directories}]
Plug 'mileszs/ack.vim'

" :Dox command generates stub for doxygen doc in C++, etc
Plug 'vim-scripts/DoxygenToolkit.vim'

" :Search :SearchBuffers :SearchReset :SearchBuffersReset
" <Leader>*
Plug 'vim-scripts/MultipleSearch'

" fast searching
" Plug 'junegunn/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" ga / gaip= align in paragraph around char =
Plug 'junegunn/vim-easy-align'

" :ColorToggle
Plug 'lilydjwg/colorizer'

" Syntaxes for a lot of languages
Plug 'sheerun/vim-polyglot'

" :DevDocs ---
Plug 'rhysd/devdocs.vim'

Plug 'vim-scripts/visual-increment'

" :Delete, :Unlink, :Move, :Rename, :Chmod, :Mkdir, :Find, :Locate, :SudoWrite, :SudoEdit
Plug 'tpope/vim-eunuch'

"Run interactive:
":DB sqlite:myfile.sqlite3
"
"Run commands
":DB sqlite:myfile.sqlite3 select count(*) from widgets
":DB redis:/// CLIENT LIST
"
"Save DBs locations
":DB g:prod = postgres://user:pass@db.example.com/production_database
":DB g:prod drop table users
"
"Give a range to run part or all of the current buffer as a query.
":%DB mysql://root@localhost/bazquux
Plug 'tpope/vim-db'

Plug 'skywind3000/asyncrun.vim'

" New autocomplete
" Async support
Plug 'prabirshrestha/async.vim'
" Async autocompletion for Vim 8 and Neovim with |timers|.
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
" Provide Language Server Protocol autocompletion source for asyncomplete.vim and vim-lsp.
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Async Language Server Protocol plugin for vim8 and neovim.
Plug 'prabirshrestha/vim-lsp'
" Add suport for languages
Plug 'mattn/vim-lsp-settings'
" Support snippets
" Plug 'thomasfaingnaert/vim-lsp-snippets'
" Plug 'thomasfaingnaert/vim-lsp-ultisnips'


" Plug 'artur-shaik/vim-javacomplete2'


let g:colorizer_startup = 0


Plug 'kracejic/themeinabox.vim'

" Bin
" Plug 'itchyny/calendar.vim'




" All of your Plugins must be added before the following line
call plug#end()

set clipboard+=unnamedplus
"nnoremap <C-y> "+y
"vnoremap <C-y> "+y
"nnoremap <C-p> "+gP
"vnoremap <C-p> "+gP

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
" Use of the filetype plugins, auto completion and indentation support
" filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" -----------------------------------------------------------------------------
" Key shortcuts in VIM
" !! bash output on screen, current line is stdin


"General
" set number  "Show line numbers
" set relativenumber
set nu
set nornu
nmap <leader>num :set nu! <CR>:set rnu!<CR>
nmap <leader>gnum :set g:nu! <CR>:set g:rnu!<CR>
set wrap  "enable wraping
set linebreak   "Break lines at word (requires Wrap lines)
set nolist         " list disables linebreak
set scrolloff=5         " 2 lines above/below cursor when scrolling
set noswapfile  " turn off swapfiles

" :imap jj <Esc>
:imap <C-L> <Esc>

set textwidth=0
set wrapmargin=0  "Disable line wrap
set ruler   "Show row and column ruler information
set showbreak=+++   "Wrap-broken line prefix
"set textwidth=100   "Line wrap (number of cols)
set showmatch   "Highlight matching brace
set showcmd             " show command in bottom bar
set title               " show file in titlebar
set showmode            " show mode in status bar (insert/replace/...)
set visualbell  "Use visual bell (no beeping)
set cursorline          " highlight current line
set matchpairs+=<:>     " specially for html

set hlsearch    "Highlight all search results
set smartcase   "Enable smart-case search
set ignorecase  "Always case-insensitive
set incsearch   "Searches for strings incrementally
nmap \q :nohlsearch<CR>
nnoremap <leader><space> :noh<cr>


set virtualedit=onemore  "allow to go one character behind the end of the line
set autoindent  "Auto-indent new lines
set expandtab   "Use spaces instead of tabs
set shiftwidth=4    "Number of auto-indent spaces
set smartindent "Enable smart-indent
set smarttab    "Enable smart-tabs
set softtabstop=4   "Number of spaces per Tab
set wildmenu            " visual autocomplete for command menu
set wildignore+=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn,*/cm/log/**,tags,*.jpg,*.png,*.jpeg,*.png,*.mesh,build*/**,build/**,*.sublime-workspace,*.svg,build2/**,build3/**
set lazyredraw          " redraw only when we need to.
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=150          " keep 50 lines of command history
set mouse=v             " use mouse in visual mode (not normal,insert,command,help mode
set t_ut=
set previewheight=7

set fillchars+=vert:│         " nicer vert split separator
set fillchars+=stlnc:-        " nicer separator for horizontal split

if has('gui_running')
    set guifont=Iosevka\ Term\ 12
endif

"display whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
"set listchars=eol: ,tab:>-,trail:~,extends:>,precedes:<

set tags=./tags;/   "This will look in the current directory for 'tags', and work up the tree towards root until one is found.
set cscopetag

"Fuzzy search
if isdirectory("/mingw32")
    " CtrlP settings
    let g:ctrlp_match_window = 'top,order:ttb,max:15,results:15'
    let g:ctrlp_follow_symlinks = 1
    "let g:ctrlp_switch_buffer = 0
    "let g:ctrlp_working_path_mode = 0
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
    let g:ctrlp_custom_ignore = '\v[\/](node_modules)$'
    let g:ctrlp_working_path_mode = 'a'

    nnoremap <leader>. :CtrlPBufTag<cr>
    nnoremap <leader>, :CtrlPTag<cr>
    nnoremap <leader>q :CtrlPQuickfix<cr>
    nnoremap <Leader>ss :CtrlPObsession<CR>
    nnoremap <leader>a :CtrlPBuffer<CR>
    nnoremap <leader><tab> :CtrlPBuffer<CR>
else
    let g:ctrlp_map = '<leader><c-p>'
    " Default fzf layout
    " - down / up / left / right
    let g:fzf_layout = { 'down': '~50%' }
    " [Buffers] Jump to the existing window if possible
    let g:fzf_buffers_jump = 1
    " [[B]Commits] Customize the options used by 'git log':
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    " [Tags] Command to generate tags file
    let g:fzf_tags_command = 'ctags -R'
    " [Commands] --expect expression for directly executing the command
    let g:fzf_commands_expect = 'alt-enter,ctrl-x'

    " command! GGFiles call fzf#run(fzf#wrap({'source': 'if [ -d .git ] ; then git ls-files -co --exclude-standard ; elif [ -d .hg ] ; then hg locate ; else  find . ; fi', 'sink': 'e'}))
    command! GGFiles call fzf#run(fzf#wrap({'source': 'if git rev-parse --git-dir > /dev/null ; then git ls-files -co --exclude-standard ; elif [ -d .hg ] ; then hg locate ; else  find . ; fi', 'sink': 'e'}))
    " command! GGFiles call fzf#run(fzf#wrap({'source': 'git ls-files -co --exclude-standard', 'sink': 'e'}))
    " command! GGFiles call fzf#run(fzf#wrap({'source': 'git ls-files -co --exclude-standard', 'sink': 'e'}))

    nnoremap <C-p> :GGFiles<cr>
    " nnoremap <C-p> :CtrlP<cr>
    nnoremap <leader>. :BTags<cr>
    nnoremap <leader>, :Tags<cr>
    nnoremap <leader>q :CtrlPQuickfix<cr>
    nnoremap <Leader>ss :CtrlPObsession<CR>
    nnoremap <leader>a :Buffers<CR>
    nnoremap <leader><tab> :Buffers<CR>
    " fzf
    nnoremap <Leader><Leader> :Commands<CR>
    nnoremap <leader>L :Lines<cr>
    nnoremap <leader>l :BLines<cr>
    nnoremap <leader>ft :Filetype<cr>
    " TODO \* usage of word with :Lines and :Ag

    " Insert mode completion
    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)
endif

command! Ctagsgenerate :!ctags -R .
command! Gtagsgenerate :!gtags
" let GtagsCscope_Auto_Load = 1
" find references
nnoremap <leader>ygr "zyiw:cs find c <C-r>z<CR>

" Git-fugitive stuff
nmap <leader>g :Gstatus<cr>gg<C-n>

" open header fswitch
nmap <silent> <F4> :FSHere<cr>
nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>ol :FSRight<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>
nmap <silent> <Leader>oh :FSLeft<cr>
nmap <silent> <Leader>oH :FSSplitLeft<cr>
nmap <silent> <Leader>ok :FSAbove<cr>
nmap <silent> <Leader>oK :FSSplitAbove<cr>
nmap <silent> <Leader>oj :FSBelow<cr>
nmap <silent> <Leader>oJ :FSSplitBelow<cr>

" Tagbar
nmap <silent> <F3> :TagbarToggle<CR>
nmap <silent> <F5> :TagbarOpenAutoClose<CR>
let g:tagbar_case_insensitive = 1
" let g:tagbar_compact = 1
let g:tagbar_indent = 1
let g:tagbar_map_showproto = "r"
let g:tagbar_map_togglefold = "<space>"
let g:tagbar_sort = 0

" for pasting in terminal
set pastetoggle=<F2>

nnoremap <leader>a <C-A>
" vnoremap <leader>a <Plug>VisualIncrement
vnoremap <silent> <Plug><leader>a :<C-U>call <SID>doincrement(v:count1)<CR>
" increment numbers
noremap + <c-a>
noremap - <c-x>


" Splits
set splitbelow    " more natural split opening
set splitright    " more natural split opening
"split movement
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
"saner splits
nnoremap <C-w>\| <C-w>v
nnoremap <C-w>_ <C-w>s
"resizing splits
nnoremap <C-w><C-w>h 8<C-w><
nnoremap <C-w><C-w>l 8<C-w>>
nnoremap <C-w><C-w>k 8<C-w>-
nnoremap <C-w><C-w>j 8<C-w>+
nnoremap <C-w><C-w><C-w>h <C-w><
nnoremap <C-w><C-w><C-w>l <C-w>>
nnoremap <C-w><C-w><C-w>k <C-w>-
nnoremap <C-w><C-w><C-w>j <C-w>+


" buffers
nmap \] :bnext<CR>
nmap \[ :bprev<CR>
nmap <leader>w :bd<CR>
command! Bda :bufdo bd
nnoremap <bs> <c-^>
command! Bd bp|bd<space>#
nnoremap <leader>W :Bd<CR>

" syntax enable           " enable syntax processing
syntax on           " enable syntax processing

" settings for kshenoy/vim-signature, it will color the marks with gitgutter
" color
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1

"reload vimrc
:nmap \rv :source $MYVIMRC<CR>

"strip whitespace
nnoremap <leader>sw :%s/\s\+$//<cr>:let @/=''<CR>
command! Stripwhitespace :%s/\s\+$//
command! Whitespacestrip :%s/\s\+$//

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vimwiki
command! WTable :VimwikiTable
command! WToc :VimwikiTOC
command! WTags :VimwikiRebuildTags




" z= choose spell          ]s [s move
" zg add to spellfile      zw add as bad,           zug/zuw remove from spellfile
set spellfile=~/.vim/spell.misc.utf-8.add
command! Spellen :setlocal spell spelllang=en_us
command! Spellcs :setlocal spell spelllang=cs
command! Spellnone :setlocal nospell
command! ColorPicker :VCoolor


let g:calendar_google_calendar = 1



" quickfix open
:nmap gqf :copen 20<CR>
command Quickfix :copen 20<CR>
command QF :copen 20<CR>
command Qf :copen 20<CR>
command QFF :cclose 20<CR>
command Qff :cclose 20<CR>
" quickfix next, prev
:nmap [q :cprev<CR>
:nmap ]q :cnext<CR>
:nmap [Q :cfirst<CR>
:nmap ]Q :clast<CR>

" location list next, prev
:nmap [e :lprev<CR>
:nmap ]e :lnext<CR>
:nmap [E :lfirst<CR>
:nmap ]E :llast<CR>

" Theme stuff
"let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
nnoremap <leader>0 :colorscheme palenight<cr>:AirlineTheme palenight<cr>
nnoremap <leader>1 :colorscheme one<cr>:AirlineTheme one<cr>
nnoremap <leader>2 :colorscheme molokai<cr>:AirlineTheme base16_monokai<cr>
nnoremap <leader>3 :colorscheme purify<cr>:AirlineTheme purify<cr>
nnoremap <leader>4 :colorscheme onehalfdark<cr>:AirlineTheme onehalfdark<cr>
nnoremap <leader>5 :colorscheme themeinabox-transparent<cr>:AirlineTheme base16_eighties<cr>
nnoremap <leader>6 :colorscheme dogrun<cr>:AirlineTheme palenight<cr>
nnoremap <leader>7 :colorscheme dracula<cr>:AirlineTheme dracula<cr>
nnoremap <leader>8 :colorscheme gruvbox<cr>:AirlineTheme dark<cr>
nnoremap <leader>9 :colorscheme nord<cr>:AirlineTheme nord<cr>

" get current syntax class
nmap <leader>sy :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


"goto next file
:nmap <C-`> :e#<CR>

"toc for markdown
nmap <leader>toc :g/^#/#<CR> :noh <CR>
nmap <leader>defs :g/def /#<CR> :noh <CR>

"Showfunc.vim
nmap <leader>func <Plug>ShowFunc
nmap <leader>fun <Plug>ShowFunc<CR><C-w>H
" nmap <leader>cf <Plug>(operator-clang-format)
" vmap <leader>cf <Plug>(operator-clang-format)

" duplicate lanes TODO
nmap <leader>dd :s/\(^.*$\)/\1\r\1/<CR>:noh<CR>
xmap <leader>dd :'<,'>s/\(.*\)/\1\r\1/<CR>:noh<CR>

" New line in normal mode
" nnoremap <CR> :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" json indent
command! -range -nargs=0 -bar IndentJson <line1>,<line2>!python -m json.tool
command! -range -nargs=0 -bar JsonIndent <line1>,<line2>!python -m json.tool

"xml indent
command! IndentXml :silent %!xmllint --encode UTF-8 --format -
command! XmlIndent :silent %!xmllint --encode UTF-8 --format -

" CLANG FORMAT
" default settings
let g:clang_format#code_style = "llvm"
let g:clang_format#style_options = {
            \ "AllowShortFunctionsOnASingleLine": "Empty",
            \ "AlwaysBreakTemplateDeclarations": "true",
            \ "BreakBeforeBraces": "Allman",
            \ "BreakConstructorInitializersBeforeComma": "true",
            \ "IndentCaseLabels": "true",
            \ "IndentWidth":     4,
            \ "MaxEmptyLinesToKeep": 2,
            \ "NamespaceIndentation": "Inner",
            \ "ObjCBlockIndentWidth": 4,
            \ "TabWidth": 4}

augroup ClangFormatSettings
    autocmd!
    " if you install vim-operator-user
    " ----------------------------------------------------------------------------------------------------------------------------------------------------------------
    "autocmd FileType c,cpp,objc,java,javascript map <buffer><Leader>c <Plug>(operator-clang-format)
    autocmd FileType c,cpp,objc,java map <buffer><Leader>c <Plug>(operator-clang-format)
    " ----------------------------------------------------------------------------------------------------------------------------------------------------------------
    "    autocmd FileType c,cpp syntax clear cppSTLconstant
    autocmd FileType cpp syntax clear cppSTLconstant

    autocmd FileType vimwiki nmap <leader>tts :TaskWikiMod +sprint<CR>
    autocmd FileType vimwiki nmap <leader>ttS :TaskWikiMod -sprint<CR>

    " autocmd FileType markdown set cole=0
    " au BufNewFile,BufRead *.mdw set nowrap
    " au BufNewFile,BufRead,BufAdd *.md set cole=0
augroup END

"------------------------------------------------------------------------------------------------------------------------------------------------------------------------
"let g:indentLine_char = '|'
"let g:indentLine_char = '▏'
"let g:indentLine_char = '⎸'
let g:indentLine_char = '│'
"let g:indentLine_setColors = 0
"let g:indentLine_setConceal = 0
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
"let g:indentLine_fileTypeExclude = ['markdown']
"let g:indentLine_fileType = ["yaml","yml","json"]
"------------------------------------------------------------------------------------------------------------------------------------------------------------------------

" Neoformat
let g:neoformat_enabled_python = ['autopep8']
let g:neoformat_java_clang = {
            \ 'exe': 'clang-format',
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_java = ['clang']

nnoremap <Leader>cf :Neoformat<CR>
vnoremap <Leader>cf :Neoformat<CR>
" format line +-1
" -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
"autocmd FileType c,cpp,objc,java,javascript nnoremap <Leader>cc :.-1,.+1Neoformat<CR>
autocmd FileType c,cpp,objc,java nnoremap <Leader>cc :.-1,.+1Neoformat<CR>
" -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


" markdown ctags
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'vimwiki',
            \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
            \ ]
            \ }
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
            \ ]
            \ }


augroup filetypedetect
    au BufRead,BufNewFile *.log set filetype=log
    au BufReadPost,BufNewFile *.compositor set ft=compositor
    au BufReadPost,BufNewFile *.material set ft=material
    au BufReadPost,BufNewFile *.glsl,*.cg set ft=glsl
    au BufReadPost,BufNewFile content.txt set ft=fitnesse
    au BufReadPost,BufNewFile database.txt,*.conf set ft=conf
    au BufReadPost,BufNewFile config.in set ft=kconfig
    au BufReadPost,BufNewFile *.xml set tabstop=4
    au BufReadPost,BufNewFile *.crt set ft=crt
    au BufReadPost,BufNewFile *.gsh set ft=Jenkinsfile
augroup END


let g:syntastic_cpp_compiler_options = "-std=c++14"
let g:syntastic_java_checkers = []
" add constant
nmap <leader>cre /[,)]<CR>:nohlsearch<CR>Bhi&<ESC>?[,(]<CR>:nohlsearch<CR>wiconst <ESC>

noremap <leader>cr :pyf ~/bin/clang-rename.py<cr>

:nmap \e :NERDTreeToggle<CR>
":nmap \t w setlocal wrap!<CR>:setlocal wrap?
":command Wrap setlocal wrap!<CR>:setlocal wrap?
":command :wrapt setlocal wrap!<CR>:setlocal wrap?<CR> " change wrapping
command! E :e %:p:h
command! LS :!ls -alh --color=always %:p:h

"folding

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za
nnoremap z<space> zA
set foldmethod=indent   " fold based on indent level


" Paste without yanking selected
xnoremap <leader>p "_dP
" Stamp = delete current word (without yanking) and paste
nnoremap S "_diwPb
nnoremap x "_x
nnoremap X "_X
xnoremap S "_diwPb
xnoremap x "_x
xnoremap X "_X


" movement

" move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" move to beginning/end of line
nmap <Home> ^
nmap <End> $

nnoremap gV `[v`]  " This mapping allows you to reselect the text you just pasted:
nnoremap gm :call cursor(0, len(getline('.'))/2)<CR>  " goto midle of line

" diff merge
nnoremap <leader>d1 :diffget 1<CR>
nnoremap <leader>d2 :diffget 2<CR>
nnoremap <leader>d3 :diffget 3<CR>

command! Diffstart :windo diffthis
command! Diffstop :diffoff!

"Advanced
set undolevels=1000 "Number of undo levels
set backspace=indent,eol,start  "Backspace behaviour

" check file change every 4 seconds ('CursorHold') and reload the buffer upon
" detecting change
set autoread
au CursorHold * checktime

set tabpagemax=50 " max number of pages

" colorscheme gruvbox
" --------------------------------------------------------------------------------------------------------------------------------
set background=dark
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif
" colorscheme gruvbox
" let g:airline_theme='base16_eighties'
" --------------------------------------------------------------------------------------------------------------------------------

"plugins
set runtimepath^=~/.nvim/bundle/ctrlp.vim


"save with root
command! Wroot :execute ':silent w !sudo tee % > /dev/null' | :edit!
" fix typo
command! W :w


"   YCMd
" http://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
" :h ins-completion.
" :YcmDiags - errors
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_global_ycm_extra_conf = '~/bin/rc/.ycm_extra_conf.py'
" let g:ycm_error_symbol = '%'
" let g:ycm_warning_symbol = '%'
" let g:ycm_always_populate_location_list = 1
" let g:ycm_max_diagnostics_to_display = 300
" nnoremap <leader>yj :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <leader>yg :YcmCompleter GoTo<CR>
" nnoremap <leader>yi :YcmCompleter GoToImplementationElseDeclaration<CR>
" nnoremap <leader>yt :YcmCompleter GetTypeImprecise<CR>
" nnoremap <leader>yd :YcmCompleter GetDoc<CR>
" nnoremap <leader>yf :YcmCompleter FixIt<CR>
" nnoremap <leader>yr :YcmCompleter GoToReferences<CR>
" nnoremap <leader>ys :YcmDiags<CR>
" nnoremap <leader>yD ::YcmForceCompileAndDiagnostics<CR>
" nnoremap <leader>yR :YcmRestartServer<CR>
" nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <F10> :YcmCompleter GetTypeImprecise<CR>
" nnoremap <F9> :YcmCompleter GetDocImprecise<CR>
" "nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" set completeopt+=menuone

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

" Disable diagnostics
" let g:lsp_diagnostics_enabled = 0
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '%'}
" Disable highligh errors
let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 0
let g:lsp_signs_priority = 11

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    " refer to doc to add more commands
endfunction

nmap <F12> <plug>(lsp-declaration)
nmap gd <plug>(lsp-declaration)
nmap gD <plug>(lsp-definition)
nmap gp <plug>(lsp-peek-declaration)
nmap gP <plug>(lsp-peek-definition)
nmap ge <plug>(lsp-next-diagnostic)
nmap gh <plug>(lsp-hover)
nmap gr <plug>(lsp-references)
nmap gu <plug>(lsp-references)
nmap gE <plug>(lsp-document-diagnostics)
nmap ga <plug>(lsp-code-action)
nmap <leader>ya <plug>(lsp-code-action)
nmap <leader>yj <plug>(lsp-declaration)
nmap <leader>yg <plug>(lsp-declaration)
nmap <leader>yd <plug>(lsp-peek-declaration)
nmap <leader>ys <plug>(lsp-status)

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
            \ 'name': 'file',
            \ 'whitelist': ['*'],
            \ 'priority': 10,
            \ 'completor': function('asyncomplete#sources#file#completor')
            \ }))


set showtabline:0
" airline

let g:airline#extensions#default#section_truncate_width = {
            \ 'b': 79,
            \ 'x': 60,
            \ 'y': 88,
            \ 'z': 60,
            \ 'warning': 80,
            \ 'error': 80,
            \ }
let w:airline_skip_empty_sections = 1
" let g:airline_section_b=' %{fugitive#head()}'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_z='☰ %l/%L:%c'
let g:airline#extensions#branch#format = 2

set laststatus=2
if hostname() =~ "ankh"
    let g:airline_powerline_fonts = 1
elseif hostname() =~ "chirm"
    let g:airline_powerline_fonts = 1
else
    let g:airline_powerline_fonts = 1
endif
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" autocmd VimEnter * set showtabline=0
" autocmd VimEnter * AirlineToggle

nmap <F5>          <Plug>XTablineToggleTabs
nmap <leader><F5>  <Plug>XTablineToggleFiltering

" tabline
" command! TablineON :let g:airline#extensions#tabline#enabled=1
" command! TablineOFF :let g:airline#extensions#tabline#enabled=0
" tabline
" command! TablineON :set showtabline=1
" command! TablineOFF :set showtabline=0

" statusline
command! StatuslineON :set laststatus=2
command! StatuslineOFF :set laststatus=1

" multicursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_exit_from_insert_mode=0


" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" nmap <Leader>w <Plug>(easymotion-w)

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap ss <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

" visual shifting (builtin-repeat)
vnoremap < <gv
vnoremap > >gv

" -----------------------------------------------------------------------------
" fast indentations changes
nmap <leader>t1 :set expandtab tabstop=1 shiftwidth=1 softtabstop=1<CR>
nmap <leader>T1 :set noexpandtab tabstop=1 shiftwidth=1 softtabstop=1<CR>
nmap <leader>t2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap <leader>T2 :set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap <leader>t4 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>T4 :set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>t6 :set expandtab tabstop=6 shiftwidth=6 softtabstop=6<CR>
nmap <leader>T6 :set noexpandtab tabstop=6 shiftwidth=6 softtabstop=6<CR>
nmap <leader>t8 :set expandtab tabstop=8 shiftwidth=8 softtabstop=8<CR>
nmap <leader>T8 :set noexpandtab tabstop=8 shiftwidth=8 softtabstop=8<CR>


" Python specific
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix

command! Pandocahtml :w | ! pandocconvert.sh "%" html5
command! Pandocpdf :w | ! pandocconvert.sh "%" pdf
command! Pandocdocx :w | ! pandocconvert.sh "%" docx
command! Openahtml :w | ! pandocconvert.sh "%" html5 open
command! Openpdf :w | ! pandocconvert.sh "%" pdf open
command! Opendocx :w | ! pandocconvert.sh "%" docx open

" -----------------------------------------------------------------------------
" cn

let g:mc = "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>"

nnoremap cn *``cgn
nnoremap cN *``cgN

vnoremap <expr> cn g:mc . "``cgn"
vnoremap <expr> cN g:mc . "``cgN"

function! SetupCR()
    nnoremap <Enter> :nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z
endfunction

nnoremap cq :call SetupCR()<CR>*``qz
nnoremap cQ :call SetupCR()<CR>#``qz

vnoremap <expr> cq ":\<C-u>call SetupCR()\<CR>" . "gv" . g:mc . "``qz"
vnoremap <expr> cQ ":\<C-u>call SetupCR()\<CR>" . "gv" . substitute(g:mc, '/', '?', 'g') . "``qz"

" substitute for current selection
xnoremap gs y:%s/<C-r>"//g<Left><Left>


" -----------------------------------------------------------------------------
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap <leader>z :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=500
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction

" -----------------------------------------------------------------------------
" search for visually selected text
vnoremap // y/<C-R>"<CR>

" -----------------------------------------------------------------------------
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy/<C-R><C-R>=substitute(
            \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy?<C-R><C-R>=substitute(
            \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>

" -----------------------------------------------------------------------------
" select ag as :Ack search when available
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

nnoremap <leader>ag "zyiw:Ag <C-r>z<CR>
nnoremap <leader>ack "zyiw:Ack <C-r>z<CR>

" -----------------------------------------------------------------------------
"  CtrlSF
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_default_root = 'cwd'
cnoreabbrev FS CtrlSF
cnoreabbrev Fs CtrlSF
nnoremap <leader>fs :CtrlSF<CR>

" -----------------------------------------------------------------------------
"Work stuff clear case
command! Ctpdiff :!cleartool diff -pre -col 190 % | less
command! Ctpdiff2 :!cleartool diff -pre -ser % | less


" -----------------------------------------------------------------------------
" Fix autocompletions
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
                return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

function! g:UltiSnips_Reverse()
    call UltiSnips#JumpBackwards()
    if g:ulti_jump_backwards_res == 0
        return "\<C-P>"
    endif

    return ""
endfunction

if !exists("g:UltiSnipsJumpForwardTrigger")
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

inoremap <silent><C-X><C-U> <C-R>=g:UltiSnips_Complete()<CR>

" -----------------------------------------------------------------------------
" execute macro on visal range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

" -----------------------------------------------------------------------------
" Make the dot command work as expected in visual mode (via
" https://www.reddit.com/r/vim/comments/3y2mgt/do_you_have_any_minor_customizationsmappings_that/cya0x04)
vnoremap . :norm.<CR>

" -----------------------------------------------------------------------------
" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos.
" But first mkdir backup, swap, and undo first to make this work
call system('mkdir ~/.vim')
call system('mkdir ~/.vim/backup')
call system('mkdir ~/.vim/swap')
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    call system('mkdir ~/.vim/undo')
    set undodir=~/.vim/undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" -----------------------------------------------------------------------------
" http://vim.wikia.com/wiki/Sum_numbers
" :let g:S=0
" :%s/\d\+/\=Sum(submatch(0))/
" :echo g:S
let g:S = 0  "result in global variable S
function! Sum(number)
    let g:S = g:S + a:number
    return a:number
endfunction

" -----------------------------------------------------------------------------
" CMake support
function! BuildCMakeProjectShort(target, dir)
    echom a:target
    if isdirectory(a:dir)
        silent !clear
        execute "! cd " . a:dir . " && clear && cmake --build . --target " . a:target . " -- -j" . (system('grep -c ^processor /proc/cpuinfo')+1) . " && echo '-- Build was OK'"
    else
        echo "build folder was not found, cannot build"
    endif
endfunction

function! BuildCMakeProject(target, dir)
    echom a:target
    let currentWinNr = winnr()
    " let wnr = bufwinnr('__Build_output__')

    copen 25

    setlocal filetype=krcppbuild
    " Insert the bytecode.
    setlocal number
    :map <buffer> q :bd<cr>
    " setlocal nomodifiable

    execute 'AsyncRun bb '. a:target

    " go back
    exe l:currentWinNr  . "wincmd w"

endfunction

nmap <leader>bt :!tmux send-keys -t "build" Up Enter<CR><CR>

if isdirectory("build")
    nmap <leader>bb :call BuildCMakeProject("unit", "build")<CR>
    nmap <leader>bu :call BuildCMakeProject("check", "build")<CR>
    nmap <leader>bB :call BuildCMakeProject("all", "build")<CR>
    nmap <leader>br :call BuildCMakeProjectShort("run", "build")<CR>
    nmap <leader>bc :call BuildCMakeProject("clean", "build")<CR>
    nmap <leader>bf :call BuildCMakeProject("format", "build")<CR>
endif

" error message formats - see :help errorformat
let &efm = '\.\.\/%f:%l: FAILED:' . ','
let &efm .= '%f:%l: FAILED:' . ','
let &efm .= '\.\.\/%f:%l:%c: error: %m' . ','
let &efm .= '%f:%l:%c: error: %m' . ','
let &efm .= '\.\.\/%f:%l:%c: warning: %m' . ','
let &efm .= '%f:%l:%c: warning: %m' . ','
let &efm .= '\.\.\/%f:%l: error: %m' . ','
let &efm .= '%f:%l: error: %m' . ','
let &efm .= '\.\.\/%f:%l: warning: %m' . ','
let &efm .= '%f:%l: warning: %m' . ','