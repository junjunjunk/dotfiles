#!/usr/bin/zsh

printf "[Starting zsh setup]\n"

# Create symlink
ln -s `pwd`/zsh/zshrc.zsh $HOME/.zshrc
ln -s `pwd`/zsh/zshenv.zsh $HOME/.zshenv


printf "Installation is completed.\n"