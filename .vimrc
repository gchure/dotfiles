set nocompatible 			"Use Vim settings instead of vi.
let &t_Co=256 	 			"256 color support.
set backspace=indent,eol,start 		" allow backspacing over everything in insert mode
if has("vms")
  set nobackup				" do not keep a backup file, use versions instead
else
  set backup				" keep a backup file
endif
set history=50				" keep 50 lines of command line history
set ruler				" show the cursor position all the time
set showcmd				" display incomplete commands
set incsearch				" do incremental searching
set autochdir 				"Automatically changes to working directory
if has('mouse') 			"Allow mouse support 
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  "Also load indent files, to automatically do language-dependent indenting.

  filetype plugin indent on
  

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Call Pathogen
call pathogen#infect()
call pathogen#helptags()

" Important shit for good LaTeX integration.
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'
let g:LatexBox_autojump =1
let g:LatexBox_Folding = 1
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_output_type = 'pdf'
let g:LatexBox_viewer = 'open -a /Applications/Preview.app'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_TreatMacViewerAsUNIX = 1
let g:Tex_ExecuteUNIXViewerINForeground = 1
let g:Tex_ViewRule_ps = 'open -a Skim'
let g:Tex_ViewRule_pdf = 'open -a /Applications/Skim.app'
let g:Tex_ViewRule_dvi = 'open -a /Applications/texniscope.app'


"Configuration of syntastic.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq  = 0 


let base16colorspace=256
 "Colors and other custom configuration
colorscheme base16-ashes
"lucius
set background=dark "Light schemes are for chumps.
set spelllang:en_us

hi clear SpellBad
autocmd FileType *.* set cole=0
autocmd FileType *.* hi Comment ctermbg=00 ctermfg=05
autocmd BufNewFile,BufRead *.rst set spell 
autocmd BufNewFile,Bufread *.tex set spell 
"autocmd FileType *.rst hi SpellBad ctermfg=01 ctermbg=235
"autocmd FileType *.tex hi SpellBad ctermfg=01 ctermbg=235
let g:goyo_height=100
let g:goyo_width=95
nnoremap <C-E> :Goyo <CR>
"Allow for highlighting of spelling errors.
" Settings for default MacVim launch. 
set number " Show line number. 
" Set search preferences.

set incsearch
set ignorecase
set smartcase
set hlsearch

"Make comments italicized. 
"autocmd FileType * highlight Comment cterm=italic
autocmd FileType * set cc=80 
autocmd FileType * highlight ColorColumn ctermbg=236
autocmd FileType *.tex set cole=0
"Set default things for specific file types
"LaTeX"

"Rst/md""
autocmd FileType * set tw=80
autocmd FileType *.rst set syntax=rst

"Python"
autocmd FileType *.py set cc=80 
autocmd FileType *.py set tw=80 
autocmd bufnewfile *.py 0r ~/file_headers/py_skeleton.txt
autocmd bufnewfile *.py exe "1," . 10 . "g/File Name:.*/s//File Name: " .expand("%")
autocmd bufnewfile *.py exe "1," .10 . ":g/Creation Date:.*/s//Creation Date: " .strftime("%Y-%m-%d")
autocmd Bufwritepre,filewritepre *.py execute "normal ma"
"autocmd Bufwritepre,filewritepre *.py exe "1," . 10 . "g/Last Modified:.*/s/Last Modified:.*/Last Modified: " .strftime("%Y-%m-%d")  
"autocmd Bufwritepost,filewritepost *.py execute "normal `a`"


"Remapping keys to my liking. 
imap jk <Esc> 
imap //.  ../../../
map cdl cd /Users/gchure/Desktop/Lab/PhillipsLab201401-XXX/Lab_Notebook/source/2014/
map zx :w !detex \| wc -w<CR>
map cdl :chdir /Users/gchure/Desktop/Lab/PhillipsLab201401-XXX/Lab_Notebook/source/ 
imap :utf #-*- coding: utf-8 -*-
nnoremap <leader>lv :LatexBox_viewer <CR><CR>
nnoremap <leader>xx :!xelatex % <CR> <CR>
nnoremap <space>c \ll
nnoremap <space>ga  :Git add %:p<CR><CR>
nnoremap <space>gc  :Git commit -m "Autocommit from Vim." <CR><CR>
nnoremap git :Git add %:p \| :Git commit -m "Autocommit from Vim" \| :Git push origin master<CR><CR>
nnoremap ;w :w <CR> \ll 
nnoremap <C-W> <C-W><C-W>
nnoremap <D-X> <C-D>
nnoremap <D-Y> <C-U>
nnoremap :W :w<CR>
nnoremap :Q :q<CR>

"Makes a 80 character line of %---
nnoremap tt  i% <C-o>:norm 79i-<CR><ESC>0
"Same as above with hash.
nnoremap tn i# <C-o>:norm 79i-<CR><ESC>0
nnoremap ff i# ###############################<ESC>

"Open Nerd tree
nmap e :NERDTreeToggle <CR>
map Q gq 			
"Remap for horizontal and vertically split windows. 
nnoremap vs :Vex<CR>
nnoremap vc :Sex<CR>
nnoremap <C-L> :Limelight <CR>


"Remap for switching tabs.
nnoremap ;; gt
nnoremap '' gT
"Remap to avoid common spelling errors. 
imap teh the
imap THe The
imap THis This 

"Allow for vim-airline let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

"Stop the formation of backup and swap files. 
set nobackup
set nowritebackup
set noswapfile 

"""GUI Macvim Settings""""""
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
set guioptions-=T  "Remove toolbar at top. 
set guioptions-=r " Remove right scrollbar.  


""""Defualt .vimrc configuration I don't really care about."
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>



""""SHIT I DON'T LIKE BUT AM TOO AFRAID TO DELETE"""""""""""""""""""""""""""
"Set the tex conceal options. Allows display of LaTeX characters as unicode.
"I decided this sucks but I keep it here anyway incase I want it.
"set cole=2 " conceal level
"set cocu=n "only shows actual LaTeX when in insert mode. 
"Conceal in tex file: 'admgs', a = accents, d = delimiters, m = math symbols, g
"= Greek, s = super/sub scripts:
"let g:tex_conceal="admgs"
"Set the colors so they blend with molokai. 
"hi Conceal  guibg=NONE guifg=NONE

