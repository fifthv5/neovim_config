return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon", -- storm, night, moon, day
        transparent = true, -- enable this if you want your kitty background to show through
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  }
}

