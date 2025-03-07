-- notetaking

return {
  { -- zk notetaking system -- NOTE: requires zk package (`brew install zk`)
    "zk-org/zk-nvim",
    config = function()
      -- NOTE: used if the current file is not in a zk directory, needs to be absolute path ("~/Desktop" isn't supported)
      vim.env.ZK_NOTEBOOK_DIR = "/Users/williamechols/Desktop/zk/"
      require("zk").setup()

      -- zk custom commands
      local zk = require("zk")
      local commands = require("zk.commands")
      local function make_edit_fn(defaults, picker_options)
        return function(options)
          options = vim.tbl_extend("force", defaults, options or {})
          zk.edit(options, picker_options)
        end
      end
      commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
      commands.add("ZkDaily", make_edit_fn({  })) -- TODO: implement
      commands.add("ZkLucky", make_edit_fn({  })) -- TODO: implement

      -- zk keymaps
      vim.keymap.set('n', '<leader>zo', "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", { desc = '[z]k [o]pen' })
      vim.keymap.set('n', '<leader>zn', "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", { desc = '[z]k [n]ew' })
      vim.keymap.set('n', '<leader>zf', "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", { desc = "[z]k [f]ind" })
      vim.keymap.set('n', '<leader>zr', "<Cmd>ZkOrphans<CR>", { desc = "[z]k o[r]phans" })
      vim.keymap.set('n', '<leader>zi', "<Cmd>ZkInsertLink<CR>", { desc = "[z]k [i]nsert link" })
      vim.keymap.set('n', '<leader>zu', "<Cmd>ZkLinks<Cr>", { desc = "[z]k o[u]tbound links" })
      vim.keymap.set('n', '<leader>zu', "<Cmd>ZkLinks<Cr>", { desc = "[z]k o[u]tbound links" })
      vim.keymap.set('n', '<leader>zb', "<Cmd>ZkBacklinks<Cr>", { desc = "[z]k [b]acklinks" })
      vim.keymap.set('n', '<leader>zt', "<Cmd>ZkTags<Cr>", { desc = "[z]k [t]ags" })


      -- TODO: implement commands/keymaps for custom 'zk daily' and 'zk lucky' console commands as set in the zk config
    end,
  },
}
