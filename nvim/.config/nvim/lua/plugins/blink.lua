-- Added for obsidian.nvim
return {
  "saghen/blink.cmp",
  dependencies = {
    { "saghen/blink.compat", lazy = true, version = false },
  },
  opts = {
    sources = {
      -- LazyVim as custom option copmpat to pass in external sources with blink.compat
      compat = { "obsidian", "obsidian_new", "obsidian_tags" },
    },
    keymap = {
      preset = "super-tab"
    },
    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        auto_show = false,
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = vim.g.ai_cmp,
      },
    },

  },
}
