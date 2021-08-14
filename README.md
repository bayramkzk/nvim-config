My NeoVim <=0.5 config mostly written in lua.

## Usage
- Clone the repo to your nvim config folder of your OS
- Install plugins by running `:PackerInstall`
- Install and compile TreeSitter parsers for languages of your choice by running `:TSInstall <lang>` for better syntax highlighting
  - You can use `:TSInstall maintained` to install *all* maintained parsers
- Install LSP clients of your choice using yarn (or using any other way) and make sure they are in PATH
  - Currently configured ones: `typescript-language-server`, `pyright`, `vscode-langservers-extracted`
- Install formatters of your choice and make sure they are in PATH
  - Currently configured ones: `prettier`, `rustfmt`, `luafmt`, `clang-format`

## Features
- Completion (native lsp, nvim-compe)
- File explorer (nvim-tree)
- Status line (lualine)
- Tab line (barbar)
- Colorscheme (tokyonight)
- Fuzzy file finder and previewer (telescope)
- Git gutter to indicate changed lines (gitsigns)
- Jump ability similar to easy-motion (hop)
- Auto close brackets, quotes and tags
- Comment lines (nvim-comment)

## TODO
- Improve README text and add images
- Add an offset to tab line (barbar) for file explorer (nvim-tree)
- Add a snippet plugin written in lua
- Set up LSP for HTML, CSS and Tailwind
- Add a plugin for surrounding selected text

