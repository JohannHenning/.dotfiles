-- Purely to allow obsidian.nvim to work
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
  },
}
