if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'                                         " Surround
Plug 'junegunn/fzf.vim'                                           " Fuzzy finder
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
Plug 'purescript-contrib/purescript-vim'                          " Syntax highlighting for purescript
Plug 'kana/vim-textobj-user'                                      " Alow for easy text object creation
Plug 'kana/vim-textobj-entire'                                    " Add ae text object for entire file
Plug 'chrisbra/Colorizer'                                         " Highlight hex colours
Plug 'neoclide/coc.nvim', {'branch': 'release'}                   " Async autocomplete
Plug 'OmniSharp/omnisharp-vim'                                    " C# autocomplete
Plug 'nickspoons/vim-sharpenup'                                   " OmniSharp default
Plug 'lambdalisue/gina.vim'                                       " Vim git plugin
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
call plug#end()

autocmd VimResized * wincmd =
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disables automatic commenting on newline:
let mapleader = "\<Space>"                " Assign space as Leader
filetype plugin indent on                 " Enabling filetype support provides filetype-specific indenting,
syntax on                                 " Syntax highlighting, omni-completion and other useful settings.
highlight Search ctermfg=Black            " Always use black for search text
highlight Visual ctermfg=Black            " Always use black for visually selected text

" Basics
set nocompatible
set bg=dark
set hidden                              " Allow to hide buffers instead of closing them
set mouse=a                             " Enable mouse
set clipboard+=unnamedplus              " Default to system clipboard
set backspace=indent,eol,start          " Proper backspace behavior
set encoding=utf-8                      " Use utf-8 encoding
set tabstop=4                           " The width of a TAB is set to 2
set shiftwidth=4                        " Indents will have a width of 2
set softtabstop=4                       " Sets the number of columns for a TAB
set expandtab                           " Expand TABs to spaces
set autoindent                          " Minimal automatic indenting for any filetype
set smartindent                         " Better autoindent e.g. extra indent after parens
set incsearch                           " Incremental search, hit `<CR>` to stop
set number                              " Absolute line numbers as default
set splitbelow splitright               " Splits open at the bottom and right
set wildmode=list:longest               " Great command-line completion, use `<Tab>` to move around
set wildignorecase                      " Case insensitive wild mode
set ignorecase                          " Case insensitive search default
set smartcase                           " Case sensitive search if capital in search string
set hlsearch                            " Highlight search matches
set showmatch                           " Highlight matching parens etc
set updatetime=100                      " Set refresh to 100ms
set noerrorbells                        " No beeping
set undofile                            " Maintain undo history between sessions
set undodir=~/.config/nvim/undodir//    " Store undofiles in single directory
set directory=~/.config/nvim/swp//      " Store swapfiles in single directory
set clipboard+=unnamedplus              " Default to system clipboard
set inccommand=nosplit                  " Show substitute command in real time
set formatoptions-=cro                  " Disable automatic commenting
set signcolumn=yes                      " Always have space for the git sign
set nrformats=                          " Treat all numbers as decimal for <C-a> etc
set history=1000                        " Save the last 1000 ex commands in the history
set diffopt=vertical                    " Show diffs with vertical splits
set fillchars+=vert:\                   " No line through middle of splits

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
" Leader Leader to swap to most recent buffer
nnoremap <Leader><Leader> <C-^>
" Leader f to search all
nnoremap <Leader>f :RG<CR>
" Leader q to quit the current window
nnoremap <Leader>q :q<CR>
" Leader d to quit the current buffer but keep split
nnoremap <silent> <Leader>d :call CloseBuffer()<cr>
" Leader l to search buffers
nnoremap <Leader>l :Lines<CR>
" Leader b to show buffers
nnoremap <Leader>b :Buffers<CR>
" Leader s to save
nnoremap <Leader>s :w<CR>
" Leader S to substitute all words under cursor
nnoremap <Leader>S :%s/\(<c-r>=expand("<cword>")<cr>\)//g<Left><Left>
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
nnoremap <a-left> 3<c-w><
nnoremap <a-right> 3<c-w>>
nnoremap <a-up> 3<c-w>+
nnoremap <a-down> 3<c-w>-
" Have movement keys scroll over wrapped lines
nnoremap j gj
nnoremap k gk
" Centre screen after paging up or down
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" Make 'Y' yank from cursor to end of line
nnoremap Y y$
" Clear search with <Leader>/
nnoremap <silent> <Leader>/ :noh<CR>
" Leader = to resize splits evenly
nnoremap <Leader>= <C-w>=
" Map <C-q> to exit terminal mode
tnoremap <C-q> <C-\><C-n>
" Paste on newline
nnoremap <Leader>p :pu<CR>==$
" Open terminal in vertical split
nnoremap <Leader>t :vs term://zsh<CR>
" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>
" Use <C-p> and <C-p> for up and down in command line mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" Use <Leader>C for ciw with repeatability
nnoremap <silent> <Leader>C :let @/=expand('<cword>')<cr>"_cgn
" Use <C-k> and <C-j> to shift selection up or down
nnoremap <C-k> :move -2<CR>
nnoremap <C-j> :move +1<CR>
vnoremap <C-k> :move '<-2<CR>gv=gv
vnoremap <C-j> :move '>+1<CR>gv=gv
" Repeat last used macro
nnoremap Q @@
" Don't put s changes in register
nnoremap s "_s
nnoremap <silent> <A-CR> :call toggleterm#Toggle()<Enter>
inoremap <silent> <A-CR> <C-\><C-n>:call toggleterm#Toggle()<Enter>
tnoremap <silent> <A-CR> <C-\><C-n>:call toggleterm#Toggle()<Enter>


