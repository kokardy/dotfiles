#!/bin/bash
set -x


# uv

curl -LsSf https://astral.sh/uv/install.sh | sh
uv install pynvim black isort ruff mypy ty

# mise

curl https://mise.run | sh
mise use -g tree-sitter

# bun
mise use -g bun

# rustup cargo
mise use -g rust
mise use -g cargo

##### curl -fsSL https://bun.com/install | bash
##### curl https://sh.rustup.rs -sSf | sh

# neovim
cargo install bob-nvim
bob install nightly
bob install latest

# dependencies

sudo apt-get install luarocks xsel
sudo bun install --global yarn tree-sitter prettier pyright neovim spectral-language-server
cargo install remark stylua ripgrep fd-find typos-cli

# font install

cd /tmp

wget "https://github.com/yuru7/moralerspace/releases/download/v2.0.0/MoralerspaceJPDOC_v2.0.0.zip"
unzip -D MoralerspaceJPDOC_v2.0.0.zip
mkdir -p ~/.fonts
cp MoralerspaceJPDOC_v2.0.0/*.ttf ~/.fonts/
fc-cache -v

rm -f ./MoralerspaceJPDOC_*.zip
rm -rf ./MoralerspaceJPDOC_*
