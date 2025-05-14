return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/your/vault/**.md",
  --   "BufNewFile path/to/your/vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- Optional, for completion.
    "hrsh7th/nvim-cmp",

    -- Optional, for search and quick-switch functionality.
    "nvim-telescope/telescope.nvim",

    -- Optional, alternative to nvim-treesitter for syntax highlighting.
    "godlygeek/tabular",
    "preservim/vim-markdown",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/jannyg-notes",
      },
      {
        name = "blog",
        path = "~/git/quartz",
      }
    },

    -- Define a default directory for new notes
    notes_subdir = "Innboks",

    -- Define where attachments (like images) are stored
    attachments = {
      -- The directory where new attachments will be created
      img_folder = "Attachments/imgs/",
    },

    -- Use the note title as the filename, preserving spaces
    note_id_func = function(title)
      -- Only remove special characters that would be invalid in filenames
      local filename = title:gsub("[/\\:*?\"<>|]", ""):lower()
      return filename
    end,

    -- Optional, completion.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    -- Optional, set to true if you use the Obsidian Advanced URI plugin.
    use_advanced_uri = false,

    -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
    open_app_foreground = false,

    -- Optional, by default commands like `:ObsidianSearch` will attempt to use
    -- telescope.nvim, fzf-lua, fzf.vim, or mini.pick (in that order), and use the
    -- first one they find. You can set this option to tell obsidian.nvim to always use this
    -- finder.
    finder = "telescope.nvim",
  },
}
