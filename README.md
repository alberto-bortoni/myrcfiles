# myrcfiles

FOR PUTTY
make sure you are forwarding xterm-256

FOR VIM
Vimrc may misbehave bevause of the line encoding.
if using vim, then save ~/.vim/vimrc
if using nvim, then save ~/.config/nvim/init.vim
open vimrc then save again to change endline encoding 
:w ++ff=unix
close

install plug by junegunn/vim-plug
using the online instructions

head into the vimrc file
change the Cd line or comment if not needed in this workstation
make sure that the plug directory makes sense to this workstation
:PlugInstall and probably upgrade/update

BASH
check TERM
echo $TERM to see what is the current setting.
The result should be:xterm-256color or screen-256color.

To define the TERM:
export TERM=xterm-256color
after this it should load correclty

source ~/.bashrc
