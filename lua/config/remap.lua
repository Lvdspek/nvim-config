local map = vim.keymap.set

-- Editing
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "switch the currently selected line and the line below, then format" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "switch the currently selected line and the line above, then format" })
map("i", "<C-H>", "<C-W>", { noremap = true, desc = "sets <C-BS> to <C-W>" })

map("n", "<leader>f", vim.lsp.buf.format)

map("n", "<leader>rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "find and RePlace word under cursor" })

-- Clipboard actions
map("n", "<C-a>", "ggVG")
map("v", "y", "ygv<esc>", { remap = true, desc = "stay in visual mode after yanking" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "copy to system clipboard" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "delete and send the deleted text to the void register" })
map("x", "<leader>p", '"_dP', { desc = "keep your selection in register when pasting over another selection" })

-- Commenting
map("n", "<C-_>", "Vgc", { remap = true })
map("v", "<C-_>", "gc", { remap = true })

-- Navigating
map({ "n", "v" }, "H", "^", { remap = true })
map({ "n", "v" }, "L", "$", { remap = true })
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Viewport
map("n", "<leader>rc", "<cmd>set conceallevel=0<CR>", { desc = "Reset Conceallevel" })

-- Exiting
map("i", "<C-c>", "<Esc>")
map("n", "Q", "<nop>")
