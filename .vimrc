" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()
filetype plugin on

" Visuals
set laststatus=2
set wrap

" Alarm
set visualbell
set noerrorbells

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


filetype plugin indent on

set noswapfile

"turn off autoindent for paste
set pastetoggle=<F3>

" Easy window handling
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-s> <C-w>s

" Remove trailing whitespace
autocmd BufWritePre *.py,*.yml,*.yaml :%s/\s\+$//e

" Sudo save
cmap w!! w !sudo tee % >/dev/null

" Search for word under cursor
vnoremap // y/<C-R>"<CR>

"solarized
syntax enable
set background=dark
colorscheme koehler

"minibufexplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Diff of current state and current saved state
map <F2> :w !diff '%' -<CR>

" turn-on distraction free writing mode for markdown files
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} call DistractionFreeWriting()

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

"Always change working dir to current file dir
autocmd BufEnter * silent! lcd %:p:h

"Set command and input cursors
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

"Set up clipboard
set clipboard=unnamed
