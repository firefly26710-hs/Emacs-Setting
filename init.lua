require("plugins.plugins-setup")
require("plugins.lualline")
require("plugins.bufline")
require("core.options")
require("plugins.comment")
require("plugins.smear-cursor")
require("core.keymaps")


vim.cmd[[colorscheme tokyonight-storm]]
--vim.cmd.colorscheme("gruber-darker")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "EndofBuffer", { bg = "none" })






