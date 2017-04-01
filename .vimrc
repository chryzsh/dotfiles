"PLUGINS
call plug#begin('~/.vim/plugged')
    Plug 'chriskempson/base16-vim'
    Plug 'Townk/vim-autoclose'
    Plug 'tpope/vim-surround'
    Plug 'PotatoesMaster/i3-vim-syntax'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ervandew/supertab'
    Plug 'lervag/vimtex'
    Plug 'chrisbra/sudoedit.vim'
    Plug 'scrooloose/nerdtree'
call plug#end()

"INTERFACE
    set cursorline                              " hilight cursor line
    set number                                  " line numbers
    set scrolloff=3                             " lines above/below cursor
    set showcmd                                 " show cmds being typed
    set vb t_vb=                                " disable beep and flashing
    set wildignore=*.a,*.o,*.so,*.pyc,*.jpg,
                    \*.jpeg,*.png,*.gif,*.pdf,*.git,
                    \*.swp,*.swo                    " tab completion ignores
    set wildmenu                                " better auto complete
    set wildmode=longest,list                   " bash-like auto complete
"GENERAL SETTINGS
    set hidden
    set history=1000
    set iskeyword+=_,$,@,%,#
    set laststatus=2
    set linebreak
    set listchars=tab:>\
    set list
    set noshowmode
    set nostartofline
    set wrap
    set numberwidth=5
    set shortmess+=I
    set gdefault
    set incsearch
    set mouse=a
    set whichwrap=b,s,h,l,[,]
    set clipboard=unnamedplus
    set splitbelow
    set splitright

"COLORS
    filetype plugin indent on
    syntax on
    if filereadable(expand("~/.vimrc_background"))
          let base16colorspace=256
            source ~/.vimrc_background
    endif
"    colorscheme base16-flat
    augroup FileTypeRules
        autocmd!
        autocmd BufNewFile,BufRead *.md set ft=markdown tw=79
        autocmd BufNewFile,BufRead *.tex set ft=tex tw=79
        autocmd BufNewFile,BufRead *.txt set ft=sh tw=79
        augroup END
    set t_Co=256

"TEXT FORMATTING
    set autoindent
    set expandtab
    set ignorecase
    set shiftround
    set shiftwidth=4
    set smartcase
    set smarttab
    set softtabstop=4
    set tabstop=4

"FILES
    set autochdir
    set autoread
    set confirm
    set noautowrite

"KEYBINDINGS
    let mapleader=","
    noremap <leader>y "+y
    map <leader>cc :w !xsel -i -b<CR>
    map <leader>pb :r!xsel -b<CR>
    map <C-k> <C-u>
    noremap j gj
    noremap k gk
    map Q <nop>
    map q <nop>
    set pastetoggle=<F3>
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

"LIGHTLINE

"let g:lightline = {
"    \ 'colorscheme': 'base16',
"    \}

"AIRLINE
let g:airline= {
    \ 'colorscheme': 'onedark',
    \}

