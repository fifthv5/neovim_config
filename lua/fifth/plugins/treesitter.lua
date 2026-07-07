return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local disable_markdown = vim.fn.has("nvim-0.12") == 1

    -- Changed ".configs" to ".config" (Removed the 's')
    local treesitter = require("nvim-treesitter.config")

    -- Setup the modern autotag standalone instance 
    require("nvim-ts-autotag").setup()

    -- Register alternative extensions for language parsers
    vim.treesitter.language.register("haskell", "lhaskell")

    -- Configure treesitter with the new API layout
    treesitter.setup({ 
      highlight = {
        enable = true,
        disable = disable_markdown and { "markdown", "markdown_inline" } or {},
      },
      
      -- Treesitter indent can override normal `o`/`O` newline indent behavior.
      indent = { enable = false },

      --Removed deprecated nested "autotag" table from here

      -- Ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "cpp",
        "haskell",
        "gdscript",
        "gdshader",
        "godot_resource",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}

