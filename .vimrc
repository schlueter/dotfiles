let s:darwin = has('mac')

set nocompatible

call plug#begin()

  Plug 'ConradIrwin/vim-bracketed-paste'
  Plug 'Glench/Vim-Jinja2-Syntax'
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/fzf',           {'do': 'yes \| ./install'}
  Plug 'junegunn/goyo.vim',      {'on': 'Goyo'}
  Plug 'junegunn/limelight.vim', {'on':  'Limelight'}
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'junegunn/seoul256.vim'
  Plug 'junegunn/vader.vim',      {'on': 'Vader', 'for': 'vader'}
  Plug 'junegunn/vim-easy-align', {'on': ['<Plug>(EasyAlign)', 'EasyAlign']}
  Plug 'junegunn/vim-emoji'
  Plug 'junegunn/vim-fnr'
  Plug 'junegunn/vim-github-dashboard', {'on': ['GHDashboard', 'GHActivity']}
  Plug 'junegunn/vim-journal'
  Plug 'junegunn/vim-oblique'
  Plug 'junegunn/vim-peekaboo'
  Plug 'junegunn/vim-pseudocl'
  Plug 'junegunn/vim-ruby-x',  {'on': 'RubyX'}
  Plug 'kchmck/vim-coffee-script'
  Plug 'mbbill/undotree',      {'on': 'UndotreeToggle'}
  Plug 'pangloss/vim-javascript'
  Plug 'plasticboy/vim-markdown'
  Plug 'powerline/powerline',  {'rtp': 'powerline/bindings/vim/'}
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'tpope/vim-commentary', {'on': '<Plug>Commentary'}
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-tbone'
  Plug 'vim-scripts/ReplaceWithRegister'

  if s:darwin
    Plug 'zerowidth/vim-copy-as-rtf', {'on': 'CopyRTF'}
    Plug 'junegunn/vim-xmark'
  endif

  if v:version >= 703
    Plug 'junegunn/vim-after-object'
  endif

call plug#end()

filetype plugin on
filetype plugin indent on

set laststatus=2
set wrap
set visualbell noerrorbells
set history=1000
set undolevels=1000
set hidden
set hlsearch incsearch showmatch
set backupdir=~/.vim/tmp,. noswapfile
set pastetoggle=<F3>
set clipboard=unnamed

"Set command and input cursors
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Easy window handling
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-s> <C-w>s

" Diff of current state and current saved state
map <F2> :w !diff '%' -<CR>

" Sudo save
cmap w!! w !sudo tee % >/dev/null

",/ turns off hlsearch
nmap <silent> ,/ :nohlsearch<CR>

" Search for word under cursor
vnoremap // y/<C-R>"<CR>

" Remove trailing whitespace
autocmd BufWritePre *.py,*.yml,*.yaml :%s/\s\+$//e

"Html linting
let g:closetag_html_style=1
vmap ,x :%!tidy -q -i --show-errors 0<CR>
au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim

"Always change working dir to current file dir
autocmd BufEnter * silent! lcd %:p:h

" mouse
silent! set ttymouse=xterm2
set mouse=a

" 80 chars/line
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=80
endif

" Line number management
au FocusLost * :set number
autocmd InsertEnter * :set number
if exists('&relativenumber')
  au FocusGained * :set relativenumber
  autocmd InsertLeave * :set relativenumber
endif

" Spaces, not tabs
set expandtab tabstop=4 shiftwidth=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
colorscheme koehler

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gojo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} call Goyo()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'fancy'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Limelight
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" %< Where to truncate
" %n buffer number
" %F Full path
" %m Modified flag: [+], [-]
" %r Readonly flag: [RO]
" %y Type:          [vim]
" fugitive#statusline()
" %= Separator
" %-14.(...)
" %l Line
" %c Column
" %V Virtual column
" %P Percentage
" %#HighlightGroup#
set statusline=%<[%n]\ %F\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ %P
silent! if emoji#available()
  let s:ft_emoji = map({
    \ 'c':          'baby_chick',
    \ 'clojure':    'lollipop',
    \ 'coffee':     'coffee',
    \ 'cpp':        'chicken',
    \ 'css':        'art',
    \ 'eruby':      'ring',
    \ 'gitcommit':  'soon',
    \ 'haml':       'hammer',
    \ 'help':       'angel',
    \ 'html':       'herb',
    \ 'java':       'older_man',
    \ 'javascript': 'monkey',
    \ 'make':       'seedling',
    \ 'markdown':   'book',
    \ 'perl':       'camel',
    \ 'python':     'snake',
    \ 'ruby':       'gem',
    \ 'scala':      'barber',
    \ 'sh':         'shell',
    \ 'slim':       'dancer',
    \ 'text':       'books',
    \ 'vim':        'poop',
    \ 'vim-plug':   'electric_plug',
    \ 'yaml':       'yum',
    \ 'yaml.jinja': 'yum'
  \ }, 'emoji#for(v:val)')

  function! S_filetype()
    if empty(&filetype)
      return emoji#for('grey_question')
    else
      return get(s:ft_emoji, &filetype, '['.&filetype.']')
    endif
  endfunction

  function! S_modified()
    if &modified
      return emoji#for('kiss').' '
    elseif !&modifiable
      return emoji#for('construction').' '
    else
      return ''
    endif
  endfunction

  function! S_fugitive()
    if !exists('g:loaded_fugitive')
      return ''
    endif
    let head = fugitive#head()
    if empty(head)
      return ''
    else
      return head == 'master' ? emoji#for('crown') : emoji#for('dango').'='.head
    endif
  endfunction

  let s:braille = split('"⠉⠒⠤⣀', '\zs')
  function! Braille()
    let len = len(s:braille)
    let [cur, max] = [line('.'), line('$')]
    let pos  = min([len * (cur - 1) / max([1, max - 1]), len - 1])
    return s:braille[pos]
  endfunction

  hi def link User1 TablineFill
  let s:cherry = emoji#for('cherry_blossom')
  function! MyStatusLine()
    let mod = '%{S_modified()}'
    let ro  = "%{&readonly ? emoji#for('lock') . ' ' : ''}"
    let ft  = '%{S_filetype()}'
    let fug = ' %{S_fugitive()}'
    let sep = ' %= '
    let pos = ' %l,%c%V '
    let pct = ' %P '

    return s:cherry.' [%n] %F %<'.mod.ro.ft.fug.sep.pos.'%{Braille()}%*'.pct.s:cherry
  endfunction

  " Note that the "%!" expression is evaluated in the context of the
  " current window and buffer, while %{} items are evaluated in the
  " context of the window that the statusline belongs to.
  set statusline=%!MyStatusLine()
endif  
