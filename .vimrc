" @Author: Ryan Foo <rfoo@outlook.com>
" @Date: 2019-03-20 08:03:33
" @Last Modified by: Ryan Foo <rfoo@outlook.com>
" @Last Modified time: 2021-02-28 16:36:23

" Assumes use of VIM 8 Packages

" Enable syntax highlighting
syntax enable

" Native MacOS Terminal Emulator does not support italics. Use a different
" emulator if italics are desired.
"let g:gruvbox_italic=1
colorscheme gruvbox
"let g:gruvbox_italicize_comments=1
set background=dark

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
set nofoldenable

" Enable loading indent file for file types
filetype indent on
 
" Re-use same window and switch from an unsaved buffer without saving it first.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set copyindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor bee
" Enable use of the mouse for all modes
set mouse=a
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
set encoding=utf-8
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set tabstop=4
 
" Always set the current file directory as the local current directory
 autocmd BufEnter * silent! lcd %:p:h
  
" Enable folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
  
set history=1000         " remember more commands and search history
set undolevels=1000      " use many levels of undo
    
" Tabs in command line mode behave like bash
set wildmode=longest,list,full
set wildmenu
     
" Highlight the entire word when searching for it
set hlsearch
      
" Move line by line even when the line is wrapped
map j gj
map k gk
      
" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Must clone plugin repos to .vim directory
map <F6> :GitGutterToggle<CR>
map <F7> :NERDTreeToggle<CR>
map <F8> :NERDTreeRefresh<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" System clipboard
set clipboard=unnamed
map <C-x> :!pbcpy<CR>
map <C-c> :w !pbcopy<CR><CR> 

"----------------------------------------------------------