" TODO: Submode setup
let g:submode_timeout = 0
let g:submode_keyseqs_to_leave = []

call submode#enter_with('diffMode', 'n', '', '<leader>gj', ':GitGutterNextHunk<cr>zz')
call submode#enter_with('diffMode', 'n', '', '<leader>gk', ':GitGutterPrevHunk<cr>zz')
call submode#leave_with('diffMode', 'n', '', '<Esc>')
call submode#map('diffMode', 'n', '', 'j', ':GitGutterNextHunk<cr>zz')
call submode#map('diffMode', 'n', '', 'k', ':GitGutterPrevHunk<cr>zz')

" Coc setup
" ====================================================================================
call coc#add_extension('coc-snippets', 'coc-json', 'coc-css', 'coc-vimlsp')

let g:markdown_fenced_languages = ['vim', 'help']

hi Pmenu ctermfg=white ctermbg=8
hi PmenuSbar ctermfg=white ctermbg=0
hi CocUnderline cterm=NONE
hi CocWarningSign ctermfg=3

" Show either vim help or call coc doHover
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ "\<TAB>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <Leader>re :CocRestart<CR><CR>
nnoremap <expr><C-f> coc#util#float_scroll(1)
nnoremap <expr><C-b> coc#util#float_scroll(0)
nmap <silent> <Leader>cj <Plug>(coc-diagnostic-next)
nmap <silent> <Leader>ck <Plug>(coc-diagnostic-prev)
nmap <Leader>cd <Plug>(coc-diagnostic-info)
nmap <Leader>cf  <Plug>(coc-fix-current)
nmap <Leader>cn  <Plug>(coc-rename)
nmap gd <Plug>(coc-definition)
inoremap <silent><expr> <c-space> coc#refresh()

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Markdown Preview setup
" ====================================================================================
nnoremap <Leader>md :MarkdownPreview<CR>

" Vifm setup
" ====================================================================================
let g:vifm_embed_split = 1
let g:vifm_replace_netrw = 1
let g:vifm_exec_args = "-c \":only\""
nnoremap <Leader>e :topleft vertical 40Vifm<CR>

" Gina setup
" ====================================================================================
nnoremap <Leader>gs :new \| Gina status<cr>
nnoremap <Leader>gc :Gina commit<cr>
nnoremap <Leader>gd :Gina diff<cr>
nnoremap <Leader>gb :Gina blame<cr>
nnoremap <Leader>gl :Gina log<cr>
nnoremap <Leader>gp :Gina push<cr>
nnoremap <Leader>ga :Gina patch<cr>

