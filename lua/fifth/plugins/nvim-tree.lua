return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    nvimtree.setup({
      sync_root_with_cwd = true,
      respect_buf_cwd = false,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        side = "left",
        width = 32, -- Clean, compact sidebar width
        preserve_window_proportions = true,
      },
      git = { 
        enable = true, 
        ignore = false,
      },
      
      -- REMOVE CONFIRMATION PROMPTS
      ui = {
        confirm = {
          remove = false, -- Disables "Are you sure you want to delete?" prompt
          trash = false,  -- Disables confirmation when moving to trash
        },
      },
      actions = {
        open_file = {
          quit_on_open = false,
          resize_window = true,
        },
        change_dir = {
          enable = false, -- Stops prompt asking to change global directory
          global = false,
        },
      },

      -- SILENCE NOTIFICATIONS TO PREVENT "PRESS ENTER" PROMPTS
      notify = {
        threshold = vim.log.levels.ERROR, -- Only show messages if a system crash occurs
      },

      -- MODERN VISUAL STYLING
      renderer = {
        root_folder_label = false,       -- Hides the bulky absolute path at the top
        highlight_opened_files = "name", -- Highlights currently opened files cleanly by name
        highlight_git = "name",          -- Colors filenames based on git state (modified/added)
        
        -- Custom elegant, wireframe folder and chevron icons
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "  ",
            symlink = "",
            folder = {
              arrow_open = "",   -- Clean chevron down
              arrow_closed = "", -- Clean chevron right
              default = "",
              open = "",
              empty = "  ",
              empty_open = "  ",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "  ",
              staged = "",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    })

    -- KEYMAPS
    local keymap = vim.keymap
    keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })
  end,
}

