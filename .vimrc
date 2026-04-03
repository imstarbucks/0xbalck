" Prevent Vim prompt to save 
set hidden

" Set autoindent
set autoindent

set encoding=utf-8

" Set smartindent
set smartindent

"Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=2

" Set tab width to 4 columns.
set tabstop=2

" Use space characters instead of tabs.
set expandtab

" Number of spaces for <Tab> in insert mode
set softtabstop=2

" Do not save backup files.
set nobackup
set nowritebackup

set updatetime=300
set signcolumn=yes

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set wrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=longest:full,full

set relativenumber

set re=0

set noswapfile

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set guifont=RobotoMono\ Nerd\ Font\ Mono

set belloff=all

" PLUGINS ---------------------------------------------------------------- {{{
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'ayu-theme/ayu-vim'
Plug 'Eliot00/auto-pairs'
Plug 'girishji/scope.vim'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
"Plug 'monkoose/vim9-stargate'
Plug 'andymass/vim-matchup'
Plug 'dense-analysis/ale'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'mattn/emmet-vim'
Plug 'ycm/poplar.vim'
"Plug 'girishji/autosuggest.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'girishji/vimcomplete'
Plug 'girishji/vimbits'

Plug 'Eliot00/git-lens.vim'

Plug 'yegappan/lsp'

"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'mhinz/vim-startify'
"Plug 'Yggdroot/indentLine'
"Plug 'fatih/vim-go'
call plug#end()
set termguicolors
let ayucolor="dark"
colorscheme ayu

" Override ayu-vim cursor and cursorline highlights
autocmd ColorScheme ayu highlight Cursor ctermfg=black ctermbg=yellow guifg=black guibg=yellow
autocmd ColorScheme ayu highlight CursorColumn ctermbg=Gray guibg=#3A3F4B
autocmd ColorScheme ayu highlight CursorLine ctermbg=Gray guibg=#3A3F4B

"}}} 


"-- MAPPINGS --------------------------------------------------------------- {{{
let mapleader = " "

nnoremap <leader>1 :so $MYVIMRC<CR>

" Mappings code goes here.
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>z :wq<cr>

" Split navigation
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

vnoremap <C-c> "*y
nnoremap <leader>nh :nohlsearch<CR>

nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv
nnoremap <leader><leader> <C-^>
inoremap jj <Esc>
inoremap jk <Esc>


" Basic buffer navigation
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>

" List and jump to buffer
nnoremap <silent> <leader>bl :ls<CR>:b<Space>

" Delete buffer (and stay in split)
nnoremap <silent> <leader>bd :bp<bar>bd #<CR>
command! Bd :bp|bd #
nnoremap <leader>bd :Bd<CR>
set statusline=%f%m%r%h%w\ [%{&filetype}]\ [%{&fileencoding}]\ [Buf:%n]


" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
autocmd FileType json syntax match Comment +\/\/.\+$+

" coc-prettier setup
"command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" More Vimscripts code goes here.

" }}}


" IndentLine Config {{{
let g:indentLine_char = '│'
let g:indentLine_color_term = 239

" Ignore node_modules
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
" }}}


" GoLang Config {{{

" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

" Syntax highlight
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" Show the function signature for a given routine
autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)

" Show the interfaces a type implementation
autocmd BufEnter *.go nmap <leader>ii <Plug>(go-implementation)

" Describe the defination of a given type
autocmd BufEnter *.go nmap <leader>ci <Plug>(go-describe)

" See the callers of a given function
autocmd BufEnter *.go nmap <leader>cc  <Plug>(go-callers)

" Go to definition & Go back
nmap <C-a> <C-o>

" }}}


"-- vim-completion Config ---------------------------------- {{{
let g:vimcomplete_tab_enable = 1
let g:VimCompleteOptions = {
      \ 'vsnip': { 'enable': v:true, 'priority': 10 },
      \ 'lsp': { 'enable': v:true, 'priority': 11 }
      \ }

autocmd VimEnter * call VimCompleteOptionsSet(g:VimCompleteOptions)

"}}}


