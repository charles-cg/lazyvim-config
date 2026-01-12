return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mason.nvim",
      "nvim-dap",
    },
    config = function()
      require("mason-nvim-dap").setup({
        -- A list of debug adapters to automatically install
        ensure_installed = { "cpptools", "codelldb" },
      })
    end,
}
