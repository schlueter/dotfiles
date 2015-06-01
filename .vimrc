" Visuals
set laststatus=2
set wrap

" Alarm
set visualbell
set noerrorbells

set nocompatible
set history=1000
set undolevels=1000

"allows modified buffers to not be in the foreground
set hidden

"search settings
set hlsearch
set incsearch
set showmatch

",/ turns off hlsearch
nmap <silent> ,/ :nohlsearch<CR>

" Change backup behaviour
set backupdir=~/.vim/tmp,.
"set nobackup
"set noswapfile

"filetype settings
filetype plugin indent on

"turn off autoindent for paste
set pastetoggle=<F3>

" Easy window handling
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-s> <C-w>s

" Sudo save
cmap w!! w !sudo tee % >/dev/null

"no blink in normal mode
set gcr=n:blinkon0

"solarized
syntax enable
set background=dark
colorscheme koehler

"minibufexplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"helpful mappings
inoremap " ""<left>
inoremap "" "
inoremap """ """<CR><CR>"""<up>
inoremap """" """
inoremap '' <right>
"inoremap [ []<left>
"inoremap [[ [
"inoremap { {}<left>
inoremap {% {%  %}<left><left><left>
inoremap {{ {{  }}<left><left><left>
inoremap {{{ {
inoremap {} {}
"inoremap ( ()<left>
"inoremap (( (

" Diff of current state and current saved state
map <F2> :w !diff % -<CR>

" NERDTree
map <F5> :NERDTreeToggle<CR>

" Pydiction
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

"let g:syntastic_mode_map = { 'mode': 'active',
"	\ 'active_filetypes': [],
"	\ 'passive_filetypes': ['html'] }
"let g:syntastic_python_checker="pyflakes"

" turn-on distraction free writing mode for markdown files
"au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} call DistractionFreeWriting()

"Distraction free writing settings
let g:fullscreen_colorscheme = "iawriter"
let g:fullscreen_font = "Cousine:h14"
let g:normal_colorscheme = "Tomorrow-Night-Eighties"

"Powerline
let g:Powerline_symbols = 'fancy'

"Html linting
vmap ,x :%!tidy -q -i --show-errors 0<CR>

let g:closetag_html_style=1
au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
