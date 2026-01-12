-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.opt.wrap = false

-- ========================================================================== --
--                          LANGUAGE SPECIFIC INDENT                          --
-- ========================================================================== --

-- Global Defaults (Fallback)
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Helper function to set indentation locally for a buffer
local function set_indent(size)
  vim.opt_local.shiftwidth = size
  vim.opt_local.tabstop = size
  vim.opt_local.softtabstop = size
end

-- Create an autocommand group to prevent duplication on reload
local indent_group = vim.api.nvim_create_augroup("IndentSettings", { clear = true })

-- 2-Space Standard: Web, Ruby, Lua
vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = {
    "ruby", "lua", "javascript", "typescript",
    "javascriptreact", "typescriptreact", "css", "html", "json"
  },
  callback = function()
    set_indent(2)
  end,
})

-- 4-Space Standard: Systems, Backend, Documentation
vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = {
    "python", "rust", "cs", "php", "java",
    "c", "cpp", "markdown", "text"
  },
  callback = function()
    set_indent(4)
  end,
})

-- Prose-specific settings: Wrap and Linebreak for Text and Markdown
vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true       -- Enable soft wrapping
    vim.opt_local.linebreak = true  -- Don't break words in half
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = "copilot-chat",
  callback = function()
    -- Disables blink autocompletion for this specific buffer
    vim.b.blink_cmp_enabled = false
  end,
})


