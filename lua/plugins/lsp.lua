return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Explicitly tell the server layout to ignore Mason and look at $PATH
      servers = {
        -- Enable Python
        pyright = { mason = false },

        -- Enable JavaScript / TypeScript
        ts_ls = { mason = false },

        -- Enable HTML & CSS
        html = { mason = false },
        cssls = { mason = false },

        -- Enable Rust
        rust_analyzer = { mason = false },
      },
    },
  },
}
