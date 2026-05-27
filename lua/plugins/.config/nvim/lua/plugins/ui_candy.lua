return {
  -- 1. Custom Pill-Shaped, Colorful Statusline (Lualine)
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.component_separators = { left = "|", right = "|" }
      opts.options.section_separators = { left = "", right = "" }
    end,
  },

  -- 2. UPDATED: Animated Cursor Trails and Transitions (Using the new organization path)
  {
    "nvim-mini/mini.animate", -- Fixed: Changed from echasnovski to nvim-mini
    event = "VeryLazy",
    opts = function()
      local animate = require("mini.animate")
      return {
        cursor = { enable = true, timing = animate.gen_timing.linear({ duration = 150, unit = "total" }) },

        -- Disable mini.animate scrolling if your LazyVim is handling it via snacks.nvim
        scroll = { enable = false },

        resize = { enable = true },
        open = { enable = true },
        close = { enable = true },
      }
    end,
  },

  -- 3. Rainbow Colored Bracket and Parentheses Matching
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      local rainbow = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = { [""] = rainbow.strategy["global"] },
        query = { [""] = "rainbow-delimiters" },
      }
    end,
  },

  -- 4. Cinematic Smooth Scrolling Panning Effects
  {
    "declancm/cinnamon.nvim",
    event = "VeryLazy",
    config = function()
      require("cinnamon").setup({
        keymaps = {
          basic = true,
          extra = true,
        }
      })
    end,
  },
}
