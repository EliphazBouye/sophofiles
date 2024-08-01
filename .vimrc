vim9script

filetype plugin indent on
syntax on

set hidden confirm
set autoindent shiftwidth=4 softtabstop=-1 expandtab
set ttimeout timeoutlen=25
set virtualedit=block
set ruler
set display=lastline smoothscroll
set hlsearch incsearch ignorecase smartcase
set wildmenu wildoptions=pum,fuzzy pumheight=8
set wildignore=*.o,*.obj,*.bak,*.exe,*.swp,tags
set completeopt=menu,popup,fuzzy completepopup=highlight:Pmenu
set number relativenumber cursorline cursorlineopt=both signcolumn=number
set nowrap breakindent breakindentopt=sbr,list:-1 linebreak nojoinspaces
set background=dark
colorscheme retrobox
set fileformat=unix fileformats=unix
set backspace=indent,eol,start
set fillchars=vert:│
set scrolloff=4 sidescroll=2
set list listchars=tab:›\ ,nbsp:␣,trail:·,extends:…,precedes:…
set nostartofline
set nospell spelllang=en,fr
set nrformats=alpha,bin,hex,unsigned
set history=200
set mouse=a
set path=.,,

if executable('rg')
    set grepprg=rg\ H\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

set nobackup
set noswapfile
set undofile
