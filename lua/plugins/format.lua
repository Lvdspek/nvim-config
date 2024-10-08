return {
  'stevearc/conform.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        -- Conform will run the first available formatter
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    -- vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    --   conform.format({
    --     lsp_fallback = true,
    --     async = false,
    --     timeout_ms = 500,
    --   })
    -- end, { desc = "Format file or range (in visual mode)" })
  end
}
