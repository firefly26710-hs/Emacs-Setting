local opt = vim.opt


---deleay---
opt.timeoutlen = 200

---外部複製貼上---
opt.clipboard = "unnamedplus"

--行號
opt.relativenumber = true
opt.number = true

--對齊
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

--外觀
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.guicursor = "a:block-Cursor"

