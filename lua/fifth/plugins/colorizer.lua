return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      filetypes = { "*" }, -- Enable highlighting for all file extensions
      user_default_options = {
        RGB = true,          -- #RRGGBB hex codes
        RRGGBBAA = true,      -- #RRGGBBAA hex codes
        AARRGGBB = true,      -- 0xAARRGGBB hex codes
        rgb_fn = true,        -- CSS rgb() and rgba() functions
        hsl_fn = true,        -- CSS hsl() and hsla() functions
        css = true,           -- Enable all CSS features
        css_fn = true,        -- Enable all CSS functions
        mode = "background",  -- Set the color match mode: background, foreground, or underline
        tailwind = true,      -- Enable tailwind colors support
      },
    })
  end,
}

