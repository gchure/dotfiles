"
"                                                     _..._   
"                                                  .-'_..._''.  
" .----.     .----..--. __  __   ___             .' .'      '.\ 
"  \    \   /    / |__||  |/  `.'   `.          / .'            
"   '   '. /'   /  .--.|   .-.  .-.   '.-,.--. . '              
"   |    |'    /   |  ||  |  |  |  |  ||  .-. || |              
"   |    ||    |   |  ||  |  |  |  |  || |  | || |              
"   '.   `'   .'   |  ||  |  |  |  |  || |  | |. '              
"    \        /    |  ||  |  |  |  |  || |  '-  \ '.          . 
"     \      /     |__||__|  |__|  |__|| |       '. `._____.-'/ 
"      '----'                          | |         `-.______ /  
"                                      |_|                  `   
"                                                               
"
				      
"Plugin loading via vim-plug
call plug#begin('~/.config/nvim/plugged') 

Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-scripts/LaTeX-BoX'
Plug 'tpope/vim-fugitive'
Plug 'kassio/neoterm'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'nvie/vim-flake8' 
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-obsession'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
"Plug 'mhinz/vim-startify'
"Plug 'davidhalter/jedi-vim'
call plug#end()

"Colorscheme information 
let base16colorspace=256
set background=dark
colorscheme base16-ocean

"Turn on line numbers by default. 
set number

"Set search preferences 
set incsearch 
set ignorecase 
set smartcase 
set hlsearch


"Force 79 char line wrapping. 
set tw=79

"Force gohu when editing RST files. 
autocmd FileType rst :Goyo <CR>
"Navigation key remappings 
imap jk <ESC>
map ;w :w <CR>
map :W :w  <CR>
map ;q :wq <CR>
map ;;q :q <CR> 
map :Q :q <CR>
map <C-W> <C-W><C-W>

" Define the local leader (important for Latex-box)
let maplocalleader = "\\"

"Shortcuts for commonly used directories. 
imap //. ../../../ 

"Remap keys for making splits. 
nnoremap sv :vsp<CR>
nnoremap sh :sp<CR>

"Vim-tmux-navigator bindings. 
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigotor_save_on_switch = 1
nnoremap <silent> <C-G> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>

"Vim-slime configuration
let g:slime_target = "tmux"
let g:slime_python_ipython = 1



"Neovim terminal emulator keybindings. 
nmap tp :T ipython<CR>  <C-W> :resize 15 <CR><C-W>
nmap tpv :Tpos vertical <CR>
nmap ,r :T  run % <CR><CR>	
vmap ,t y :T <C-R>" <CR>
nmap ,l v$ y ,t 
tnoremap <leader>e <C-\><C-n>


"Key mappings for frequently used comment breaks. 
nnoremap tt i% <C-o>:norm 79i-<CR><ESC>0
nnoremap tn i# <C-o>:norm 79i-<CR><ESC>0 
nnoremap <leader>ff  i# #########################<ESC>

"Git configuration. 
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gc :Git commit -m 'Autocommit from Vim.'<CR><CR>
nnoremap <leader>gp :Git push origin master <CR><CR>
nnoremap <leader>gg :Git add %:p\| :Git commit -m 'Autocommit from Vim.' \| :Git push origin master

"NERDTree configuration 
map <C-n> :NERDTreeToggle<CR>

"GoYo configuration.
nnoremap <C-E> :Goyo <CR>

"Flake8 checking (Pyflakes with PEP8)
autocmd FileType python map <buffer> ,fl :call Flake8()<CR>

"Allow copy/paste from system clipboard. 
set clipboard^=unnamed

"Statusline configuration 
set statusline+=%#NeotermTestRunning#%{neoterm#test#status('running')}%*
set statusline+=%#NeotermTestSuccess#%{neoterm#test#status('success')}%*
set statusline+=%#NeotermTestFailed#%{neoterm#test#status('failed')}%*

"Startify configuration.
"let g:startify_session_dir = '~/.config/nvim/session'
"let g:startify_list_order = [
"	\ ['Commonly used shit:'], 'bookmarks', 
"	\ ['Badass layouts and sessions:'], 'sessions', 
"	\ ['Recently fucked with files:'], 'files',
"	\ ['Recently fucked with files in this directory:'], 'dir']
"
"let g:startify_bookmarks = [ 
"			\{'Lab Notebook': '~/Lab/PhillipsLab201401-XXX/Lab_Notebook/source/2015/201511.rst'},
"			\{'HGT Utils': '~/Lab/PhillipsLab201401-XXX/lab_code/hgt_analysis/hgt_utils.py'},
"			\{'My folder': '~/Lab/PhillipsLab201401-XXX/lab_code/people/Griffin'},
"			\{'Thesis': '~/Lab/PhillipsLab201401-XXX/thesis'},
"			\{'Lab Papers': '~/Lab/PhillipsLab201401-XXX/lab_code/papers/'}]
"function! s:filter_header(lines) abort
"        let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
"        let centered_lines = map(copy(a:lines),
"            \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
"        return centered_lines
"    endfunction
"
"let g:startify_enable_special = 0 
"let g:startify_custom_indices = ['a', 'd', 'f', 'g', 'h', 'l', ';']
"let g:startify_custom_header = s:filter_header(map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['',''])

"Throw default text into new python file. 
autocmd bufnewfile *.py 0r ~/file_headers/py_skeleton.txt 
autocmd bufnewfile *.py exe "1," .10 . "g/File Name:.*/s/File Name: " expand("%")
autocmd bufnewfile *.py exe "1," .10 . "g/Creation Date:.*/s//Creation Date: " .strftime("%Y-%m-%d") 
autocmd bufwritepre,filewritepre *py execute "normal ma"
autocmd bufwritepost,filewritepost *py exe "1," .10 . "g/Last Modified:./*s/Last Modified:/*Last Modified: " .strftime("%Y-%m-%d")
autocmd bufwritepost,filewritepost *py execute "normal a"

