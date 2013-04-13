" If program started as 'vi', use compatibility mode
" Otherwise, enable vim features, and disable highlighting
" ...among many other things

" Vi vs. Vim
if v:progname =~? 'vi$' 
	set compatible
	set showmode
	syntax off
	let loaded_nerd_comments = 1
else
	" Basic
	set nocompatible        "use vim defaults (no vi)
	set shortmess=aTI       "abbrevs, mid-truncate, no intro
	syntax on               "turn on syntax highlighting

	" Setup Vundle 
	filetype off
	let iCanHazVundle=1
	let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
	if !filereadable(vundle_readme)
		echo "Installing Vundle..."
		echo ""
		silent !mkdir -p ~/.vim/bundle
		silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
		let iCanHazVundle=0
	endif 
	set rtp+=~/.vim/bundle/vundle
	call vundle#rc()

	Bundle 'gmarik/vundle'
	Bundle 'Syntastic'
	Bundle 'altercation/vim-colors-solarized'
	"Bundle 'msanders/snipmate.vim'
	Bundle 'tpope/vim-surround'
	Bundle 'tpope/vim-fugitive'
	Bundle 'tpope/vim-git'
	Bundle 'ervandew/supertab'
	"Bundle 'wincent/Command-T'
	"Bundle 'mitechie/pyflakes-pathogen'
	"Bundle 'mileszs/ack.vim'
	Bundle 'sjl/gundo.vim'
	"Bundle 'davidhalter/jedi-vim'
	Bundle 'fs111/pydoc.vim'
	"Bundle 'alfredodeza/pytest.vim'
	Bundle 'reinh/vim-makegreen'
	Bundle 'vim-scripts/L9'
	Bundle 'vim-scripts/FuzzyFinder'
	Bundle 'vim-scripts/pep8'
	Bundle 'vim-scripts/TaskList.vim'
	"Bundle 'vim-scripts/The-NERD-tree'
	Bundle 'vim-scripts/The-NERD-Commenter'
	"Bundle 'vim-scripts/AnsiEsc.vim'
	Bundle 'sontek/minibufexpl.vim'
	Bundle 'sontek/rope-vim'
	"Bundle 'Valloric/YouCompleteMe'
	
	if iCanHazVundle == 0
		echo "Installing Bundles, please ignore key map error messages"
		echo ""
		:BundleInstall
	endif
	" End of setting up Vundle
	" General
	filetype plugin indent on       "load filetype plugins/indent settings
	set autochdir                   "always switch to the current file directory
	set backspace=indent,eol,start  "make backspace more flexible

	" Vim UI
	set hlsearch            "highlight searches
	"set nohls is           "don't hilight results/incsearch
	set incsearch           "incremental searching
	"set ruler              "show the current row and column
	set scrolloff=1         "keep 1 lines when scrolling
	set showcmd             "display incomplete commands
	set showmode            "display current mode
	"set columns=80

	" Colors
	" Load color scheme
	"colorscheme oceanblack256
	"colorscheme wombat256
	colorscheme solarized

	" If using a dark background within the editing area and syntax highlighting
	" turn on this option as well
	set background=dark

	" Text Formatting/Layout
	"set expandtab          "use spaces, not tabs
	set noexpandtab
	set tabstop=4           "tab is 4 spaces
	set softtabstop=4		"soft tabs 4 spaces
	set shiftwidth=4        "columns to shift >>/<<
	set autoindent          "automatically indent
	set smartindent         "and be smart about it

	" Window navigation
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-h> <C-w>h
	map <C-l> <C-w>l

	" Task lists
	map <Leader>td <Plug>TaskList

	" Undo diffs
	map <Leader>g :GundoToggle<CR>

	" Python folding
	set foldmethod=indent
	set foldlevel=99

	" PEP8
	let g:pep8_map='<Leader>8'

	" FuzzyFinder data directory
	let g:fuf_dataDir='~/.vim/fuf-data'

	" Jedi-vim Goto
	"let g:jedi#goto_definition = "<Leader>j"
	"map <buffer><Leader>j :call jedi#goto()<CR>

	" Tab completion/documentation
	au FileType python set omnifunc=pythoncomplete#Complete
	let g:SuperTabDefaultCompletionType = "context"
	set completeopt=menuone,longest,preview

	" NERDTree File Browser
	"map <Leader>n :NERDTreeToggle<CR>
	" FuzzyFinder
	map <Leader>f :FufFile<CR>
	map <Leader>b :FufBuffer<CR>

	" Ropevim
	" Go to definition
	map <Leader>j :RopeGotoDefinition<CR>
	" Rename/Refactor
	map <Leader>r :RopeRename<CR>

	" Ack Searching
	"nmap <Leader>a <Esc>:Ack!

	" Testing
	" django nose
	"map <Leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>
	" py.test
	" Execute the tests 
	"nmap <silent><Leader>tf <Esc>:Pytest file<CR>
	"nmap <silent><Leader>tc <Esc>:Pytest class<CR>
	"nmap <silent><Leader>tm <Esc>:Pytest method<CR>
	" Cycle through test errors
	"nmap <silent><Leader>tn <Esc>:Pytest next<CR>
	"nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
	"nmap <silent><Leader>te <Esc>:Pytest error<CR>

	" Add the virtualenv's site-packages to vim path
	"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUAL_ENV' in os.environ:
	"project_base_dir = os.environ['VIRTUAL_ENV']
	"sys.path.insert(0,project_base_dir)
	"activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
	"execfile(activate_this, dict(__file__=activate_this))
