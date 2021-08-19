My NeoVim <=0.5 config mostly written in lua.

## Usage
- Clone the repo to your nvim config folder of your OS
- Install plugins by running `:PackerInstall`
- Install and compile TreeSitter parsers for languages of your choice by running `:TSInstall <lang>` for better syntax highlighting
  - You can use `:TSInstall maintained` to install *all* maintained parsers
- Install LSP clients of your choice using yarn/npm (or in any other way) and make sure they are in PATH. Currently configured ones:
  - `typescript-language-server` for javascript, typescript
  - `pyright` for python
  - `vscode-langservers-extracted` for html, css
  - `tailwindcss-language-server` for tailwindcss
- Install formatters of your choice and make sure they are in PATH. Currently configured ones:
  - `prettier` for html, css, js, json, yaml, markdown
  - `rustfmt` for rust
  - `luafmt` for lua
  - `clang-format` for c, c++

## Features
- Completion (native lsp, nvim-compe)
- Snippets (luasnip, friendly-snippets)
- File explorer (nvim-tree)
- Status line (lualine)
- Tab line (barbar)
- Colorscheme (tokyonight)
- Fuzzy file finder and previewer (telescope)
- Git gutter and git blame (gitsigns)
- Jump ability similar to easy-motion (hop)
- Auto close brackets, quotes and tags
- Comment lines (nvim-comment)

## TODO
- Improve README text and add images
- Add an offset to tab line (barbar) for file explorer (nvim-tree)
- Add a plugin for surrounding selected text

