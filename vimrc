"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                         "
"                                                                         "
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗                   "
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝                   "
"               ██║   ██║██║██╔████╔██║██████╔╝██║                        "
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║                        "
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗                   "
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝                   "
"                                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             NAVIGATION:                                 "
"                       Press 'zo' to open-fold                           "
"                       Press 'zm' to close-fold                          "
"                                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" DISABLED FEATURES AND FALLBACK: ······································································································································{{{

" Fallback vimrc 
"-----------------------
if $TERM_PROGRAM ==# 'Apple_Terminal' 
    " Load minimal configuration
    source ~/.config/vim/fallback_minimal_vimrc  " Adjust this path as needed
    autocmd VimEnter * call timer_start(10, { -> feedkeys("\<C-L>") })
    autocmd VimEnter * call timer_start(100, function('s:ShowStartupMessage'))
    function! s:ShowStartupMessage(timer)
        echom "Vim started in minimal mode due to terminal limitations. For full functionality, consider using a terminal with true color support."
    endfunction
    finish  " Stop processing the rest of the vimrc
endif

" Disabled functionality:
"------------------------
" Don't parse modelines (google vim modeline vulnerability).
set nomodeline
" Disable native netrw file explorer (make sure vim is up to date)
" We're using coc-explorer instead
let g:loaded_netrw  = 0
let g:loaded_netrwPlugin = 0
" Simulate as if matchit is already loaded, effectively disabling it
" we're using vim-matchup instead.
let g:loaded_matchit = 1
"•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}}}

" PLUGINS: ·····························································································································································{{{

call plug#begin('~/.config/vim/plugged')

" Universal set of defaults that (hopefully) everyone can agree on 
" (see: https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim)
  Plug 'tpope/vim-sensible'

" ** Color Theming **
  Plug 'joshdick/onedark.vim',
  Plug 'lambdalisue/vim-glyph-palette',
  Plug 'ryanoasis/vim-devicons'
" ** Functionality
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-commentary'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'mattn/emmet-vim'
  Plug 'honza/vim-snippets'
  Plug 'skywind3000/vim-quickui'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'andymass/vim-matchup'

call plug#end()
"•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}}}

" DEFAULTS: ····························································································································································{{{

" Vim's runtime path
set runtimepath+=~/.config/vim

" This allows you to undo changes to a file even after saving it
set undodir=~/.config/vim/undo
set undofile
set undoreload=10000

" Set swap dorectory for swap files
set dir=~/.config/vim/swap

" Enable fuzzy-finder (fzf install required first)
set rtp+=/opt/homebrew/opt/fzf

" Reduces the number of screen redraws, which can significantly improve performance
set lazyredraw

" enable mouse support 
set mouse=a

" Add numbers to the file
set number

" Disable any annoying beeps on errors.
set noerrorbells

" Flash the screen or the window to indicate an error or event
set visualbell

" Set window title by default.
set title

" Highlight cursor line underneath the cursor horizontally
set nocursorline

" Highlight cursor line underneath the cursor vertically
set nocursorcolumn

" Set shift width to 4 spaces
set shiftwidth=4

" Set tab width to 4 columns
set tabstop=4

" Use space characters instead of tabs
set expandtab

" Do not wrap lines. Allow long lines to extend as far as the line goes
set nowrap

" Ignore capital letters during search
set ignorecase

" Override the ignorecase option if searching for capital letters
" This will allow you to search specifically for capital letters
set smartcase

" Show partial command you type in the last line of the screen
set showcmd

" Don't show mode in cmd line
set noshowmode

" Show matching words during a search also [] {} and ()
set showmatch

" Auto indentation in new line
set autoindent

" Use highlighting when doing a search
set hlsearch

" Make wildmenu behave like similar to Bash completion
set wildmode=list:longest,full

" There are certain files that we would never want to edit with Vim
" Wildmenu will ignore files with these extensions
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
" **required for coc-nvim
set encoding=utf-8

" Some servers have issues with backup files, see # 649
" **required for coc-nvim.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience
" **required for coc-nvim
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
" **required for coc-nvim
set signcolumn=yes
"•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}}}

" VISUAL CONFIGURATIONS: ···················································································································································{{{

"Onedark color ovverides
let g:onedark_color_overrides = {
\ "cursor_grey": {"gui": "#2D3C56", "cterm": "235", "cterm16": "0" },
\ "vertsplit": { "gui": "#2D3C56", "cterm": "170", "cterm16": "5" }
\}

function! s:SetColorScheme()
  if has('termguicolors')
    " Check if the terminal supports true colors
    if $COLORTERM ==# 'truecolor' || $COLORTERM ==# '24bit' || 
      \ (has('vcon') && empty(&term) ? v:true : &term =~# '^\%(xterm\|screen\|tmux\|vte\|gnome\)\(-.*\)\?$')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
      set background=dark
      " Load onedark if it's available
      if globpath(&rtp, 'colors/onedark.vim', 1) != ''
        colorscheme onedark
      else
        " Fallback to a built-in dark scheme if onedark is not available
        colorscheme desert
      endif
    else
      " Terminal doesn't support true colors, use a basic color scheme
      set notermguicolors
      set background=dark
      colorscheme slate
    endif
  else
    " Termguicolors not supported, use a basic color scheme
    set background=dark
    colorscheme slate
  endif
endfunction

" Call the function to set the color scheme
call s:SetColorScheme()

" Display folded text as Orange color
hi Folded guifg=#FF8C00 ctermfg=214 guibg=NONE ctermbg=NONE

" Replace the ugly vertical split lines with spaces instead of lines.
set fillchars+=vert:\ 

" Vertical split line color
hi VertSplit guibg=#2D3C56
hi StatusLineNC guibg=#2D3C56 
"•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}}}

" GENERAL MAPPING: ·····················································································································································{{{

" Set the ',' as the leader key
let mapleader = ','

" Press \\ to jump back to the last cursor position
nnoremap \\ ``

" Pressing the letter o will open a new line below the current one
" Exit insert mode after creating a new line above or below the current line
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line
nnoremap Y y$

" Visually select the text that was last edited/pasted
noremap gV `[v`]

" Move cursor to the end the visual yanked text
vnoremap <silent> y y`]

" A fix for a common typo
map q: :q

" Fuzzy-finder files search 
nnoremap <leader>p :Files<Cr>
" Fuzzy-finder git search
nnoremap <leader>o :GFiles<Cr>

" Ripgrep within fuzzy-finder
nnoremap <leader>i :Rg<Cr>

" Navigate the split view easier by pressing SHIFT+CTRL+j, SHIFT+CTRL+k, SHIFT+CTRL+h, or SHIFT+CTRL+l
nnoremap <S-C-j> <C-w>j
nnoremap <S-C-k> <C-w>k
nnoremap <S-C-h> <C-w>h
nnoremap <S-C-l> <C-w>l

" Resize split windows using arrow keys by pressing SHIFT+CTRL+UP, SHIFT+CTRL+DOWN, SHIFT+CTRL+LEFT, or SHIFT+CTRL+RIGHT
nnoremap <silent> <S-C-Left> :vertical resize -4<CR>
nnoremap <silent> <S-C-Right> :vertical resize +4<CR>
nnoremap <silent> <S-C-Up> :resize +4<CR>
nnoremap <silent> <S-C-Down> :resize -4<CR>

" Quick save
nnoremap <leader>w :w<CR>

" Quick quit
nnoremap <leader>q :q<CR>

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Exit to terminal Normal-mode
tnoremap <leader>n <C-\><C-n>

" ### quick ui plugin ###
" a glimpse to the definition of the current word under cursor without actually open that file
nnoremap <F3> :call quickui#tools#preview_tag('')<cr>

" Scroll down in the preview window when using quickui ctag for preview
nnoremap <silent> <TAB> :call quickui#preview#scroll(1)<CR>

" Scroll up in the preview window when using quickui plugin for preview
nnoremap <silent> <S-TAB> :call quickui#preview#scroll(-1)<CR>
"•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}}}

" GENERAL VIM SCRIPT: ··················································································································································{{{

" Auto-resize splits when Vim get resized
function! ResizeWindows()
    let savetab = tabpagenr()
    tabdo wincmd =
    execute 'tabnext' savetab
endfunction
autocmd VimResized * call ResizeWindows()

" Filetype-specific settings
augroup FileTypeSettings
    autocmd!
    " To disable auto-comments permanently
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    " Enable marker-based folding for Vim script files
    autocmd FileType vim setlocal foldmethod=marker fillchars=fold:·
    " Set indentation to 2 spaces for HTML files
    autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

" Ensure filetype is detected when saving a new file and that other necessary autocmd's are triggered
augroup FileTypeAutodetect
    autocmd!
    autocmd BufFilePost * filetype detect
    autocmd BufFilePost * silent! doautocmd BufReadPost
augroup END

augroup PythonFile
    autocmd!
    " Remove trailing whitespace from Python files on save
    autocmd BufWritePre *.py :%s/\s\+$//e
    " Remove blank lines at the end of the file
    autocmd BufWritePre *.py :%s/\(\n\)\+\%$//e
augroup END
"•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}}}

" COC LSP SETTINGS: ····················································································································································{{{

" Set the location for CoC configuration files
let g:coc_config_home = expand('~/.config/vim')

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
    inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
    inoremap <silent> <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <ctrl-tab> to trigger on/off completion
    inoremap <silent><expr> <Esc>[1;5I coc#pum#visible() ? coc#pum#stop() : coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ============================================================================
"  Custom Coc Functionality
" ============================================================================

" Function to toggle the diagnostic float window
function! ToggleDiagnosticFloat() abort
    " Use `get()` to safely access g:diagnostic_float_open with a default value
    let l:is_open = get(g:, 'diagnostic_float_open', 0)

    if l:is_open
        call coc#float#close_all()
    else
        call CocActionAsync('diagnosticInfo')
    endif

    " Toggle the state
    let g:diagnostic_float_open = !l:is_open
endfunction

" Function to pick a color and handle exit
function! ChangeColor() abort
    " Call the CocAction to pick a color
    call CocAction('pickColor')
    " Ensure the color picker buffer is closed and terminal is reset
    silent! :redraw!
endfunction

" Map to toggle the diagnostic float window
nnoremap <silent> <leader>d :call ToggleDiagnosticFloat()<CR>

" Toggle show color highlight
nnoremap <silent> <leader>sc :CocCommand document.toggleColors<CR>

" Change color using cocAction('pickColor')
nnoremap <leader>cc :call ChangeColor()<CR>

" Custom colors for coc float completion window
hi CocMenuSel ctermbg=39 guibg=#000000
hi CocSearch ctermfg=12 guifg=#F17B0F
hi CocFloating guibg=#2D3C56 guifg=#D8DEE9
hi CocFloatDividingLine guifg=#88C0D0
"•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}}}

" COC SNIPPETS: ························································································································································{{{

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-`> for both expand and jump (make expand higher priority.)
imap <C-`> <Plug>(coc-snippets-expand-jump)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
"•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}}}

" COC EXPLORER: ························································································································································{{{
 
" Presets
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.config/vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'defaultLeft': {
\     'position': 'left',
\     'open-action-strategy': 'sourceWindow',
\     'width': 10,
\   },
\   'simplify': {
\   'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [diagnosticError & 1][filename omitCenter 1] [modified][readonly] [linkIcon & 1][link growRight 1 omitCenter 5]'
\   },
\ }

" Custom foreground and background colors for coc-explorer's float window  
highlight CocExplorerNormalFloat guibg=#2D3C56 guifg=#D8DEE9

" Exit Vim/Close Tab when coc-explorer is the last window left
augroup CocExplorerExitVim
    autocmd!
    " Exit Vim if coc-explorer is the only window remaining in the only tab.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && &filetype == 'coc-explorer' | call feedkeys(":quit\<CR>:\<BS>") | endif
    " Close the tab if coc-explorer is the only window remaining in it.
    autocmd BufEnter * if winnr('$') == 1 && &filetype == 'coc-explorer' | call feedkeys(":quit\<CR>:\<BS>") | endif
augroup END

" Apply colors to dev-icons when coc-explorer is active
augroup ApplyGlyphPalette
  autocmd! *
  autocmd FileType coc-explorer call glyph_palette#apply()
augroup END

" Change the default ugly coc-explorer title to 'Explorer'
augroup CocExplorerChangeTitle
    autocmd!
    autocmd FileType coc-explorer setlocal title titlestring=Explorer
    autocmd BufEnter * if &filetype == 'coc-explorer'
            \ | setlocal title titlestring=Explorer
            \ | else
            \ | setlocal title titlestring=
            \ | endif
augroup END

" Map the ± key to toggle coc-explorer open and close.
" nnoremap <silent> ± :CocCommand explorer<CR>
" Use preset argument to open it
nnoremap <leader>ev <Cmd>CocCommand explorer --preset .vim<CR>
nnoremap <leader>ec <Cmd>CocCommand explorer --preset cocConfig<CR>
nnoremap <leader>eb <Cmd>CocCommand explorer --preset buffer<CR>
nnoremap ± <Cmd>CocCommand explorer --preset defaultLeft --preset simplify<CR>
" List all presets
nnoremap <leader>el <Cmd>CocList explPresets<CR>
"•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}}}

" MATCHUP: ·····························································································································································{{{

" **plugin info: modern matchit and matchparen plugin

" Improve performance:
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_timeout = 300
let g:matchup_matchparen_insert_timeout = 60

" Enable experimental transmute module
let g:matchup_transmute_enabled = 1

" Enhanced matching visualization
let g:matchup_matchparen_offscreen = {'method': 'popup'}

" Enable surrounding operations (see options below)
let g:matchup_surround_enabled = 1

" Surrounding operations: (if enabled)
" ds%: Delete surrounding matched pair
" cs%: Change surrounding matched pair
" Highlight surrounding delimiters: <plug>(matchup-hi-surround)
"•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}}}

" GUTENTAGS: ···························································································································································{{{

" Gutentags Configuration
let g:gutentags_project_root = ['.git', '.root', 'package.json', 'tsconfig.json']
let g:gutentags_modules = ['ctags']

let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+niazS',
      \ '--extras=+q',
      \ '--javascript-kinds=+fcmpv',
      \ '--typescript-kinds=+cefgmoprstv',
      \ '--python-kinds=+cfm',
      \ '--html-kinds=+af',
      \ '--css-kinds=+acgps',
      \ '--less-kinds=+acgps',
      \ '--scss-kinds=+acgps',
      \ '--langmap=javascript:.js.es6.es.jsx.mjs.cjs',
      \ '--langmap=typescript:.ts.tsx',
      \ '--langmap=html:.html.htm.shtml.xhtml.htmx',
      \ '--langmap=css:.css.less.scss',
      \ '--langmap=svelte:.svelte',
      \ '--langmap=vue:.vue'
      \ ]

" Set cache directory, create if it doesn't exist
let g:gutentags_cache_dir = expand('~/.cache/tags')
if !isdirectory(g:gutentags_cache_dir)
    call mkdir(g:gutentags_cache_dir, 'p')
endif

" Enable/disable advanced commands for debugging
let g:gutentags_define_advanced_commands = 0

" Exclusions
let g:gutentags_ctags_exclude = [
    \ '*.svg', '*.hg',
    \ '*/tests/*',
    \ 'build',
    \ 'dist',
    \ '*sites/*/files/*',
    \ 'bin',
    \ 'node_modules',
    \ 'bower_components',
    \ 'cache',
    \ 'compiled',
    \ 'docs',
    \ 'example',
    \ 'bundle',
    \ 'vendor',
    \ '*.md',
    \ '*-lock.json',
    \ '*.lock',
    \ '*.vim/bundle/*',
    \ '*bundle*.js',
    \ '*build*.js',
    \ '.*rc*',
    \ '*.min.*',
    \ '*.map',
    \ '*.bak',
    \ '*.zip',
    \ '*.pyc',
    \ '*.class',
    \ '*.sln',
    \ '*.Master',
    \ '*.csproj',
    \ '*.tmp',
    \ '*.csproj.user',
    \ '*.cache',
    \ '*.pdb',
    \ 'tags*',
    \ 'cscope.*',
    \ '*.exe', '*.dll', '*.mp3', '*.ogg', '*.flac',
    \ '*.swp', '*.swo',
    \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
    \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
    \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
    \ ]
"•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}}}

" STATUS LINE: ·························································································································································{{{

" Initialize variables to store git branch name, number of changes and git root
let g:git_root = ''
let g:git_branch = ''
let g:git_files_changed = 0

" Global variable to store all output from git status
let g:git_status_output = []

" Configuration for the Lightline plugin
let g:lightline = { 
\   'active': {
\    'left' :[ [ 'mode', 'paste' ],  
\              [ 'readonly', 'filename', 'modified' ],  
\              [ 'gitstatus', 'gitcurrentchanges' ]  
\            ],
\    'right':[ [ 'percent', 'lineinfo' ],  
\              [ 'filetype' ],
\              [ 'cocstatus_error', 'cocstatus_warning', 'cocstatus_info', 'cocstatus_hint' ]  
\            ]
\   },
\   'separator': {
\     'left': '', 'right': ''  
\   },
\   'subseparator': {
\     'left': '', 'right': ''  
\   },
\   'component_function': {
\     'mode': 'LightlineMode', 
\     'percent': 'LightlinePercent',
\     'filename': 'LightlineFilename',
\     'lineinfo': 'LightlineLineinfo',  
\     'readonly': 'LightlineReadonly',  
\     'modified': 'LightlineModified',  
\     'filetype': 'LightlineFiletype',
\     'gitstatus': 'LightlineGitInfo',
\     'gitcurrentchanges': 'GetCurrentGitChanges'
\   },
\   'component_expand': {
\     'cocstatus_error': 'LightlineDiagnosticError',  
\     'cocstatus_warning': 'LightlineDiagnosticWarning',  
\     'cocstatus_hint': 'LightlineDiagnosticHint',  
\     'cocstatus_info': 'LightlineDiagnosticInfo',
\   },
\   'component_type': {
\     'cocstatus_error': 'error',  
\     'cocstatus_warning': 'warning',  
\     'cocstatus_info': 'info',  
\     'cocstatus_hint': 'hint',
\   }
\}

" Toggle lightline colorschemes
function! ToggleLightlineColorscheme(direction)
    " List of available Lightline color schemes
    let schemes = [
        \ '16color', 'apprentice', 'ayu_dark', 'ayu_light', 'ayu_mirage',
        \ 'darcula', 'default', 'deus', 'jellybeans', 'landscape',
        \ 'materia', 'material', 'molokai', 'nord', 'OldHope',
        \ 'onedark', 'PaperColor_dark', 'PaperColor_light', 'PaperColor',
        \ 'powerline', 'powerlineish', 'rosepine_moon', 'rosepine',
        \ 'selenized_black', 'selenized_dark', 'selenized_light', 'selenized_white',
        \ 'seoul256', 'simpleblack', 'solarized', 'srcery_drk',
        \ 'Tomorrow_Night_Blue', 'Tomorrow_Night_Bright', 'Tomorrow_Night_Eighties', 
        \ 'Tomorrow_Night', 'Tomorrow', 'wombat'
    \ ]
    
    " Get the current color scheme index
    let current = index(schemes, get(g:lightline, 'colorscheme'))
    let l:len = len(schemes)
    
    " Calculate the new index based on the direction (1 for next, -1 for previous)
    let new_index = (current + a:direction + l:len) % l:len
    
    " Set the new color scheme
    let g:lightline.colorscheme = schemes[new_index]
    
    " Initialize and update Lightline with the new color scheme
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
    
    " Save the current color scheme to a file for persistence
    let config_dir = expand('~/.config/vim/lightline_colorscheme')
    if !isdirectory(config_dir)
        call mkdir(config_dir, 'p')
    endif
    let config_file = config_dir . '/lightline_colorscheme.vim'
    let content = ['let g:lightline = extend(get(g:, "lightline", {}), { "colorscheme": "' . schemes[new_index] . '" })']
    try
        call writefile(content, config_file)
        echohl MoreMsg
        echomsg "Statusline color scheme: " . schemes[new_index] . " (saved)"
        echohl None
        call timer_start(2000, {-> execute('echo ""')})
    catch
        echoerr "Failed to save colorscheme: " . v:exception
    endtry
endfunction

" Make toggled scheme to persist after reloading vim
if filereadable(expand('~/.config/vim/lightline_colorscheme/lightline_colorscheme.vim'))
    source ~/.config/vim/lightline_colorscheme/lightline_colorscheme.vim
else
    let g:lightline.colorscheme = 'onedark'
endif

" Map keys to toggle to the next and previous Lightline color schemes
nnoremap <silent> <leader>tl :call ToggleLightlineColorscheme(1)<CR>
nnoremap <silent> <leader>lt :call ToggleLightlineColorscheme(-1)<CR>

" Helper function to get diagnostic count with icon
function! s:GetDiagCountWithIcon(type, icon)
    let l:info = get(b:, 'coc_diagnostic_info', {})
    return has_key(l:info, a:type) && l:info[a:type] > 0 ? a:icon . ' ' . l:info[a:type] : ''
endfunction

" Diagnostic function types
function! LightlineDiagnosticError() abort
    return s:GetDiagCountWithIcon('error', '')
endfunction

function! LightlineDiagnosticWarning() abort
    return s:GetDiagCountWithIcon('warning', '')
endfunction

function! LightlineDiagnosticInfo() abort
    return s:GetDiagCountWithIcon('information', '')
endfunction

function! LightlineDiagnosticHint() abort
    return s:GetDiagCountWithIcon('hint', '')
endfunction

" Function for filename section in Lightline
function! LightlineFilename() abort
    if &filetype == 'coc-explorer'
        return 'Explorer'
    elseif &buftype == 'terminal'
        return 'Terminal'
    endif
    return expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

" Function to get line information for Lightline
function! LightlineLineinfo() abort
    if index(['coc-explorer', 'gitcommit', 'list'], &filetype) != -1 || &buftype == 'terminal' || winwidth(0) < 76
        return ''
    endif
    return line('.') . '/' . line('$')
endfunction

" Function to display the percent component for Lightline
function! LightlinePercent() abort
    if index(['coc-explorer', 'gitcommit', 'list'], &filetype) == -1 && &buftype != 'terminal'
        return line('.') * 100 / line('$') . '%'
    endif
    return ''
endfunction

" Function to indicate if the buffer is modified
function! LightlineModified() abort
    return &buftype != 'terminal' && &modified ? '●' : ''
endfunction

" Function to display the mode for Lightline
function! LightlineMode() abort
    if &filetype == 'coc-explorer'
        return ''
    elseif &buftype == 'terminal'
        return ''
    endif
    return lightline#mode()
endfunction

" Function to display read-only status for Lightline
function! LightlineReadonly() abort
    return &readonly ? get({'coc-explorer': ''}, &filetype, '') : ''
endfunction

" Function to display file type for Lightline
function! LightlineFiletype() abort
    if index(['coc-explorer', 'list'], &filetype) != -1 || &buftype == 'terminal'
        return ''
    endif

    if !exists('*WebDevIconsGetFileTypeSymbol')
        return &filetype
    endif

" Fetch filetype icon symbol and print it if exists.
    let l:icon = WebDevIconsGetFileTypeSymbol()
    return winwidth(0) > 76 ? (&filetype . ' ' . l:icon) : l:icon
endfunction

" Function to check if the current directory is a git repository
function! IsGitRepo() abort
    try
        let g:git_root = fugitive#repo().tree()
        return !empty(g:git_root)
    catch
        let g:git_root = ''
        return 0
    endtry
endfunction

" Function to get the current git branch
function! GetCurrentGitBranch() abort
    let l:head = FugitiveHead()
    return empty(l:head) ? '' : " \uf126 " . l:head
endfunction

function! GetCurrentGitChanges() abort
    if index(['coc-explorer', 'gitcommit'], &filetype) != -1 || &buftype == 'terminal' || empty(g:git_branch)
        return ''
    endif
    
    let [added, modified, removed] = GitGutterGetHunkSummary()
    return (added + modified + removed > 0 ? printf('[+%d ~%d -%d]', added, modified, removed) : '')
endfunction

" Function to display git information in Lightline
function! LightlineGitInfo() abort
    if index(['coc-explorer', 'gitcommit'], &filetype) != -1 || &buftype == 'terminal'
        return ''
    endif
    return (g:git_files_changed > 0 ? '+' . g:git_files_changed : '') . g:git_branch
endfunction

" Function to clear git branch and changed files value, then update status line.
function! ClearGitStatus()
    let g:git_branch = ''
    let g:git_files_changed = 0
    call lightline#update()
endfunction

" Async git status check
function! AsyncGitStatus(job, msg)
    if type(a:msg) == v:t_string
        call add(g:git_status_output, a:msg)
    elseif type(a:msg) == v:t_list
        call extend(g:git_status_output, a:msg)
    endif
endfunction

function! AsyncGitStatusExit(job, status)
    let g:git_files_changed = len(filter(g:git_status_output, 'v:val !=# ""'))
    let g:git_status_output = []  " Clear the output for the next run
    call lightline#update()
endfunction

function! StartAsyncGitStatus()
    if empty(g:git_root)
        return
    endif
    let g:git_status_output = []  " Clear previous output
    let l:cmd = ['git', '-C', g:git_root, 'status', '--porcelain']
    call job_start(l:cmd, {'callback': 'AsyncGitStatus', 'exit_cb': 'AsyncGitStatusExit'})
endfunction

function! UpdateGitInfo() abort
    if index(['help', 'quickfix', 'nofile', 'terminal'], &buftype) != -1 || &filetype == 'gitcommit'
        call ClearGitStatus()
        return
    endif
    if executable('git')
        let new_branch = GetCurrentGitBranch()
        if new_branch != g:git_branch
            let g:git_branch = new_branch
        endif
        call StartAsyncGitStatus()
    else
        call ClearGitStatus()
    endif
endfunction

" Check if it's a git repo and update git info
function! CheckAndUpdateGitInfo(timer)
    if IsGitRepo()
        call UpdateGitInfo()
    else
        call ClearGitStatus()
    endif
endfunction

" Debounce function
let s:update_timer = -1
function! DebouncedGitUpdate(delay)
    if s:update_timer != -1
        call timer_stop(s:update_timer)
    endif
    let s:update_timer = timer_start(a:delay, 'CheckAndUpdateGitInfo')
endfunction

" Set up autocommands to trigger updates
augroup GitStatusUpdate
    autocmd!
    autocmd BufWritePost,BufEnter * call DebouncedGitUpdate(1000)
    autocmd CursorHold,CursorHoldI * call DebouncedGitUpdate(1000)
augroup END

augroup CocDiagnostic
    autocmd!
    autocmd User CocDiagnosticChange call lightline#update()
augroup END
"•••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••}}}
