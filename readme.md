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
- [x] LSP Intellisense & Code completion
- [ ] Buffers
- [ ] Syntax highlighting
- [ ] Clipboard
- [ ] Tree
- [ ] Project history
- [ ] Fuzzyfinder
- [ ] Visual mode indentation
- [ ] Colors
- [ ] Throw an error if .cvim already exists
- [ ] Indent
- [ ] Keybinding
  - [ ] general normal mode, indenting multiple times on normal mode, comment, rename variable
  - [ ] buffer new, close, previous, next, rearrange
  - [ ] lsp definition, declaration, references, implementation, hover, signature, go back
  - [ ] debugging start, continue, stop, add breakpoint
  - [ ] navigation, tree
  - [ ] terminal, open, close, new, next, previous
  - [ ] git blame, history
  - [ ] format file
  - [ ] lsp info
- [ ] File type plugins
- [ ] Compilers
- [ ] Formatter
- [ ] Snippets
- [ ] Status line
- [ ] Debugger
- [ ] Logo and installation folders
- [ ] Dashboard
- [ ] Optimization
  - [ ] Optional plugins
  - [ ] Load all languages (ref: https://github.com/LunarVim/LunarVim/blob/95d8127f319d135001eb3fd07b30db3fd43d7ee4/lua/lvim/lsp/manager.lua)
  - [ ] Settings (reference vscode settings - ex: git blame on by default)
- Change structure to lua/*/{ ..., load.lua, init.lua }
