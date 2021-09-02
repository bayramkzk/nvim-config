My NeoVim config written in Lua with native NeoVim LSP and many more features.

Requires at least NeoVim version 0.5.

I only tested in Linux but I suppose there is no reason for it to not run on any other Unix system (e.g MacOS, BSD).

## Installation
```
mkdir -p ~/.config/nvim/
cd ~/.config/nvim/
git clone git@github.com:bayram-kazik/nvim-config.git .
```

## Usage
- Install plugins by running `:PackerInstall`.
- Install and compile TreeSitter parsers for languages of your choice by running `:TSInstall <lang>` for better syntax highlighting. You can also use `:TSInstall maintained` to install *all* maintained parsers.
- Install LSP clients of your choice by running `:LspInstall <lang>`.
- Install formatters of your choice and make sure they are in PATH. Currently configured ones:
  - `prettier` for `html`, `css`, `javascript`, `typescript`, `javascriptreact`, `typescriptreact`, `json`, `yaml`, `markdown`
  - `rustfmt` for `rust`
  - `luafmt` for `lua`
  - `clang-format` for `c`, `cpp`

## Features
- LSP completion (`lspconfig`, `lspinstall`, `nvim-compe`)
- Snippets (`luasnip`, `friendly-snippets`)
- File explorer (`nvim-tree`)
- Status line (`lualine`)
- Tab line (`barbar`)
- Colorschemes (`gruvbox`, `tokyonight`)
- Fuzzy file finder and previewer (`telescope`)
- Git gutter and git blame (`gitsigns`)
- Jump ability similar to easy-motion (`hop`)
- Auto close brackets, quotes and tags (`nvim-autopairs`, `nvim-ts-autotag`)
- Comment lines (`nvim-comment`)

## TODO
- Automate the formatter installation process
- Add an offset to tab line (`barbar`) for file explorer (`nvim-tree`)
- Support surrounding selected text with a keymap
- Improve README text and add images