"------- VSnip Config --------{{{
"
let g:vsnip_snippet_dir = "/Users/spencer/.vim/snippets"
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']
"
"}}}


"-- yegappan/lsp ------- {{{

if exists('*LspOptionsSet')
call LspOptionsSet(#{
        \   aleSupport: v:true,
        \   autoComplete: v:true,
        \   autoHighlight: v:true,
        \   autoHighlightDiags: v:true,
        \   completionMatcher: 'fuzzy',
        \   completionMatcherValue: 1,
        \   highlightDiagInline: v:true,
        \   hoverInPreview: v:false,
        \   diagVirtualTextAlign: 'after',
        \   diagVirtualTextWrap: 'wrap',
        \   noNewlineInCompletion: v:true,
        \   semanticHighlight: v:true,
        \   showDiagInPopup: v:true,
        \   showDiagOnStatusLine: v:true,
        \   showDiagWithSign: v:true,
        \   showDiagWithVirtualText: v:true,
        \   showInlayHints: v:true,
        \   showSignature: v:true,
        \   snipperSupport: v:true,
        \   ultisnipsSupport: v:false,
        \   vsnipSupport: v:true,
	\ })

" Javascript/Typescript language server
call LspAddServer([#{
  \ name: 'ts_ls',
  \ filetype: ['javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx'],
  \ path: 'typescript-language-server',
  \ args: ['--stdio'],
  \ initialization_options: #{
  \   hostInfo: 'vim'
  \ },
  \ root_uri: {server_info->lsp#utils#find_nearest_parent_directory(
  \   lsp#utils#get_buffer_path(), ['tsconfig.json', 'jsconfig.json', 'package.json', '.git']
  \ )}
\ }])

" Go language server
call LspAddServer([#{
	\    name: 'golang',
	\    filetype: ['go', 'gomod'],
	\    path: 'gopls',
	\    args: ['serve'],
	\    syncInit: v:true
	\  }])

" HTML language server
call LspAddServer([#{
  \ name: 'htmlls',
  \ filetype: ['html', 'typescript', 'typescriptreact', 'javacsript', 'javascriptreact'],
  \ path: 'vscode-html-language-server',
  \ args: ['--stdio'],
  \ }])

" CSS language server
call LspAddServer([#{
  \ name: 'cssls',
  \ filetype: ['css', 'scss', 'less'],
  \ path: 'vscode-css-language-server',
  \ args: ['--stdio'],
  \ initialization_options: #{
  \   provideFormatter: v:true
  \ },
  \ workspace_config: #{
  \   settings: #{
  \     css: #{ validate: v:true },
  \     less: #{ validate: v:true },
  \     scss: #{ validate: v:true }
  \   }
  \ },
  \ root_uri: {server_info->lsp#utils#find_nearest_parent_directory(
  \   lsp#utils#get_buffer_path(), ['package.json', '.git']
  \ )}
\ }])

" JSON language server
call LspAddServer([#{
  \ name: 'jsonls',
  \ filetype: ['json', 'jsonrc'],
  \ path: 'vscode-json-language-server',
  \ args: ['--stdio'],
  \ initialization_options: #{
  \   provideFormatter: v:true
  \ },
  \ root_uri: {server_info->lsp#utils#find_nearest_parent_directory(
  \   lsp#utils#get_buffer_path(), ['tsconfig.json', 'jsconfig.json', 'package.json', '.git']
  \ )}
\ }])

