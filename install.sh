#!/bin/bash
echo "Installing..."


sudo apt update
xargs sudo apt install -y < packages.txt


if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions 2>/dev/null
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting 2>/dev/null
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions 2>/dev/null


curl -sS https://starship.rs/install.sh | sh -s -- -y


mv ~/.zshrc ~/.zshrc.old 2>/dev/null
mv ~/.config/starship.toml ~/.config/starship.toml.old 2>/dev/null
ln -sf ~/dotfiles/zshrc_backup ~/.zshrc
mkdir -p ~/.config
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml


tldr --update
echo "Done."