"EOF

	" Django modules
	"export DJANGO_SETTINGS_MODULE=project.settings

	" <C-v><C-h> to unshift comments?
	inoremap # X<BS>#

	" Misc keybinds
	" Numbering/Relative Numbering
	" Call that thing
	nnoremap <silent> <F2> :call NumberLines()<CR>
	inoremap <silent> <F2> <C-o>:call NumberLines()<CR>
	" If normal numbering is displayed, force a change 
	" to relative numbers (turns off normal numbering); 
	" if relative numbers are displayed, force rnu 
	" (turn off all relnumbering); if neither is set, 
	" invert the normal line numbering setting 
	" (turn on normal line numbering)
	func! NumberLines()
		if &number 
			set relativenumber! 
		elsei &relativenumber 
			set relativenumber! 
		else 
			set invnumber 
		endif
	endfunc

	" Quickly toggle expandtab (insert spaces, not tabs)
	nnoremap <silent> <F3> :set expandtab!<CR>
	inoremap <silent> <F3> <C-o>:set expandtab!<CR>

	" Toggle wraparound
	nnoremap <silent> <F4> :set wrap!<CR>
	inoremap <silent> <F4> <C-o>:set wrap!<CR>

	" Spellchecking
	noremap <silent> <F7> :setlocal spell! spelllang=en_us<CR>
	inoremap <silent> <F7> <C-o>:setlocal spell! spelllang=en_us<CR>

	" Folding
	"set foldmethod=manual
	" Marker and manual folding
	" augroup vimrc
		" au BufReadPre * setlocal foldmethod=indent|syntax
		" au BufWinEnter * if &fdm == 'marker' | setlocal foldmethod=manual | endif
	" augroup END
	" Save unmarked folds
	autocmd BufWinLeave * if expand("%") != "" | mkview | endif
	autocmd BufWinEnter * if expand("%") != "" | silent loadview | endif


	" F8 fold create
	" vnoremap <F8> <C-c>zf
	" F9 fold toggle
	inoremap <F9> <C-o>za
	nnoremap <F9> za
	onoremap <F9> <C-c>za
	vnoremap <F9> zf
	" Spacebar toggle
	nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
	vnoremap <Space> zf

	" Configure plugins
	" Customize NERDCommenter
	let NERDSpaceDelims=1   "delimit comments with spaces

	" Statusline
	set laststatus=2            " Display statusline
	set statusline=%f           " Filename w/relative path
	" Complex, non-working: show only [] when something to show
	" set statusline+=%{&ft=~'\a*'?\"[%Y%M%R]\":&modified?\"[%M]\":\'\'}       
	set statusline+=\ %Y        " Type of file in buffer ",VIM"
	set statusline+=%M          " Modified flag ",+"
	" set statusline+=%H          " Help flag ",HLP"
	set statusline+=%R          " Readonly flag ",RO"
	set statusline+=\ [%{&ff}]  " File format
	" Git status from Fugitive
	set statusline+=\ %{fugitive#statusline()}
	set statusline+=%=          " Left/right seperator
	" If spellchecking is on, display [Spell]
	set statusline+=%{&spell?\"[Spell]\":\"\"}
	" Show whether tabs or spaces are used on tabbing
	set statusline+=[%{&expandtab?\"Spaces\":\"Tabs\"}]
	" Show line number, current column...
	set statusline+=[%l,%c]
	" ...and percentage through the buffer
	set statusline+=[%p%%]

endif	"end of vi/vim checking if block

" File management
" Undo
" where to put undo files (version control)
if exists("&undodir")
	set undodir=~/.vim/undo//
endif
set undofile            "use undofiles
set undolevels=1000     "maximum # of changes that can be undone
set undoreload=10000    "maximum # lines to save for undo on a buffer reload

" Backups
set backup              "make backup files

" where to put backup files
if exists("&backupdir")
	set backupdir=~/.vim/backup//
endif

" Swap
" directory to place swap files
if exists("&directory")
	set directory=~/.vim/tmp//
endif

" Miscellaneous settings
" Don't wrap long lines
set nowrap

" Searching
" Turn on case insensitive and smartcase searching
set ignorecase
set smartcase

" Arrow keys are the devil
inoremap	<Up>	<NOP>
inoremap	<Down>	<NOP>
inoremap	<Left>	<NOP>
inoremap	<Right>	<NOP>
noremap		<Up>	<NOP>
noremap		<Down>	<NOP>
noremap		<Left>	<NOP>
noremap		<Right>	<NOP>

" Write to a protected file (nope)
"cmap w!! %!sudo tee > /dev/null %