" Tailwindcss language server
call LspAddServer([#{
  \ name: 'tailwindcss',
  \ filetype: [
  \   'aspnetcorerazor', 'astro', 'astro-markdown', 'blade', 'clojure', 'django-html', 'htmldjango',
  \   'edge', 'eelixir', 'elixir', 'ejs', 'erb', 'eruby', 'gohtml', 'gohtmltmpl', 'haml', 'handlebars',
  \   'hbs', 'html', 'htmlangular', 'html-eex', 'heex', 'jade', 'leaf', 'liquid', 'markdown', 'mdx',
  \   'mustache', 'njk', 'nunjucks', 'php', 'razor', 'slim', 'twig', 'css', 'less', 'postcss', 'sass',
  \   'scss', 'stylus', 'sugarss', 'javascript', 'javascriptreact', 'reason', 'rescript', 'typescript',
  \   'typescriptreact', 'vue', 'svelte', 'templ'
  \ ],
  \ path: 'tailwindcss-language-server',
  \ args: ['--stdio'],
  \ workspace_config: #{
  \   settings: #{
  \     tailwindCSS: #{
  \       classFunction: ['tw','clsx', 'cn'],
  \       classAttributes: ['class', 'className', 'class:list', 'classList', 'ngClass'],
  \       includeLanguages: #{
  \         eelixir: 'html-eex',
  \         eruby: 'erb',
  \         htmlangular: 'html',
  \         templ: 'html'
  \       },
  \       lint: #{
  \         cssConflict: 'warning',
  \         invalidApply: 'error',
  \         invalidScreen: 'error',
  \         invalidVariant: 'error',
  \         recommendedVariantOrder: 'warning'
  \       },
  \       validate: v:true
  \     }
  \   }
  \ },
\ }])

" Vue language server
call LspAddServer([
\   {
\     'name': 'volar',
\     'path': 'vue-language-server',
\     'args': ['--stdio'],
\     'filetype': ['vue', 'typescript', 'javascript'],
\     'features': {
\       'definition': v:true,
\       'rename': v:true,
\     },
\     'initializationOptions': {
\       'typescript': {
\         'tsdk': '/Users/spencer/.nvm/versions/node/v22.14.0/lib/node_modules/typescript/lib'
\       },
\       'vue': {
\         'hybridMode': v:false
\       },
\     'plugins': [
\      {
\        'name': '@vue/typescript-plugin',
\        'location': '/Users/spencer/.nvm/versions/node/v22.14.0/node_modules/@vue/typescript-plugin',
\        'languages': ['vue'],
\      }
\     ]
\     },
\   }
\ ])

" VIM language server
call LspAddServer([#{
  \ name: 'vimls',
  \ filetype: ['vim'],
  \ path: 'vim-language-server',
  \ args: ['--stdio'],
  \ initialization_options: #{
  \   diagnostic: #{ enable: v:true },
  \   indexes: #{
  \     count: 3,
  \     gap: 100,
  \     projectRootPatterns: ['runtime', 'nvim', '.git', 'autoload', 'plugin'],
  \     runtimepath: v:true
  \   },
  \   isNeovim: v:true,
  \   iskeyword: '@,48-57,_,192-255,-#',
  \   runtimepath: '',
  \   suggest: #{
  \     fromRuntimepath: v:true,
  \     fromVimruntime: v:true
  \   },
  \   vimruntime: ''
  \ }
\ }])

nnoremap <silent> gd :LspGotoDefinition<CR>
nnoremap <silent> gi :LspGotoImpl<CR>
nnoremap <silent> K :LspHover<CR>
nnoremap <silent> gpd :LspPeekDefinition<CR>
nnoremap <silent> gpt :LspPeekTypeDef<CR>
nnoremap <silent> gt :LspGotoTypeDef<CR>
nnoremap <silent> gr :LspReferences<CR>
nnoremap <silent> <leader>f :LspFormat<CR>

inoremap <silent> <C-a> <C-x><C-o>
let g:lsp_snippet_support = 1

"let g:vimcomplete_tab_enable = 1
"let g:vimcomplete_cr_enable = 1
"let g:vimcomplete#sources = ['lsp', 'snippets']
set completeopt=menuone,noinsert,noselect
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

endif
"}}}


if filereadable(expand('$HOME/.vim/custom/plugins/polar.vim'))
  source $HOME/.vim/custom/plugins/polar.vim
endif
if filereadable(expand('$HOME/.vim/custom/plugins/scope.vim'))
  source $HOME/.vim/custom/plugins/scope.vim
endif
if filereadable(expand('$HOME/.vim/custom/plugins/ale.vim'))
  source $HOME/.vim/custom/plugins/ale.vim
endif
