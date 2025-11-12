-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["l"] = "next_sibling",
          ["k"] = "prev_sibling",
          ["j"] = "close_node",
          [";"] = "open",
        },
      },
    },
    filesystem = {
      window = {
        mappings = {
          ["l"] = "next_sibling",
          ["k"] = "prev_sibling",
          ["j"] = "close_node",
          [";"] = "open",
        },
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 0,
        ignore_whitespace = true,
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
        end

        map("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", "Toggle Blame Inline")
        map("n", "<leader>td", ":Gitsigns toggle_deleted<CR>", "Toggle Show Deleted")

        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev Hunk")
        map("n", "]H", function()
          gs.nav_hunk("last")
        end, "Last Hunk")
        map("n", "[H", function()
          gs.nav_hunk("first")
        end, "First Hunk")
        map({ "n", "x" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "x" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>hp", gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Blame Line")
        map("n", "<leader>hB", function()
          gs.blame()
        end, "Blame Buffer")
        map("n", "<leader>hd", gs.diffthis, "Diff This")
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = false,
        -- optionally: disable = { "lua", "python", ... }  -- languages to disable individually
      },
      -- you can leave other features (indent, folds) as you like
      indent = { enable = true },
      folds = { enable = true },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        denols = {
          enabled = false,
          -- root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
          -- optional settings for denols:
          settings = {
            deno = {
              enable = true,
              lint = true,
              fmt = true,
            },
          },
        },
        vtsls = {
          enabled = true,
        },
      },
    },
  },
}
