-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Automatically configure the Lua environment to be aware of LuaRocks-installed modules

local function configure_luarocks()
  local luarocks_path = vim.fn.trim(vim.fn.system("luarocks path --lua-version=5.4"))
  for match in (luarocks_path .. ""):gmatch("[^\r\n]+") do
    if match:find("LUA_PATH", 1, true) then
      package.path = match:sub(11) .. ";" .. package.path
    elseif match:find("LUA_CPATH", 1, true) then
      package.cpath = match:sub(12) .. ";" .. package.cpath
    end
  end
end

configure_luarocks()

vim.g.python3_host_prog = "/home/h4ckm1n/.Work/bin/python"
vim.env.PATH = "/home/h4ckm1n/.Work/bin:" .. vim.env.PATH
