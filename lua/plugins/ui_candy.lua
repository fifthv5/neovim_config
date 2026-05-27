return {
  -- 1. Modern Icy Nord Palette Engine with Transparency Enabled
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({
        transparent = true,     -- Lets Kitty's background shine through
        terminal_colors = true, -- Synchronizes integrated terminal windows
        overrides = function(colors)
          return {
            -- Floating windows float seamlessly without hard backgrounds
            FloatBorder = { fg = colors.frost02, bg = "none" },
            NormalFloat = { bg = "none" },

            -- High-contrast syntax enhancements
            ["@function"] = { fg = colors.frost03, bold = true },
            ["@keyword"] = { fg = colors.frost01, bold = true },
            ["@string"] = { fg = colors.aurora04 },
          }
        end,
      })
    end,
  },

  -- 2. Clean Pill-Shaped Statusline (Lualine)
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = "nord"
      opts.options.component_separators = { left = "|", right = "|" }
      opts.options.section_separators = { left = "", right = "" }
    end,
  },

  -- 3. Modern Cursor & Buffer Animation Flow
  {
    "nvim-mini/mini.animate",
    event = "VeryLazy",
    opts = function()
      local animate = require("mini.animate")
      return {
        cursor = { enable = true, timing = animate.gen_timing.linear({ duration = 120, unit = "total" }) },
        scroll = { enable = false }, -- Handled natively by LazyVim's snacks engine
        resize = { enable = true },
        open = { enable = true },
        close = { enable = true },
      }
    end,
  },

  -- 4. Vibrant Rainbow Bracket Matching
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

  -- 5. Master Theme Management & Line Number Highlights
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
    init = function()
      vim.o.background = "dark"
      vim.opt.termguicolors = true
      vim.opt.clipboard = "unnamedplus" -- Clipboard sync
      vim.opt.mouse = "a"               -- Mouse capture activated

      -- Line number styling (Guaranteed to execute post-theme initialization)
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          -- Subtly dimmed line numbers for zero distraction
          vim.api.nvim_set_hl(0, "LineNr", { fg = "#4c566a", bold = false })
          vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#4c566a", bold = false })
          vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#4c566a", bold = false })

          -- Electric neon ice-cyan for the active row position
          vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#8fbcbb", bold = true })

          -- Tint stock dashboard items to a rich blue
          vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#8fbcbb", bold = true })
          vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#88c0d0" })
          vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#88c0d0" })
          vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#81a1c1", bold = true })
          vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "#4c566a", italic = true })
        end,
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    main = "ibl",
    opts = {
      indent = {
        char = "│", -- Sleek minimal vertical line
        tab_char = "│",
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = { "IblScope" }, -- Custom highlight mapping
      },
    },
    config = function(_, opts)
      require("ibl").setup(opts)
      -- Force the active code indentation block to flash in Frost Blue
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#88c0d0", bold = true })
    end,
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "BufReadPost",
    opts = {
      bar = {
        pick = {
          pivots = "abcdefghijklmnopqrstuvwxyz",
        },
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- Keys to activate the flash jump
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Teleport Jump" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    opts = {
      signs = {
        add          = { text = "┃" },
        change       = { text = "┃" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
        untracked    = { text = "┆" },
      },
      signcolumn = true, -- Toggles the margin visibility
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
      -- Anchor the colors directly to your custom Nord profile
      vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#a3be8c" })    -- Aurora Green
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ebcb8b" }) -- Aurora Yellow
      vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#bf616a" }) -- Aurora Red
    end
  },
}
