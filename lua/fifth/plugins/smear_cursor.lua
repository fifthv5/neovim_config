return {
  {
    "https://github.com/sphamba/smear-cursor.nvim",
    config = function()
      require("smear_cursor").setup({
      	      smear_insert_mode = true,
      	      smear_between_buffers = true,
      })
    end,
  },
}
