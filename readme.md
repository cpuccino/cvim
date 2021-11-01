### CVim

Neovim configuration built on Lua **Requires Neovim v0.5.0**

### Requirements
- [ ] Git
- [ ] Neovim v0.5.0+
- [ ] Clipboard manager (ie: xsel, xclip, pbcopy)
- [ ] Python, Pip & Pynvim
- [ ] Nodejs & Neovim

#### TODO

- [x] Spacing
- [x] Undo & Redo persistent history
- [x] Initial configuration plugins
- [x] Syntax highlighting
- [ ] IDE Core
  - [ ] Buffers
  - [ ] Clipboard
  - [ ] Tree
  - [ ] Fuzzyfinder
  - [ ] Debugger
  - [ ] Status line
  - [ ] Dashboard
  - [ ] Project history
  - [x] Intellisense
  - [x] Code completion
- [ ] Keybinding
  - [ ] general normal mode, indenting multiple times on visual & normal mode, comment, rename variable
  - [ ] buffer new, close, previous, next, rearrange
  - [ ] lsp definition, declaration, references, implementation, hover, signature, go back
  - [ ] debugging start, continue, stop, add breakpoint
  - [ ] navigation, tree
  - [ ] terminal, open, close, new, next, previous
  - [ ] git blame, history
  - [ ] format file
  - [ ] lsp info
- [ ] QoL
  - [ ] File type plugins
  - [ ] Compilers
  - [ ] Formatter
  - [ ] Snippets
- [ ] Settings (reference vscode settings - ex: git blame on by default)
- [ ] Theming (ie: colors, component design - buffers, tree, status line, terminal)
- [ ] Auto install requirements
- [ ] Optimization
  - [ ] Optional plugins
  - [ ] Load all languages (ref: https://github.com/LunarVim/LunarVim/blob/95d8127f319d135001eb3fd07b30db3fd43d7ee4/lua/lvim/lsp/manager.lua)
- [ ] Refactor - Change structure to lua/*/{ ..., load.lua, init.lua }
- [ ] Warn on override (ex: Throw an error if .cvim already exists)
- [ ] Logger (ie: keep track of load errors and time)
- [ ] Add setup steps, settings, and configuration and move documentation to Private storage
- [ ] Logo and installation folders