hi DiffAdd ctermfg=0 ctermbg=2
hi DiffChange ctermfg=0 ctermbg=4
hi DiffDelete ctermfg=0 ctermbg=1

hi DiffAdded ctermfg=10
hi DiffChanged ctermfg=4
hi DiffRemoved ctermfg=9
hi Error ctermfg=0 ctermbg=9

augroup diff_autocommands
  autocmd FilterWritePre * if &diff|
        \ nmap <Leader>l <Plug>(gina-diffget-r)|
        \ nmap <Leader>h <Plug>(gina-diffget-l)|
        \ nnoremap <Leader>gj ]czz|
        \ nnoremap <Leader>gk [czz|
        \ nnoremap q :tabclose<CR>|
        \ endif
  autocmd WinEnter * if &diff==0|
        \ if maparg('<Leader>l','n') !=# ''|
            \ nunmap <Leader>l|
            \ nnoremap <Leader>l :Lines<CR>|
        \ endif|
        \ if maparg('<Leader>h','n') !=# ''|
            \ nunmap <Leader>h|
        \ endif|
        \ if maparg('<Leader>gj','n') !=# ''|
            \ nunmap <Leader>gj|
        \ endif|
        \ if maparg('<Leader>gk','n') !=# ''|
            \ nunmap <Leader>gk|
        \ endif|
        \ if maparg('q','n') !=# ''|
            \ nunmap q|
        \ endif|
    \ endif
augroup END

" gitgutter setup
" ====================================================================================
hi! GitGutterAdd ctermfg=10 cterm=bold
hi! GitGutterChange ctermfg=4 cterm=bold
hi! GitGutterDelete ctermfg=9 cterm=bold
let g:gitgutter_realtime=1

" OmniSharp and sharpenup setup
" ====================================================================================
let g:OmniSharp_server_stdio = 1
let g:sharpenup_map_prefix = "\<Leader>,"

" fzf setup
" ====================================================================================
nnoremap <Leader>; :History:<CR>

function! s:FindRoot()
    let gitRoot = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    if gitRoot != $HOME
        " We are in a git folder
        return gitRoot
    endif
    " We are in a non-git folder, which will always find $HOME
    if len(argv()) > 0
        return fnamemodify(argv()[0], ':p:h')
    endif
    return getcwd()
endfunction

let root = s:FindRoot()
command! ProjectFiles execute 'Files' root
nnoremap <c-P> :ProjectFiles<CR>
let s:ignoredFiletypes = ['asset','meta','mat','prefab','unity','physicMaterial','inputactions','png','webp']
if root == $HOME
    let $FZF_DEFAULT_COMMAND = "rg --files --no-ignore-vcs --hidden -g '!\.git/*'"
else
    let $FZF_DEFAULT_COMMAND = "rg --files --ignore-vcs --hidden -g '!\.git/*'"
endif
for type in s:ignoredFiletypes
    let $FZF_DEFAULT_COMMAND .= " -g '!*." . type . "'"
endfor

function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case'
    for type in s:ignoredFiletypes
        let command_fmt .= " -g '!*." . type . "'"
    endfor
    let command_fmt .= ' %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Highlighted yank setup
" ====================================================================================
if !exists('##TextYankPost')
    map y <Plug>(highlightedyank)
endif
let g:highlightedyank_highlight_duration = 200

if has('nvim')
    " Always enter terminal in insert mode
    au BufEnter,BufNew,TermOpen * if &buftype == 'terminal' | :startinsert | :set nonumber | endif
endif

" Use rg instead of grep and Ack
if executable('ag')
    set grepprg=rg
    let g:ackprg = 'rg --column'
endif

" Use actual tab chars in Makefiles.
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

" Source vim configuration upon save
augroup vimrc
    autocmd! BufWritePost $MYVIMRC source $MYVIMRC | nohl | redraw
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
