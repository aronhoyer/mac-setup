#!/bin/bash

# Download .zshrc

curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/.zshrc -o $HOME/.zshrc
curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/.fs_aliases -o $HOME/.fs_aliases
curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/.git_aliases -o $HOME/.git_aliases

echo '' >> $HOME/.zshrc
echo 'source $HOME/.fs_aliases' >> $HOME/.zshrc
echo 'source $HOME/.git_aliases' >> $HOME/.zshrc

xcode-select --install

# Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo '' >> $HOME/.zshrc
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> $HOME/.zshrc

# Install formulae

xargs brew install < "$(curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/formulae)"

# Install casks

xargs brew install --cask < "$(curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/casks)" 

# Install NVM

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

nvm install --lts
nvm alias default node

# Install Rust

curl https://sh.rustup.rs -sSf | sh -s -- -y # this will run rustup without confirmation prompt

echo '' >> $HOME/.zshrc
echo 'export PATH="$PATH:$HOME/.cargo/bin:$(go env GOPATH)/bin:$(go env GOROOT)/bin"' >> $HOME/.zshrc

