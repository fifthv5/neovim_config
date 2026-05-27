-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.filetype.add({
  extension = {
    nim = "nim",
    nims = "nim",
  },
})

-- =============================================================================
-- FIXED PATH NIM LANGUAGE SERVER CONFIGURATION
-- =============================================================================
local lspconfig = require('lspconfig')

-- Target the exact local nimble binary path matching standard Unix directory rules
local nim_binary_path = vim.fn.expand("$HOME/.nimble/bin/nimlangserver")

lspconfig.nim_langserver.setup({
  -- Force Neovim to invoke the absolute home path binary directly
  cmd = { nim_binary_path },

  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- LSP Standard Operational Shortcuts
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  end
})
