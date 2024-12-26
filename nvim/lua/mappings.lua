require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", {desc = "Add breakpoint at a line"} )
map("n", "<leader>dr", "<cmd> DapContinue <CR>", {desc = "Start or continue the debugger"} )

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
