# Simple shell script for bootstrapping a Mac for development

This is only based on my preferred tools and apps.

## Usage

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/setup.sh)"
```

### Downloading dotfiles

This is done automatically by `setup.sh`, so no need to manually download each dotfile,
but if you need to, you can run

```sh
curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/.[zshrc|fs_aliases|git_aliases] -o /path/to/output
```

**Example:**

```sh
curl -fsSL https://raw.githubusercontent.com/aronhoyer/mac-setup/HEAD/.zshrc -o $HOME/.zshrc
```

## Command Line Tools

- [Git](https://git-scm.com)
- [Go](https://go.dev)
- [NVM](https://github.com/nvm-sh/nvm)
- [pnpm](https://pnpm.io)
- [Zsh](https://zsh.sourceforge.io)

## Apps

- [AltTab](https://alt-tab-macos.netlify.app)
- [Figma](https://figma.com)
- [Iterm2](https://iterm2.com)
- [Postman](https://www.postman.com)
- [Rectangle](https://rectangleapp.com)
- [Sublime Text](https://sublimetext.com)
- [UTM](https://getutm.app)
- [Visual Studio Code](https://code.visualstudio.com)
