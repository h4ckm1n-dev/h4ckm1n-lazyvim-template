-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Setup Plugins with lazy.nvim
require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { "catppuccin/nvim", as = "catppuccin" },
    {
      "fatih/vim-go",
      build = ":GoUpdateBinaries",
    },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = {
    colorscheme = { "tokyonight-storm", "habamax", "catppuccin" },
  },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Neovim Configuration
vim.o.clipboard = "unnamedplus"
vim.cmd([[colorscheme catppuccin-mocha]])
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "lazy" })

-- Your existing LSP setup for yamlls in init.lua
require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        -- ArgoCD ApplicationSet CRD
        ["https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/crds/applicationset-crd.yaml"] =
        "/home/h4ckm1n/Documents/K8s/apps/templates/*.yaml",
        -- ArgoCD Application CRD
        ["https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/crds/application-crd.yaml"] =
        "/home/h4ckm1n/Documents/K8s/apps/templates/*.yaml",
        -- Kubernetes strict schemas
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.3-standalone-strict/all.json"] = "",
      },
      validate = true,
      completion = true,
      hover = true,
      format = {
        enable = true,
        bracketSpacing = true,
        printWidth = 80,
        proseWrap = "preserve",
        singleQuote = true,
      },
      customTags = {
        "!Ref",
        "!Sub sequence",
        "!Sub mapping",
        "!GetAtt",
      },
      disableAdditionalProperties = false,
      maxItemsComputed = 5000,
      trace = {
        server = "verbose",
      },
    },
    redhat = {
      telemetry = {
        enabled = false,
      },
    },
  },
}

-- Helm LSP setup
require('lspconfig').helm_ls.setup({
  filetypes = { 'helm' },
})

-- Ensure Neotree is installed and set up correctly
require('neo-tree').setup {}

-- Function to toggle between Neotree and the last used buffer
function ToggleNeoTree()
  local current_win = vim.api.nvim_get_current_win()
  local neotree_win = nil

  -- Find the Neotree window
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
    if bufname:match("neo%-tree filesystem") then
      neotree_win = win
      break
    end
  end

  if neotree_win then
    if current_win == neotree_win then
      -- If currently in Neotree, switch to the previous buffer
      vim.cmd("wincmd p")
    else
      -- Otherwise, switch to the Neotree window
      vim.api.nvim_set_current_win(neotree_win)
    end
  else
    -- If Neotree is not open, open it
    vim.cmd("Neotree toggle")
  end
end
