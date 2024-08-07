if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

" TODO: Coc extensions
function! GetCocExts(info)
    if a:info.status == 'installed'
        silent !python3 -m pip install --user --upgrade pynvim
        silent !npm i -g spago purescript purescript-language-server
        call coc#add_extension('coc-snippets', 'coc-json', 'coc-css', 'coc-vimlsp')
    endif
endfunction

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'                                                       " Surround
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                                         " Fuzzy finder
Plug 'airblade/vim-gitgutter'                                                   " Gitgutter
Plug 'vim-airline/vim-airline'                                                  " Airline statusline
Plug 'machakann/vim-highlightedyank'                                            " Highlight yanked text
Plug 'vim-scripts/ReplaceWithRegister'                                          " Replace with register
Plug 'tpope/vim-commentary'                                                     " Comment selection with gc
Plug 'vifm/vifm.vim'                                                            " Vim file manager
Plug 'kovetskiy/sxhkd-vim'                                                      " Syntax highlighting for sxhkd
Plug 'PotatoesMaster/i3-vim-syntax'                                             " Syntax highlighting for i3
Plug 'pangloss/vim-javascript'                                                  " Syntax highlighting javascript
Plug 'peitalin/vim-jsx-typescript'                                              " Syntax highlighting for typescript
Plug 'kana/vim-textobj-user'                                                    " Alow for easy text object creation
Plug 'kana/vim-textobj-entire'                                                  " Add ae text object for entire file
Plug 'chrisbra/Colorizer'                                                       " Highlight hex colours
Plug 'neoclide/coc.nvim', {'branch': 'release'}                                 " Async autocomplete
Plug 'OmniSharp/omnisharp-vim'                                                  " C# autocomplete
Plug 'nickspoons/vim-sharpenup'                                                 " OmniSharp default
Plug 'lambdalisue/gina.vim'                                                     " Vim git plugin
Plug 'unblevable/quick-scope'                                                   " Highlight f/t targets
Plug 'jdonaldson/vaxe'                                                          " Syntax/IDE type support for Haxe
Plug 'tpope/vim-obsession'                                                      " Restore session when opening vim
Plug 'dalejung/vim-tmux-navigator', {'branch': 'select_pane_no_wrap'}           " Tmux navigation integration
Plug 'purescript-contrib/purescript-vim'                                        " Surround
Plug 'prisma/vim-prisma'                                                        " Prisma syntax highlighting
Plug 'euclidianAce/BetterLua.vim'                                               " Syntax highlighting for Lua
Plug 'jalvesaq/Nvim-R'                                                          " RStudio like features in nvim
Plug 'jalvesaq/cmp-nvim-r'                                                      " Omni completion for R
Plug 'madox2/vim-ai'                                                            " Allows ChatGPT interaction through vim
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'                                                         " Cmp completion engine
call plug#end()

let mapleader = "\<Space>"                " Assign space as Leader
filetype plugin indent on                 " Enabling filetype support provides filetype-specific indenting,

highlight DiffAdd ctermfg=0 ctermbg=2
highlight DiffChange ctermfg=0 ctermbg=4
highlight DiffAdded ctermfg=10
highlight DiffChanged ctermfg=4
highlight DiffRemoved ctermfg=9
highlight Error ctermfg=0 ctermbg=9
highlight IncSearch cterm=bold ctermbg=10 ctermfg=0
highlight Search ctermbg=5 ctermfg=0 cterm=bold
highlight Visual ctermbg=8
highlight CursorLine cterm=NONE ctermbg=8
highlight Pmenu ctermfg=white ctermbg=8
highlight PmenuSbar ctermfg=white ctermbg=0
highlight! CocUnderline cterm=NONE
highlight! CocErrorHighlight cterm=NONE
highlight! CocWarningHighlight cterm=NONE
highlight! CocWarningSign ctermfg=3

