# Setup

## nvim-lspconfig
```bash
git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim/start/nvim-lspconfig
```

## Extra
- Install `ripgrep` for `mini.pick` plugin
```bash
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
```

## Debian Quick Start

- Main utils
```bash
sudo apt install zsh git htop curl

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
- Neovim
```bash
sudo apt install build-essential

git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim/start/nvim-lspconfig

curl -LO https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz
rm xzf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim

echo 'export PATH=$PATH:/opt/go/bin/:/opt/nvim/bin' >> .zshrc && source .zshrc

# TODO:
# git clone repository into config directory
```
## Languages
- Go
```bash
curl -LO https://go.dev/dl/go1.24.1.linux-amd64.tar.gz
tar xzf go1.24.1.linux-amd64.tar.gz
rm xzf go1.24.1.linux-amd64.tar.gz
sudo mv go /opt

/opt/go/bin/go install golang.org/x/tools/gopls@latest

echo 'export PATH=$PATH:$HOME/go/bin' >> .zshrc && source .zshrc
```
- Typescript
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

source .zshrc

nvm install --lts

npm install -g typescript-language-server typescript
```