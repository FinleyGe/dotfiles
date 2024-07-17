local vscode = vim.g.vscode
local firenvim = vim.g.started_by_firenvim
require("basic") -- always could be loaded;

if not firenvim and not vscode then
  require("plugin")
end
