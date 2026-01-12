return {
  "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Load late for performance
    priority = 1000,
    config = function()
  require("tiny-inline-diagnostic").setup({
    options = {
      -- This allows the diagnostic to wrap if it's too long
      softwrap = 15, -- Amount of padding on the right before wrapping
    },
  })
  -- Important: Disable the default Neovim virtual text so they don't overlap
  vim.diagnostic.config({ virtual_text = false })
    end,
}
