return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview open (merge tool during conflicts)" },
      { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
    },
    opts = {
      view = {
        -- OURS | THEIRS on top, the result file full-width below
        merge_tool = { layout = "diff3_mixed", disable_diagnostics = true },
      },
    },
  },
}
