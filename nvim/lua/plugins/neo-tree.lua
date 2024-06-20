return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    vim.keymap.set("n", "<leader>nt", function()
      vim.cmd(":Neotree toggle filesystem")
    end, {
      desc = "Toggle Neotree for CWD",
    })
  end,
}
