# myrcfiles

FOR PUTTY
make sure you are forwarding xterm-256

FOR VIM
Vimrc may misbehave bevause of the line encoding
if using vim then save ~/.vim/vimrc
if nvim then save ~/.vim/init.vim
open vimrc then save to change end line encoding :w ++ff=unix
close

install plug by junegunn/vim-plug
using the online instructions

head into the vimrc file
make sure that the plug directory makes sense to this workstation
:PlugInstall and probably upgrade/update

after this it should load correclty
