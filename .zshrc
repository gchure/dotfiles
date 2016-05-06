# Path to zsh installation.
export ZSH=$HOME/.oh-my-zsh

#Set prompt theme.
ZSH_THEME="pure"

#Set the Base16 shell for nice-ass colorschemes.
BASE16_SHELL="/Users/gchure/.config/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


#Set various aliases 
alias sphinx-compile="sphinx-build -a -b html -d _build/doctrees   . _build/htm"
alias smk="sphinx-compile && cd ../ && make html && source/"
alias convert="ipython nbconvert --to html --template full_modified.tpl"
alias pandox="pandoc -s -S --reference-docx=/Users/gchure/pandoc_refs/ref.docx"
alias server="python -m http.server 8888 &"

#Quick movement. 
alias lab="cd ~/Lab/PhillipsLab201401-XXX/"
alias grad="cd ~/School/"
alias notebook="cd ~/Lab/PhillipsLab201401-XXX/notebook/"
alias desk="cd ~/Desktop/"
alias copypath="pwd|pbcopy"
alias jpn="jupyter notebook"


#Connect and move to frequently accessed servers.
alias mount-hermes="sh ~/shell_scripts/mount_hermes"
alias mount-bolt="sh ~/shell_scripts/mount_bolt"
alias mount-apollo="sh ~/shell_scripts/mount_apollo"
alias mount-bootcamp="sh ~/shell_scripts/mount_bootcamp"
alias hermes="cd ~/smb/hermes/"
alias bolt="cd ~/smb/bolt/"
alias apollo="cd ~/smb/apollo/"
alias spicybeef="sh ~/shell_scripts/spicybeef_sftp"
alias spicybeef-root="sh ~/shell_scripts/spicybeef_root"
alias spicybeef-ssh="sh ~/shell_scripts/spicybeef_ssh"
alias spicybeef-scp="sh ~/shell_scripts/spicybeef_scp"
alias spicybeef-retrieval="sh ~/shell_scripts/spicybeef_retrieval"
alias ssh-website="sh ~/shell_scripts/ssh_website"
alias scp-website="sh ~/shell_scripts/scp_website"
alias notes="sh ./notes.sh"

#Custom git aliases
alias gpom="git push origin master"
alias gpgh="git push origin gh-pages"
alias gcom="git commit -m "

#Alias for opening frequently used Applications
alias ran="ranger"
alias matlab="/Applications/MATLAB_R2015b.app/bin/matlab -nodesktop" #Fuck the GUI.
alias fiji="open /Applications/Fiji.app"
alias bean="java bsh.Interpreter"
alias chat="profanity -a griffinchure@gmail.com"

#Quick access to vimrc and zshrc files.
alias vim='nvim'
alias vimrc="nvim ~/.config/nvim/init.vim"
alias zshrc='nvim ~/.zshrc'
alias muttrc='nvim ~/.muttrc'
alias phoenix='nvim ~/.phoenix.js'


#For switching python distributions and versions.
alias py27='source activate py27' 

#Set PATH variables.
export MANPATH=/usr/local/man:$MANPATH
export PATH="/Users/gchure:/Users/gchure/anaconda/bin:$PATH"
export PATH=$PATH:/Users/gchure:/Users/gchure/anaconda/bin:usr/local/bin/:usr/bin:bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:Users/gchure:Users/gchure/anaconda/envs/py3/bin:$PATH
export PYTHONPATH=:.:/Users/gchure/anaconda/bin:/Users/gchure/python_code:/Users/gchure/lab/PhillipsLab201401-XXX/lab_code/hgt_analysis:/Users/gchure/lab/PhillipsLab201401-XXX/lab_code/image_processing:Applications/Micro-Manager1.4:$PYTHONPATH #:/usr/bin:/usr/local/bin:$
export EDITOR=/usr/local/bin/nvim


#export PATH="/USR/LOCAL/bin:$PATH"
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig:/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/Library/ENV/pkgconfig/10.10:$PKG_CONFIG_PATH

#Allow for matlab in ipython notebooks. 
export MATLAB_EXECUTABLE=/Applications/MATLAB_R2015b.app/bin/matlab

#ZSH Plugins and configurations.
plugins=(git, zsh-syntax-hightlighting, vi-mode) 
bindkey "jk" vi-cmd-mode #Maps 'jk' to escape in vi-mode.
source $ZSH/oh-my-zsh.sh
set CLICOLOR=1 #Allow for colors
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx #Allow for colors
source /Users/gchure/.iterm2_shell_integration.zsh #Shell integration.


#Allow for colored man pages. 
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode    
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan
