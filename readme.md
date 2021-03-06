### CVim

Neovim configuration built on Lua **Requires Neovim v0.6.0**

### Requirements
- [ ] Git
- [ ] Neovim v0.6.0+
- [ ] Clipboard manager (ie: xsel, xclip, pbcopy)
- [ ] Python, Pip & Pynvim
- [ ] Nodejs & Neovim
- [ ] Terminal using a patched font (NerdFont)
- [ ] Ripgrep

#### TODO

- [x] Undo & Redo persistent history
- [x] Plugin installer
- [ ] Syntax highlighting
- [ ] IDE Core
  - [ ] Buffers
  - [x] Clipboard
  - [ ] Tree
  - [ ] Fuzzyfinder
  - [ ] Debugger
  - [ ] Status line
  - [ ] Dashboard
  - [ ] Project history
  - [ ] Intellisense
  - [x] Code completion
- [ ] Keybinding
  - [ ] general normal mode, indenting multiple times on visual & normal mode, comment, rename variable
  - [ ] buffer new, close, previous, next, rearrange
  - [ ] lsp definition, show / go to references, show / go to source
  - [ ] debugging start, continue, stop, add breakpoint
  - [ ] navigation, tree
  - [ ] terminal, open, close, new, next, previous
  - [ ] git blame, history
  - [ ] format file
- [ ] QoL
  - [ ] File type plugins
  - [ ] Compilers
  - [ ] Formatter
  - [ ] Snippets
  - [ ] Code folding
  - [ ] Sessions
- [ ] Settings (reference vscode settings - ex: git blame on by default)
- [ ] Theming (ie: colors, component design - buffers, tree, status line, terminal)
- [ ] Auto install requirements
- [ ] Optimization
  - [ ] Optional plugins
  - [ ] Install all languages and load them when buffer loads instead of having to `LspInstall <language>` (ref: https://github.com/LunarVim/LunarVim/blob/95d8127f319d135001eb3fd07b30db3fd43d7ee4/lua/lvim/lsp/manager.lua)
  - [ ] Install all treesitter and load them when buffer loads instead of having to `LspInstall <language>`
- [ ] Refactor - Change structure to lua/*/{ ..., load.lua, init.lua } and /lua/package https://github.com/luan/nvim/blob/main/init.lua and https://github.com/nvim-telescope/telescope.nvim/tree/master/lua/telescope and 
- [ ] Logger (ie: keep track of load errors and time)
- [ ] Add setup steps, settings, and configuration and move documentation to Private storage
- [ ] Logo and installation folders
- [ ] Use prequire https://github.com/shift-d/nv/search?p=2&q=prequire
- [ ] Warn on override (ex: Throw an error if .cvim already exists)
- [ ] Rename setup, configure, and post_setup - cause setup conflicts with [plugin].setup
- [ ] Make kinds symbol snake case
- [ ] Show hidden files in fuzzysearch https://github.com/skbolton/titan/blob/4d0d31cc6439a7565523b1018bec54e3e8bc502c/nvim/nvim/lua/mappings/filesystem.lua#L6

#### Tips
- [ ] Rebind Ctrl to Caps Lock