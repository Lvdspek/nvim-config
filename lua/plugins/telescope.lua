return
{
  'nvim-telescope/telescope.nvim',
  tag = '0.1.3',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', ';', builtin.resume, {})
    vim.keymap.set('n', 'gr', builtin.lsp_references, {})
    -- vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
    -- vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
    vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, {})
    vim.keymap.set('n', 'gq', builtin.quickfix, {})
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end)
  end
}