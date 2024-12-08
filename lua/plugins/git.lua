return {
	{

		"tpope/vim-fugitive",
		-- Can't use opts for fugitive, because it's not written in lua.
		config = function()
			vim.keymap.set("n", "<leader>ga", ":G add .<CR>")
			vim.keymap.set("n", "<leader>gc", ":G commit -m ''<Left>")
			vim.keymap.set("n", "<leader>gq", ":G commit . -m ''<Left>", { desc = "Remember by 'Git Quick commit'." })
			vim.keymap.set("n", "<leader>gp", ":G push<CR>")
			vim.keymap.set(
				"n",
				"<leader>gl",
				":G log --all --graph --decorate --oneline<CR><C-w>o",
				{ desc = "Show a tree of commit history" }
			)
			vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR><C-w>l", {
				desc = "Get the two-way diff view for the current buffer and focus the split with new changes. Easiest way to exit: `<C-w>o`",
			})
		end,
	},
	{
		-- Enables `:GB` for Github
		"tpope/vim-rhubarb",
	},
	{
		-- Enables `:GB` for Azure Devops
		"cedarbaum/fugitive-azure-devops.vim",
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
}
