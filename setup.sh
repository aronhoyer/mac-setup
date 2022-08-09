#!/bin/bash

# Download .zshrc
echo "Downloading dotfiles..."
curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/.zshrc -o $HOME/.zshrc
curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/.fs_aliases -o $HOME/.fs_aliases
curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/.git_aliases -o $HOME/.git_aliases

echo 'source $HOME/.fs_aliases' >> $HOME/.zshrc
echo 'source $HOME/.git_aliases' >> $HOME/.zshrc

xcode-select --install

# Install Homebrew
if ! command -v brew &> /dev/null
then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> $HOME/.zshrc
fi

# Install brew formulae
for formula in $(curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/formulae)
do
	brew install $formula
done

# Install brew casks
for cask in $(curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/casks)
do
	brew install --cask $cask
done

# Install Rust
if ! command -v rustup &> /dev/null
then
	echo "Installing Rust..."
	curl https://sh.rustup.rs -sSf | sh -s -- -y # this will run rustup without confirmation prompt
fi

printf 'export NVM_DIR="$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # load nvm bash_completion' >> $HOME/.zshrc

echo 'export PATH="$PATH:$HOME/.cargo/bin:$(go env GOPATH)/bin:$(go env GOROOT)/bin"' >> $HOME/.zshrc

source $HOME/.zshrc

echo "Installing Node LTS..."
nvm install --lts
nvm use --lts
nvm alias default node
