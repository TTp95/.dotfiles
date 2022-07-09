require("ttp.colors")
require("ttp.set")
require("ttp.lsp")
require("ttp.lualine")
require("ttp.telescope")
require("ttp.debugger")
require("ttp.netrw")
require("ttp.neogit")

require("ttp.keymaps")

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
