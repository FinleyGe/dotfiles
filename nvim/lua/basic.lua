vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

vim.o.scrolloff = 4
vim.o.sidescrolloff = 4

vim.wo.number = true
vim.wo.relativenumber = false

vim.wo.cursorline = true

vim.wo.signcolumn = "yes"

-- vim.wo.colorcolumn = "80"

vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true

vim.o.expandtab = true
vim.bo.expandtab = true

-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.autoread = true
vim.bo.autoread = true

vim.wo.wrap = false

vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- vim.o.list = true
-- vim.o.listchars = "space:·"

vim.o.wildmenu = true
vim.o.showtabline = 2

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.showmode = false

vim.o.hidden = true

vim.o.timeoutlen = 500

vim.o.termguicolors = true

vim.loader.enable()

-- format with lsp directly. plan to deprecate this
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()']])

local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end

  notify(msg, ...)
end
