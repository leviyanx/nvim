" ===================== Basic settings ==========================
" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named " '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

"* Set leader key to comma
let mapleader = ","
let localleader = ","

" Determinte environment we are runnning on(Win or Linux or Darwin) 
function! WhichEnv() abort
    if has('win64') || has('win32') || has('win16')
        return 'WINDOWS'
    else
        return toupper(substitute(system('uname'), '\n', '', ''))
    endif
endfunction
" Execuate this function only once to reduce start time
let env = WhichEnv()


set noswapfile      " disable swap file
set bufhidden=hide  " 当buffer被丢弃的时候隐藏它

set number          " Show line numbers.
set relativenumber  " This enables relative line numbering mode. 

syntax on       " Turn on syntax highlighting.
set incsearch   " Enble searching as you type, rather than waiting till you press enter.
set hlsearch    " highlight matches
set showmatch   " highlight matching [{()}]j
set cursorline  " highlight current line

set noerrorbells    " 关闭错误信息响铃
set novisualbell    " 关闭使用可视响铃代替呼叫

set shortmess+=I " Disable the default Vim startup message.

set clipboard=unnamed " 连通vim和系统剪切板

set scrolloff=8 " 光标距离上/下多少行时移动屏幕

set matchtime=2 " 短暂跳转到匹配括号的时间

set magic       " 设置魔术
set smartindent " 开启新行时使用智能自动缩进
set autochdir   " 自动切换当前目录为当前文件所在的目录

set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

set mouse+=a " Enable mouse support.

set ruler           " 打开状态栏标尺
set laststatus=2    " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%) " 设置在状态行显示的信息

" visual autocomplete for command menu
set wildmenu    

" Use a line cursor within insert mode and a block cursor everything else
"
" Reference chart of values:
" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"* Map Tab to 4 Space
filetype plugin indent on   " turn on filetype 'detection', 'plugin' and 'indent'
set tabstop=4               " show existing tab with 4 spaces width
set softtabstop=4           " number of spaces in tab when editing
set shiftwidth=4            " spaces in newline start
set expandtab               " On pressing tab, insert 4 spaces
" Not extend tab to 4 spaces in Makefile
autocmd FileType make setlocal noexpandtab

set foldenable          " 开始折叠
set foldmethod=syntax   " 设置语法折叠
set foldcolumn=0        " 设置折叠区域的宽度
set foldlevel=1         " 设置折叠层数为1
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> 

" =========================== Basic Mapping ================================
" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Quick operation
noremap ; :
nnoremap Q :q<CR>
nnoremap S :w<CR>
nnoremap <leader>wq :wq<CR>

" Split screening
set splitbelow
set splitright
nnoremap ,x1 <C-W>o
nnoremap ,x2 :split<CR>
nnoremap ,x3 :vsplit<CR>
nnoremap ,x0 :q<CR>
" move window
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
" keep the old mapping that moves window
nnoremap ,wh <C-W>h
nnoremap ,wl <C-W>l
nnoremap ,wj <C-W>j
nnoremap ,wk <C-W>k

" copy file name/path of current buffer in vim to system clipboard
" full path
nnoremap <leader>fn :let @*=expand("%:p")<CR>
" filename
nnoremap <leader>fp :let @*=expand("%:t")<CR>

