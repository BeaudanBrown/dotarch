if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'                                         " Surround
Plug '/usr/bin/fzf',                                              " Fuzzy file search
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'                                         " Git wrapper
Plug 'mileszs/ack.vim'                                            " Ack search tool
Plug 'airblade/vim-gitgutter'                                     " Gitgutter
Plug 'vim-airline/vim-airline'                                    " Airline statusline
Plug 'leafgarland/typescript-vim'                                 " TypeScript highlighting
Plug 'morhetz/gruvbox'                                            " Gruvbox theme
Plug 'scrooloose/nerdtree'                                        " Nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'                                " Nerdtree git plugin
Plug 'machakann/vim-highlightedyank'                              " Highlight yanked text
Plug 'vim-scripts/ReplaceWithRegister'                            " Replace with register
Plug 'PotatoesMaster/i3-vim-syntax'                               " Syntax highlighting for i3
Plug 'tpope/vim-commentary'                                       " Comment selection with gc
Plug 'vifm/vifm.vim'                                              " Vim file manager
Plug 'kovetskiy/sxhkd-vim'                                        " Syntax highlighting for i3
call plug#end()

" Stop space from moving cursor
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>" " Assign space as leader
filetype plugin indent on           " Enabling filetype support provides filetype-specific indenting,
syntax on                           " Syntax highlighting, omni-completion and other useful settings.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disables automatic commenting on newline:

" Basics
  set nocompatible
  set bg=light
  set mouse=a                    " Enable mouse
  set clipboard+=unnamedplus     " Default to system clipboard
  set backspace=indent,eol,start " Proper backspace behavior
  set encoding=utf-8             " Use utf-8 encoding
  set tabstop=2                  " The width of a TAB is set to 2
  set shiftwidth=2               " Indents will have a width of 2
  set softtabstop=2              " Sets the number of columns for a TAB
  set expandtab                  " Expand TABs to spaces
  set autoindent                 " Minimal automatic indenting for any filetype
  set smartindent                " Better autoindent e.g. extra indent after parens
  set incsearch                  " Incremental search, hit `<CR>` to stop
  set number relativenumber      " Relative line numbers as default
  set splitbelow splitright      " Splits open at the bottom and right
  set wildmenu                   " Great command-line completion, use `<Tab>` to move around
  set ignorecase                 " Case insensitive search default
  set smartcase                  " Case sensitive search if capital in search string
  set hlsearch                   " Highlight search matches
  set showmatch                  " Highlight matching parens etc
  set updatetime=100             " Set refresh to 100ms
  set noerrorbells               " No beeping
  set undofile                   " Maintain undo history between sessions
  set undodir=~/.vim/undodir//   " Store undofiles in single directory
  set noswapfile                 " Disable swapfiles
  set clipboard+=unnamedplus     " Default to system clipboard
  set inccommand=nosplit         " Show substitute command in real time
  set formatoptions-=cro         " Disable automatic commenting
  set number relativenumber      " Relative line numbers as default
  set guicursor=a:blinkwait500   " Cursor blink wait
  set guicursor=a:blinkon1000    " Cursor blink on time
  set guicursor=a:blinkoff500    " Cursor blink off time
  set signcolumn=yes             " Always have space for the git sign

" Automatically reload file on change
  set autoread
  au FocusGained,BufEnter * :silent! !
  au FocusLost,WinLeave * :silent! noautocmd w

" Display trailing whitespace as ~
  set list
  set listchars=tab:>-,trail:~,extends:>,precedes:<

" Keybindings
" Leader leader to swap to most recent buffer
  nnoremap <leader><leader> <C-^>
" Leader f to search all
  nnoremap <leader>f :Ag 
" Leader q to quit vim
  nnoremap <leader>q :qall<CR>
" Leader l to search buffers
  nnoremap <leader>l :Lines<CR>
" Leader b to show buffers
  nnoremap <leader>b :Buffers<CR>
" Leader s to save
  nnoremap <leader>s :w<CR>
" Change to abyss buffer
  nnoremap c "_c
  vnoremap c "_c
