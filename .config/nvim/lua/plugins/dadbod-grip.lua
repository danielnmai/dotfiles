return {
  {
    "joryeugene/dadbod-grip.nvim",
    enabled = false,
    version = "*",
    cmd = {
      "Grip",
      "GripStart",
      "GripHome",
      "GripConnect",
      "GripSchema",
      "GripTables",
      "GripQuery",
      "GripSave",
      "GripLoad",
      "GripHistory",
      "GripProfile",
      "GripExplain",
      "GripAsk",
      "GripDiff",
      "GripCreate",
      "GripDrop",
      "GripRename",
      "GripProperties",
      "GripExport",
      "GripAttach",
      "GripDetach",
      "GripOpen",
    },
    keys = {
      { "<leader>Ds", "<cmd>GripStart<cr>", desc = "Grip Start" },
      { "<leader>Dc", "<cmd>GripConnect<cr>", desc = "Grip Connect" },
    },
    dependencies = {
      {
        "folke/which-key.nvim",
        opts = {
          spec = {
            { "<leader>D", group = "database", icon = "" },
          },
        },
      },
    },
  },
}
