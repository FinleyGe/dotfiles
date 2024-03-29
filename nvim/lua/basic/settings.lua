vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
vim.o.scrolloff = 4
vim.o.sidescrolloff = 4
vim.wo.number = true
vim.wo.relativenumber = false
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.undofile = true -- save undo history
vim.o.undodir = vim.fn.expand("~/.local/state/nvim/undodir")
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.autoread = true
vim.bo.autoread = true
vim.wo.wrap = false
-- vim.o.background = "dark"
vim.o.background = "light"
vim.o.termguicolors = true
vim.opt.termguicolors = true
vim.o.wildmenu = true
vim.o.showtabline = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showmode = false
vim.o.hidden = true
vim.o.timeoutlen = 500
vim.o.termguicolors = true
vim.loader.enable()

local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end

  notify(msg, ...)
end
