return {
  -- 1. Download and configure the modern Nord engine
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({
        -- Enforce the cold Nord palette
        transparent = true,     -- Keeps your Kitty transparent background active
        terminal_colors = true, -- Passes exact colors to the built-in terminal

        -- Customizing text highlights to make Nord Frost pops even more visible
        overrides = function(colors)
          return {
            -- Frost blue accents for interactive elements
            FloatBorder = { fg = colors.frost02, bg = "none" },
            NormalFloat = { bg = "none" },

            -- Crisp neon overrides matching Nord's blueprint style
            ["@function"] = { fg = colors.frost03, bold = true }, -- Frost Cyan
            ["@keyword"] = { fg = colors.frost01, bold = true },  -- Frost Blue
            ["@string"] = { fg = colors.aurora04 },               -- Aurora Green
          }
        end,
      })
    end,
  },

  -- 2. Map LazyVim's master theme switch to Nord
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
    init = function()
      vim.o.background = "dark"
      vim.opt.termguicolors = true
    end,
  },
}