" find (search for) selected text
vnoremap <leader>ss y/\V<C-r>=escape(@",'/\')<CR><CR>
" search visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>


" ===================== Specific platform setting ================
if env == 'WINDOWS'
    nnoremap <leader>ev :e $HOME/AppData/Local/nvim/init.vim<CR>
else
    " 'DARWIN' or 'Linux' 
    " Set python
    let g:python_host_skip_check = 1 " skip check to speed up loading
    let g:python_host_prog='/usr/bin/python'
    let g:python3_host_skip_check = 1 " skip check to speed up loading
    let g:python3_host_prog='/usr/bin/python3'

    nnoremap <leader>ev :e $HOME/.config/nvim/init.vim<CR>
    nnoremap <leader>ez :e $HOME/.zshrc<CR>
endif


" ======================== Vim Plug ==============================
call plug#begin('$HOME/.config/nvim/plugged')
" Keep Plugin commands between plug#begin/end

" Use release branch (recommend)
"* Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"* Commentary
Plug 'tpope/vim-commentary', { 'on': 'Commentary' }

"* fzf(Fuzzy file finder)
" Require fzf
Plug '~/.fzf'           " enable fzf which installed by git
Plug 'junegunn/fzf.vim' " add fzf.vim

"* lazygit
" Require lazygit
Plug 'kdheepak/lazygit.nvim'

"* ranger
" Require ranger
Plug 'kevinhwang91/rnvimr'

" Open terminal in neovim
Plug 'skywind3000/vim-terminal-help'

" visual multi
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" expand region
Plug 'terryma/vim-expand-region'

" undotree
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" vim-surround
Plug 'tpope/vim-surround'

" Theme plugin 
" Dracula-theme, OneDark, everforest, gruvbox-material
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
" ----------------------------------
" Line Plugin: airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" All of your Plugins must be added above the following line
call plug#end()

" ======================== light/dark theme ======================
function! SetBackground()
    " automatic switch between light and dark theme
    let hour = strftime("%H")
    if 6 <= hour && hour < 18
        if has('termguicolors')
          set termguicolors
        endif

        set background=light

        " edge
        " let g:airline_theme='edge'
        " colorscheme edge

        " everforest
        let g:everforest_background = 'hard'
        let g:airline_theme='everforest'
        colorscheme everforest
    else
        set background=dark
        let g:airline_theme='gruvbox_material'
        colorscheme gruvbox-material
    endif
endfunction
call SetBackground()


" ======================== coc settings ==============================
let g:coc_global_extensions = [
            \ 'coc-marketplace',
            \ 'coc-diagnostic',
            \ 'coc-explorer',
            \ 'coc-git',
            \ 'coc-gitignore',
            \ 'coc-python',
            \ 'coc-pyright',
            \ 'coc-clangd',
            \ 'coc-java',
            \ 'coc-rls',
            \ 'coc-json',
            \ 'coc-vimlsp']

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number

" Completion
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-o> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  " Show docs
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Run the Code Lens action on te current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"


" ======================== coc-explorer ============================
nmap <leader>xf :CocCommand explorer<CR>


" ======================== fzf =====================================
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = {'down': '~40%'}
" open recent files with fzf
nnoremap <silent> <leader>rr :History<CR>
" using Rg with fzf
nnoremap <silent> <leader>qq :Rg<CR>


" ======================== airline ===============================
let g:airline#extensions#tabline#enable = 1
" 4.1.1 set airline 
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 20
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1

" 4.1.2 set key bindings 
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5


" ======================== commentary ============================
" comment out current line
nnoremap <leader>ci :Commentary<CR>
" comment out visually selected lines
vnoremap <leader>ci :Commentary<CR>


" ======================== vim-expand-region =====================
" smart select
map <leader>xx <Plug>(expand_region_expand)
map <leader>zz <Plug>(expand_region_shrink)


" ======================== lazygit ================================
" setup mapping to call :LazyGit
nnoremap <silent> <leader>g :LazyGit<CR>


" ======================== ranger =================================
nnoremap <leader>kk :RnvimrToggle<CR>
tnoremap <silent> <leader>kk <C-\><C-n>:RnvimrToggle<CR>
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1
" Disable a border for floating window
let g:rnvimr_draw_border = 0
" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }


" ======================== vim-terminal-help =====================
let g:terminal_key = '<c-t>'
" toggle insert/normal mode in terminal
tnoremap <C-N> <C-\><C-N>


" ======================== undotree ==============================
nnoremap <F5> :UndotreeToggle<CR>
