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
Plug 'machakann/vim-highlightedyank'                              " Highlight yanked text
Plug 'vim-scripts/ReplaceWithRegister'                            " Replace with register
Plug 'tpope/vim-commentary'                                       " Comment selection with gc
Plug 'vifm/vifm.vim'                                              " Vim file manager
Plug 'kovetskiy/sxhkd-vim'                                        " Syntax highlighting for sxhkd
Plug 'PotatoesMaster/i3-vim-syntax'                               " Syntax highlighting for i3
Plug 'pangloss/vim-javascript'                                    " Syntax highlighting javascript
Plug 'peitalin/vim-jsx-typescript'                                " Syntax highlighting for typescript
Plug 'kana/vim-textobj-user'                                      " Alow for easy text object creation
Plug 'kana/vim-textobj-entire'                                    " Add ae text object for entire file
Plug 'chrisbra/Colorizer'                                         " Highlight hex colours
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }   " Async autocomplete
Plug 'OmniSharp/omnisharp-vim'                                    " C# autocomplete
call plug#end()

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disables automatic commenting on newline:
let mapleader = "\<Space>"                " Assign space as leader
filetype plugin indent on                 " Enabling filetype support provides filetype-specific indenting,
syntax on                                 " Syntax highlighting, omni-completion and other useful settings.
highlight Search ctermfg=Black            " Always use black for search text
highlight Visual ctermfg=Black            " Always use black for visually selected text

" Basics
  set nocompatible
  set bg=light
  set hidden                     " Allow to hide buffers instead of closing them
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
  set wildmode=list:longest      " Great command-line completion, use `<Tab>` to move around
  set wildignorecase             " Case insensitive wild mode
  set ignorecase                 " Case insensitive search default
  set smartcase                  " Case sensitive search if capital in search string
  set hlsearch                   " Highlight search matches
  set showmatch                  " Highlight matching parens etc
  set updatetime=100             " Set refresh to 100ms
  set noerrorbells               " No beeping
  set undofile                   " Maintain undo history between sessions
  set undodir=~/.config/nvim/undodir//   " Store undofiles in single directory
  set directory=~/.config/nvim/swp//   " Store swapfiles in single directory
  set clipboard+=unnamedplus     " Default to system clipboard
  set inccommand=nosplit         " Show substitute command in real time
  set formatoptions-=cro         " Disable automatic commenting
  set number relativenumber      " Relative line numbers as default
  set signcolumn=yes             " Always have space for the git sign
  set nrformats=                 " Treat all numbers as decimal for <C-a> etc
  set history=200                " Save the last 200 ex commands in the history

" Automatically reload file on change
  set autoread
  au FocusGained,BufEnter * :silent! !
  au FocusLost,WinLeave * :silent! noautocmd w

" Display trailing whitespace as ~
  set list
  set listchars=tab:>-,trail:~,extends:>,precedes:<

" Keybindings
  " Stop space from moving cursor
  nnoremap <SPACE> <Nop>
" Leader leader to swap to most recent buffer
  nnoremap <leader><leader> <C-^>
" Leader f to search all
  nnoremap <leader>f :Ag 
" Leader q to quit the current window
  nnoremap <leader>q :q<CR>
" Leader l to search buffers
  nnoremap <leader>l :Lines<CR>
" Leader b to show buffers
  nnoremap <leader>b :Buffers<CR>
" Leader s to save
  nnoremap <leader>s :w<CR>
" Leader S to substitute all words under cursor
  nnoremap <leader>S :%s/\(<c-r>=expand("<cword>")<cr>\)//g<Left><Left>
" Leader ; to append semicolon
  nnoremap <leader>; A;<Esc>
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
" Have movement keys scroll over wrapped lines
  nnoremap j gj
  nnoremap k gk
" Centre screen after paging up or down
  nnoremap <C-d> <C-d>zz
  nnoremap <C-u> <C-u>zz
" Make 'Y' yank from cursor to end of line
  nnoremap Y y$
" Clear search with <leader>/
  nnoremap <silent> <leader>/ :noh<CR>
" Leader = to resize splits evenly
  nnoremap <leader>= <C-w>=
" Map leader-esc to exit terminal mode
  tnoremap <leader><Esc> <C-\><C-n>
" Ctrl w to close current buffer but keep split
  " nnoremap <silent> <C-w> :call CloseBuffer()<cr>
  " tnoremap <silent> <C-w> <C-\><C-N>:call CloseBuffer()<cr>y
  " inoremap <silent> <C-w> <C-\><C-N>:call CloseBuffer()<cr>
" Toggle 'default' terminal
  nnoremap <A-CR> :call ChooseTerm("term-slider", 0)<CR>
  inoremap <A-CR> <C-\><C-N>:call ChooseTerm("term-slider", 0)<CR>
  tnoremap <A-CR> <C-\><C-N>:call ChooseTerm("term-slider", 0)<CR>
" Paste on newline
  nnoremap <leader>p :pu<CR>==$
" Leader t to open terminal in vertical split
  nnoremap <leader>t :vs term://bash<CR>
" Replace all is aliased to S.
  nnoremap S :%s//g<Left><Left>
" Use <C-p> and <C-p> for up and down in command line mode
  cnoremap <C-p> <Up>
  cnoremap <C-n> <Down>
" Use <Leader>c for ciw with repeatability
  nnoremap <silent> <Leader>c :let @/=expand('<cword>')<cr>cgn

" Deoplete setup
  let g:deoplete#enable_at_startup = 1
" Tab completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Nerd tree setup
  nnoremap <leader>e :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" gitgutter setup
  let g:gitgutter_realtime=1

" OmniSharp setup
  let g:OmniSharp_server_stdio = 1

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
    autocmd! BufWritePost $MYVIMRC source % | redraw
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

" Toggle 'default' terminal
function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
        " pane is visible
        if a:slider > 0
            :exe pane . "wincmd c"
        else
            :exe "e #"
            if exists("w:altbuf")
                let @# = w:altbuf
            endif
        endif
    elseif buf > 0
        " buffer is not in pane
        let w:altbuf = bufnr(@#)
        if a:slider
            :exe "botright split"
        endif
        :exe "buffer " . a:termname
    else
        " buffer is not loaded, create
        let w:altbuf = bufnr(@#)
        if a:slider
            :exe "botright split"
        endif
        :terminal
        :exe "f " a:termname
        if w:altbuf != @#
            let @# = w:altbuf
        endif
    endif
endfunction

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif
