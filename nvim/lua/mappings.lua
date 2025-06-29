require "nvchad.mappings"

-- add yours here


local map = vim.keymap.set


-- Luasnip manual keybindings (without nvim-cmp)

-- Expand snippet or jump to next placeholder
map({ "i", "s" }, "<Tab>", function()
  local ls = require("luasnip")
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, { silent = true, desc = "Luasnip expand or jump" })

-- Jump to previous placeholder
map({ "i", "s" }, "<S-Tab>", function()
  local ls = require("luasnip")
  if ls.jumpable(-1) then
    ls.jump(-1)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", false)
  end
end, { silent = true, desc = "Luasnip jump backward" })

-- CPP run cmd
map("n", "<F5>", function()
  require("nvchad.term").runner {
    id = "run_cpp",
    pos = "sp",
    clear_cmd = true,

    cmd = function()
      local file = vim.fn.expand "%"
      local cmd = "./build.sh " .. file

      return cmd
    end,
  }
end, { desc = "run cpp program" })

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at a line" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Leetcode mappings
map("n", "<leader>lc", "<cmd> Leet console <CR>", {desc = "Open leetcode console"})
map("n", "<leader>li", "<cmd> Leet info <CR>", {desc = "Open question info"})
map("n", "<leader>lt", "<cmd> Leet tabs <CR>", {desc = "Open currently open tabs"})
map("n", "<leader>ly", "<cmd> Leet yank <CR>", {desc = "Leet: yank solution"})
map("n", "<leader>ll", "<cmd> Leet lang <CR>", {desc = "Change language of current question"})
map("n", "<leader>lrn", "<cmd> Leet run <CR>", {desc = "Run current question"})
map("n", "<leader>ls", "<cmd> Leet submit <CR>", {desc = "Submit current question"})
map("n", "<leader>lR", "<cmd> Leet random <CR>", {desc = "Open random question"})
map("n", "<leader>ld", "<cmd> Leet daily <CR>", {desc = "Open today's question"})
map("n", "<leader>lls", "<cmd> Leet list <CR>", {desc = "Open problem list picker"})
map("n", "<leader>lo", "<cmd> Leet open <CR>", {desc = "Open current question in browser"})
map("n", "<leader>lrs", "<cmd> Leet reset <CR>", {desc = "Reset current question to default code"})
map("n", "<leader>llc", "<cmd> Leet last_submit <CR>", {desc = "Retrieve last submitted code"})
map("n", "<leader>lre", "<cmd> Leet restore <CR>", {desc = "Restore default question layout"})
map("n", "<leader>lij", "<cmd> Leet inject <CR>", {desc = "Re-inject code for current question"})
map("n", "<leader>le", "<cmd> Leet exit <CR>", {desc = "Exit Leetcode window"})
