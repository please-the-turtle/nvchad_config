local cmp = require "cmp"

local options = {
  enabled = false,

  completion = {
    autocomplete = true,
  },

  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      print(vim.inspect("test"))
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          cmp.confirm()
        end
      else
            fallback()
      end
    end, {"i","s","c",}),
  }
}

cmp.setup(options)
