#!/bin/bash

# Download .zshrc

curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/.zshrc -o $HOME/.zshrc

xcode-select --install

# Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> $HOME/.zshrc

# Install formulae

for formula in $(curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/formulae)
do
	brew install $formula
done

# Install casks

for cask in $(curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/casks)
do
	brew install --cask $cask
done

# Install NVM 

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

nvm install --lts
nvm alias default node

# Install Rust

curl https://sh.rustup.rs -sSf | sh -s -- -y # this will run rustup without confirmation prompt

