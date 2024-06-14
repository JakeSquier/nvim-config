-- Set leader to space
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Require desired config
require("giga.core")
-- Require desired package manager
require("giga.lazy")