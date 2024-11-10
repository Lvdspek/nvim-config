return {
	{

		"tpope/vim-fugitive",
		-- Can't use opts for fugitive, because it's not written in lua.
		config = function()
			vim.keymap.set("n", "<leader>ga", ":G add .<CR>")
			vim.keymap.set("n", "<leader>gc", ":G commit -m ''<Left>")
			vim.keymap.set("n", "<leader>gqc", ":G commit . -m ''<Left>", { desc = "Remember by 'git quick commit'." })
			vim.keymap.set("n", "<leader>gp", ":G push<CR>")
			-- vim.keymap.set("n", "<leader>gg", ":G pull<CR>", { desc = "Remember by 'git get'." })
			--    vim.keymap.set("n", "<leader>gf", ":G fetch<CR>")
			vim.keymap.set(
				"n",
				"<leader>gl",
				":G log --all --graph --decorate --oneline<CR><C-w>o",
				{ desc = "Show a tree of commit history" }
			)
			vim.keymap.set("n", "<leader>gpom", ":G pull origin main<CR>")
			vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR><C-w>l", {
				desc = "Get the two-way diff view for the current buffer and focus the split with new changes. Easiest way to exit: `<C-w>o`",
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"tpope/vim-rhubarb",
	},
	{
		"cedarbaum/fugitive-azure-devops.vim",
	},
}
