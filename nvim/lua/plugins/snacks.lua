return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- telescope's previewer can't render binaries; snacks draws images
      -- straight into the preview pane via kitty's graphics protocol
      image = { enabled = true },
      picker = {
        enabled = true,
        layout = { preset = "telescope" },
      },
    },
  },
}
