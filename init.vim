call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'codota/tabnine-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'vim-test/vim-test'
Plug 'terryma/vim-multiple-cursors'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'maralla/completor.vim'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

syntax on
colorscheme onedark

set background=dark
set hidden
set number
set relativenumber
set inccommand=split
set tabstop=4
set shiftwidth=4
set guicursor+=n:hor20-Cursor/lCursor
set guifont=DroidSansMono\ Nerd\ Font\ Mono:h12
set encoding=utf-8

let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}"

" let g:go_doc_popup_window = 1
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

let g:onedark_hide_endofbuffer = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
let g:airline_theme='onedark'
let g:UltiSnipsEditSplit = 'vertical' 
let g:indentLine_enabled = 1
let mapleader="\<space>"
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }

let g:onedark_color_overrides = {
\ "black": {"gui": "#2F343F", "cterm": "235", "cterm16": "0" },
\ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
\}

let s:comment_map = { 
    \   "go": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
		\		"php": '\/\/',
    \   "ruby": '#',
    \   "sh": '#',
    \   "bash": '#',
    \   "zsh": '#',
    \   "conf": '#',
    \   "config": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "zshrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \   "yml": '#',
    \   "yaml": '#',
    \ }

nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :vsplit<cr>
nnoremap <c-s> :w<cr>
nnoremap <c-p> :Files<cr>
nnoremap <c-d> :t.<cr>
nnoremap <c-f> :Ag<cr>
nnoremap <M-l> :bn<cr>
nnoremap <M-h> :bp<cr>
nnoremap <c-x> :bp\|bd #<cr>
nnoremap <C-b> :NERDTreeToggle<cr>
nnoremap <F4> :q<CR>
nnoremap <F4><Esc>:q<CR>
nnoremap <leader><space> :call ToggleComment()<cr> 
nnoremap <leader>t :TestFile<CR>
nnoremap <leader>l :TestLast<CR>
nnoremap <F6> :grep! "\<<cword>\>" . -r<CR>:copen<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " " 
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else 
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction


hi statusline ctermfg=none guifg=none ctermbg=none
hi Normal          ctermfg=252 ctermbg=none

" brew install ctags the_silver_searcher
" Ctrl+] - go to definition
" Ctrl+T - Jump back from the definition.

" Popup golang
" Shift+k
