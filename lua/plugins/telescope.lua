local centerCallback = function()
  vim.api.nvim_create_autocmd("CursorMoved", {
    once = true,
    callback = function()
      if vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" then
        vim.cmd("norm! zz")
      end
    end,
  })
end

local telescope = require("telescope")
return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    tag = "0.1.8",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", lazy = false },
        -- If the line below doesn't work, cd to %LOCALAPPDATA%/nvim-data/lazy/telescope-fzf and execute `make`
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
        config = function()
          telescope.load_extension("fzf")
        end,
      },
    },
    config = function()
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          layout_config = {
            horizontal = { width = 0.95, height = 0.95 }
          },
          path_display = { "smart" },
          mappings = {
            i = {
              ["<CR>"] = actions.select_default + actions.center,
            },
            n = {
              ["<CR>"] = actions.select_default + actions.center,
            },
          },
        },
        pickers = {
          find_files = {
            prompt_prefix = "file > "
          },
          live_grep = {
            prompt_prefix = "grep > "
          }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            },
          },
          advanced_git_search = {
            browse_command = "GBrowse {commit_hash}",
            diff_plugin = "fugitive",                -- one of fugitive or diffview
            show_builtin_git_pickers = false,
            entry_default_author_or_date = "author", -- one of "author" or "date"
            keymaps = {
              toggle_date_author = "<C-a>",
              open_commit_in_browser = "<C-o>",
              copy_commit_hash = "<C-y>",
              show_entire_commit = "<C-e>",
            },
          }
        }
      })

      require("telescope").load_extension("ui-select")

      vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set('n', '<leader>ls', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set("n", "<leader>gs", function() builtin.git_status() end, {})
      vim.keymap.set("n", ";", builtin.resume, {})
      vim.keymap.set("n", "gr", function()
        centerCallback()
        builtin.lsp_references()
      end, { desc = "Show a list of all references and center when selecting one of them" })
      vim.keymap.set("n", "gi", function()
        centerCallback()
        builtin.lsp_implementations()
      end, { desc = "Show a list of all imlpementations and center when selecting one of them" })
      vim.keymap.set("n", "gd", function()
        centerCallback()
        builtin.lsp_definitions()
      end, { desc = "Show a list of all definitions and center when selecting one of them" })
      vim.keymap.set("n", "gt", builtin.lsp_type_definitions, {})
      vim.keymap.set("n", "gs", builtin.treesitter, { desc = "Go to Symbols" })
      vim.keymap.set("n", "gq", builtin.quickfix, {})
    end,
  },
  {
    "aaronhallaert/advanced-git-search.nvim",
    cmd = { "AdvancedGitSearch" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-fugitive",
      "tpope/vim-rhubarb",
      "cedarbaum/fugitive-azure-devops.vim",
    },
    config = function()
      require("telescope").load_extension("advanced_git_search")
    end,
    keys = {
      {
        "<leader>gh",
        "<cmd>AdvancedGitSearch search_log_content<cr>",
        desc = "AdvancedGitSearch through git commit history",
      }
    },
  },
  {
    { 'nvim-telescope/telescope-ui-select.nvim' }
  }
}
