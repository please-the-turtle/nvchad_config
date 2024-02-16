---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    ["<leader>q"] = { ":q<CR>", "Quit nvim", opts = { nowait = true } },

    -- Auto session mappings
    ["<leader>ss"] = {"<cmd> SessionSave <CR>", "Save current session"},
    ["<leader>sl"] = {"<cmd> Telescope session-lens <CR>", "Load saved session"},
    ["<leader>sr"] = {"<cmd> SessionRestore <CR>", "Restore session"},
    ["<leader>sd"] = {"<cmd> SessionDelete <CR>", "Delete session"},
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

for i = 1, 9, 1 do
  M.general.n[string.format("<A-%s>", i)] = {
    function ()
      local buffer = vim.t.bufs[i]
      if buffer == nil then
        return
      end
      vim.api.nvim_set_current_buf(vim.t.bufs[i])
    end,
    string.format("Go to %s buffer", i)
  }
end

-- more keybinds!

return M