" Basics
set nocompatible
set autowrite
set completeopt=menu
set bg=dark
set hidden                              " Allow to hide buffers instead of closing them
set mouse=a                             " Enable mouse
set clipboard+=unnamedplus              " Default to system clipboard
set backspace=indent,eol,start          " Proper backspace behavior
set encoding=utf-8                      " Use utf-8 encoding
set tabstop=2                           " The width of a TAB is set to 2
set shiftwidth=2                        " Indents will have a width of 2
set softtabstop=2                       " Sets the number of columns for a TAB
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
set inccommand=nosplit                  " Show substitute command in real time
set formatoptions-=cro                  " Disable automatic commenting
set signcolumn=yes                      " Always have space for the git sign
set nrformats=                          " Treat all numbers as decimal for <C-a> etc
set history=1000                        " Save the last 1000 ex commands in the history
set diffopt=vertical                    " Show diffs with vertical splits
set fillchars+=vert:\                   " No line through middle of splits
set autoread                            " Auto load buffers on external change
set previewheight=40
" Display trailing whitespace as ~
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

" Keybindings
nnoremap <leader><CR> :AIChat<CR>
nnoremap <leader>gi :e ~/.config/nvim/init.vim<cr>
" Stop space from moving cursor
nnoremap <SPACE> <Nop>
" Leader Leader to swap to most recent buffer
nnoremap <Leader><Leader> <C-^>
" Leader q to quit the current window
nnoremap <Leader>q :q<CR>
" Leader d to quit the current buffer but keep split
nnoremap <silent> <Leader>d :call CloseBuffer()<cr>
" Leader s to save
nnoremap <Leader>s :w<CR>
" Leader S to substitute all words under cursor
nnoremap <Leader>S :%s/\(<c-r>=expand("<cword>")<cr>\)//g<Left><Left>
vmap <Leader>S "ay:%s/<c-r>a//g<Left><Left>
" Change to abyss buffer
nnoremap c "_c
vnoremap c "_c
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
vnoremap S :s//g<Left><Left>
" Use <C-p> and <C-p> for up and down in command line mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" Use <Leader>C for ciw with repeatability
nnoremap <silent> <Leader>C :let @/=expand('<cword>')<cr>"_cgn
" Use <C-k> and <C-j> to shift selection up or down
nnoremap <C-k> :move -2<CR>==
nnoremap <C-j> :move +1<CR>==
vnoremap <C-k> :move '<-2<CR>gv=gv
vnoremap <C-j> :move '>+1<CR>gv=gv
" Repeat last used macro
nnoremap Q @@
" Don't put s changes in register
nnoremap s "_s
" Expand brackets
inoremap (<CR> (<CR>)<C-c>O
inoremap {<CR> {<CR>}<C-c>O
inoremap [<CR> [<CR>]<C-c>O
" Centre screen after jump
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" nvim-R setup
" nnoremap <C-CR> <Plug>R
let R_assign = 0


" vim-ai setup
let s:initial_chat_prompt =<< trim END
>>> system

You are a general assistant.
If you attach a code block add syntax type after ``` to enable syntax highlighting.
END

let g:vim_ai_chat = {
\  "options": {
\    "model": "gpt-3.5-turbo",
\    "max_tokens": 1000,
\    "temperature": 1,
\    "request_timeout": 20,
\    "selection_boundary": "#####",
\    "initial_prompt": s:initial_chat_prompt,
\  },
\  "ui": {
\    "code_syntax_enabled": 1,
\    "populate_options": 0,
\    "open_chat_command": "preset_right",
\    "scratch_buffer_keep_open": 0,
\    "paste_mode": 1,
\  },
\}

" Quickscope setup
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=80
let g:qs_buftype_blacklist = ['terminal', 'nofile']
highlight QuickScopePrimary ctermfg=3 cterm=underline
highlight QuickScopeSecondary ctermfg=26 cterm=underline

" vim-tmux-navigator setup
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_save_on_switch = 1
let g:tmux_navigator_no_mappings = 1 "use custom mappings below

" Meta + direction to move between splits in any mode.
" On Mac, make sure "Use Option as Meta key" is enabled.
tnoremap <A-h> <C-\><C-N>:TmuxNavigateLeft<CR>
tnoremap <A-j> <C-\><C-N>:TmuxNavigateDown<CR>
tnoremap <A-k> <C-\><C-N>:TmuxNavigateUp<CR>
tnoremap <A-l> <C-\><C-N>:TmuxNavigateRight<CR>

inoremap <A-h> <C-\><C-N>:TmuxNavigateLeft<CR>
inoremap <A-j> <C-\><C-N>:TmuxNavigateDown<CR>
inoremap <A-k> <C-\><C-N>:TmuxNavigateUp<CR>
inoremap <A-l> <C-\><C-N>:TmuxNavigateRight<CR>

nnoremap <A-h> :TmuxNavigateLeft<CR>
nnoremap <A-j> :TmuxNavigateDown<CR>
nnoremap <A-k> :TmuxNavigateUp<CR>
nnoremap <A-l> :TmuxNavigateRight<CR>

" TODO: Submode setup
let g:submode_timeout = 0
let g:submode_keyseqs_to_leave = []

function! DiffModeEdit()
    do CursorMoved
    let g:gitgutter_preview_win_floating=0
    call gitgutter#hunk#preview()
    wincmd P
    let g:gitgutter_preview_win_floating=1
endfunction

function! DiffModeUndo()
    call gitgutter#hunk#undo()
    do CursorMoved
endfunction

function! DiffModeStage()
    call gitgutter#hunk#stage()
    do CursorMoved
endfunction

function! CocModeNext()
    call CocAction('diagnosticNext')
    do CursorMoved
endfunction

function! CocModePrev()
    call CocAction('diagnosticPrevious')
    do CursorMoved
endfunction

call submode#enter_with('diffMode', 'n', '', '<leader>gj')
call submode#enter_with('diffMode', 'n', '', '<leader>gk')
call submode#leave_with('diffMode', 'n', '', '<Esc>')
call submode#map('diffMode', 'n', '', 'j', ':GitGutterNextHunk<cr>zz:GitGutterPreviewHunk<cr>')
call submode#map('diffMode', 'n', '', 'k', ':GitGutterPrevHunk<cr>zz:GitGutterPreviewHunk<cr>')
call submode#map('diffMode', 'n', '', 'u', ':call DiffModeUndo()<cr>:GitGutterNextHunk<cr>zz:GitGutterPreviewHunk<cr>')
call submode#map('diffMode', 'n', '', 'e', ':call DiffModeEdit()<cr><Plug>(submode-leave:diffMode)')
call submode#map('diffMode', 'n', '', 'y', ':call DiffModeStage()<cr>:GitGutterNextHunk<cr>zz:GitGutterPreviewHunk<cr>')
map <Plug>(submode-before-entering:diffMode:with:<leader>gj) :GitGutterNextHunk<cr>zz:GitGutterPreviewHunk<cr>
map <Plug>(submode-before-entering:diffMode:with:<leader>gk) :GitGutterPrevHunk<cr>zz:GitGutterPreviewHunk<cr>
map <Plug>(submode-leave:diffMode) :do CursorMoved<cr>

call submode#enter_with('cocMode', 'n', '', '<Leader>cj')
call submode#enter_with('cocMode', 'n', '', '<Leader>ck')
call submode#leave_with('cocMode', 'n', '', '<Esc>')
call submode#map('cocMode', 'n', '', 'j', ":call CocModeNext()<CR>zz:call CocAction('diagnosticInfo')<CR>")
call submode#map('cocMode', 'n', '', 'k', ":call CocModePrev()<CR>zz:call CocAction('diagnosticInfo')<CR>")
call submode#map('cocMode', 'n', '', 'f', ":call CocAction('doQuickfix')<CR>")
map <Plug>(submode-before-entering:cocMode:with:<leader>cj) :call CocAction('diagnosticNext')<CR>zz:call CocAction('diagnosticInfo')<CR>
map <Plug>(submode-before-entering:cocMode:with:<leader>ck) :call CocAction('diagnosticPrevious')<CR>zz:call CocAction('diagnosticInfo')<CR>
map <Plug>(submode-leave:cocMode) :call coc#util#float_hide()<cr>


" Coc setup
" ====================================================================================
let g:markdown_fenced_languages = ['vim', 'help']

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap <Leader>re :CocRestart<CR><CR>
nnoremap <expr><C-f> coc#util#float_scroll(1)
nnoremap <expr><C-b> coc#util#float_scroll(0)
nmap <Leader>cd <Plug>(coc-diagnostic-info)
nmap <Leader>cf  <Plug>(coc-fix-current)
nmap <Leader>cn  <Plug>(coc-rename)
nmap gd <Plug>(coc-definition)
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Markdown Preview setup
" ====================================================================================
nnoremap <Leader>md :MarkdownPreview<CR>

" Vifm setup
" ====================================================================================
let g:vifm_embed_split = 1
let g:vifm_replace_netrw = 1
let g:vifm_exec_args = "-c \":only\""
nnoremap <Leader>e :topleft vertical 60Vifm<CR>

" Gina setup
" ====================================================================================
nnoremap <Leader>gh :GitGutterPreviewHunk<cr>
vnoremap <Leader>gs :GitGutterStageHunk<cr>
nnoremap <Leader>gs :Gina status<cr>
nnoremap <Leader>gS :vnew \| Gina status<cr>
nnoremap <Leader>gc :Gina commit<cr>
nnoremap <Leader>gd :Gina diff<cr>
nnoremap <Leader>gb :Gina blame<cr>
nnoremap <Leader>gl :Gina log<cr>
nnoremap <Leader>gp :Gina push<cr>
nnoremap <Leader>ga :Gina patch<cr>

" gitgutter setup
" ====================================================================================
hi SignColumn ctermfg=NONE ctermbg=NONE
hi! GitGutterAdd ctermfg=10 cterm=bold
hi! GitGutterChange ctermfg=4 cterm=bold
hi! GitGutterDelete ctermfg=9 cterm=bold
let g:gitgutter_realtime=1
let g:gitgutter_terminal_reports_focus = 0

" OmniSharp and sharpenup setup
" ====================================================================================
let g:OmniSharp_server_stdio = 1
let g:sharpenup_map_prefix = "\<Leader>,"

" fzf setup
" ====================================================================================
" Search history
nnoremap <Leader>; :History:<CR>
" Search all
nnoremap <Leader>f :RG<CR>
nnoremap <Leader>F :RG <c-r><c-w><CR>
" Search buffers
nnoremap <Leader>l :Lines<CR>
" Change buffers
nnoremap <Leader>b :Buffers<CR>

function! s:FindRoot()
    let gitRoot = system('git rev-parse --show-toplevel 2> /dev/null')
    if !empty(gitRoot)
        let gitRoot = trim(gitRoot)
        if filereadable(gitRoot . '/.git')
            " We are in a git folder
            return gitRoot
        endif
    endif
    " We are in a non-git folder or in the root of the git folder
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
    let command_fmt = "rg --column --line-number --no-heading --color=always --smart-case"
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

" Use rg instead of grep and Ack
if executable('ag')
    set grepprg=rg
    let g:ackprg = 'rg --column'
endif

augroup vimrc
    autocmd!
    " Automatically install missing plugins on startup
    au VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif

    au BufWritePost $MYVIMRC source $MYVIMRC | nohl | redraw
    au BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts
    au BufWritePost *sxhkdrc !pkill -USR1 sxhkd
    au BufWritePost *Xresources,*Xdefaults !xrdb %

    " Use actual tab chars in Makefiles.
    au FileType make set tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    au FileType json syntax match Comment +\/\/.\+$+
    " Keep splits even
    au VimResized * wincmd =
    " Automatically reload file on change
    au FocusGained,BufEnter * :silent! !
    au FocusLost,WinLeave * :silent! noautocmd w

    if has('nvim')
        " Always enter terminal in insert mode
        au BufEnter,BufNew,TermOpen * if &buftype == 'terminal' | :startinsert | :set nonumber | else | :set number | endif
    endif

    " When switching buffers, preserve window view.
    if v:version >= 700
        au BufLeave * call AutoSaveWinView()
        au BufEnter * call AutoRestoreWinView()
    endif

    autocmd FilterWritePre * if &diff|
        \ nmap <buffer> <Leader>l <Plug>(gina-diffget-r)|
        \ nmap <buffer> <Leader>h <Plug>(gina-diffget-l)|
        \ nnoremap <buffer> q :tabclose<CR>|
        \ endif

augroup END

" Close buffer but keep splits
function! CloseBuffer()
    let curBuf = bufnr('%')
    let prevBuf = bufnr('#')
    let curTab = tabpagenr()
    if bufwinnr('#') == -1
        exe 'bnext'
    else
        exe 'e #'
    endif

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