" Ctrl + direction to move between splits in any mode
  tnoremap <A-h> <C-\><C-N><C-W>h
  tnoremap <A-j> <C-\><C-N><C-W>j
  tnoremap <A-k> <C-\><C-N><C-W>k
  tnoremap <A-l> <C-\><C-N><C-W>l
  inoremap <A-h> <C-\><C-N><C-W>h
  inoremap <A-j> <C-\><C-N><C-W>j
  inoremap <A-k> <C-\><C-N><C-W>k
  inoremap <A-l> <C-\><C-N><C-W>l
  nnoremap <A-j> <C-W>j
  nnoremap <A-k> <C-W>k
  nnoremap <A-h> <C-W>h
  nnoremap <A-l> <C-W>l
" Centre screen after paging up or down
  nnoremap <C-d> <C-d>zz
  nnoremap <C-u> <C-u>zz
" Make 'Y' yank from cursor to end of line
  nnoremap Y y$
" Clear search with <leader>/
  nnoremap <silent> <leader>/ :nohlsearch<CR>
" Leader = to resize splits evenly
  nnoremap <leader>= <C-w>=
" Map leader-esc to exit terminal mode
  tnoremap <leader><Esc> <C-\><C-n>
" Ctrl w to close current buffer but keep split
  nnoremap <silent> <C-w> :call CloseBuffer()<cr>
  tnoremap <silent> <C-w> <C-\><C-N>:call CloseBuffer()<cr>y
  inoremap <silent> <C-w> <C-\><C-N>:call CloseBuffer()<cr>
" Toggle 'default' terminal
  nnoremap <A-CR> :call TermToggle(30)<CR>
  inoremap <A-CR> <C-\><C-N>:call TermToggle(30)<CR>
  tnoremap <A-CR> <C-\><C-N>:call TermToggle(30)<CR>
" Leader t to open terminal in vertical split
  nnoremap <leader>t :vs term://bash<CR>
" Replace all is aliased to S.
  nnoremap S :%s//g<Left><Left>

" Nerd tree setup
  nnoremap <leader>e :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fzf setup
  function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
  endfunction
  command! ProjectFiles execute 'Files' s:find_git_root()
  nnoremap <c-P> :ProjectFiles<CR>
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" Highlighted yank setup
  if !exists('##TextYankPost')
    map y <Plug>(highlightedyank)
  endif
  let g:highlightedyank_highlight_duration = 200

" Always enter terminal in insert mode
  if has('nvim')
    au BufEnter,BufNew,TermOpen * if &buftype == 'terminal' | :startinsert | endif
  endif

" Use ag instead of grep and Ack
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" Use actual tab chars in Makefiles.
  autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" Source vim configuration upon save
  augroup vimrc
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
  augroup END

" Hybrid line numbers, relative in visual and absolute other times
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END

" Groff filetypes
  autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff

" When shortcut files are updated, renew bash and vifm configs with new material:
  autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts

" Update binds when sxhkdrc is updated.
  autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Run xrdb whenever Xdefaults or Xresources are updated.
  autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Close buffer but keep splits
function! CloseBuffer()
    let curBuf = bufnr('%')
    let curTab = tabpagenr()
    exe 'bnext'

    " If in last buffer, create empty buffer
    if curBuf == bufnr('%')
        exe 'enew'
    endif

    " Loop through tabs
    for i in range(tabpagenr('$'))
        " Go to tab (is there a way with inactive tabs?)
        exe 'tabnext ' . (i + 1)
        " Store active window nr to restore later
        let curWin = winnr()
        " Loop through windows pointing to buffer
        let winnr = bufwinnr(curBuf)
        while (winnr >= 0)
            " Go to window and switch to next buffer
            exe winnr . 'wincmd w | bnext'
            " Restore active window
            exe curWin . 'wincmd w'
            let winnr = bufwinnr(curBuf)
        endwhile
    endfor

    " Close buffer, restore active tab
    exe 'bd' . curBuf
    exe 'tabnext ' . curTab
endfunction

" Toggle terminal
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        " Window is visible, hide it
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set signcolumn=no
        endtry
        let g:term_win = win_getid()
    endif
endfunction
