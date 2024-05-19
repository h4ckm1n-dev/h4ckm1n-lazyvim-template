-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Key mapping to switch between buffer and Neotree
vim.api.nvim_set_keymap('n', '<Tab>', ':lua ToggleNeoTree()<CR>', { noremap = true, silent = true })

local wk = require("which-key")

wk.setup({
  -- Configuration options
})

local mappings = {
  o = {
    name = "Ollama", -- This sets a label for all h-prefixed keybindings
    c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
    g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction" },
    t = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
    k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
    d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
    a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests" },
    o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
    s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize" },
    f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
    x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
    r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit" },
    l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis" },
  },
}

-- Register the keybindings with a specific prefix
wk.register(mappings, { prefix = "<leader>" })

-- Assuming 'wk' is already required and set up as per earlier discussions
local telescope = require("telescope.builtin")

local lsp_mappings = {
  G = {
    name = "GoTo", -- Sub-group for navigation
    l = { vim.diagnostic.open_float, "Diagnostic Float" },
    s = { vim.lsp.buf.signature_help, "Signature Help" },
    D = { vim.lsp.buf.declaration, "Go to Declaration" },
    d = { telescope.lsp_definitions, "Go to Definition" },
    i = { telescope.lsp_implementations, "Go to Implementation" },
    T = { telescope.lsp_type_definitions, "Go to Type Definition" },
    r = { telescope.lsp_references, "Go to References" },
  },
}

-- Register the LSP keybindings
wk.register(lsp_mappings, { prefix = "<leader>" })

local trouble = require("trouble")
local toggle_lsp = require('modules.toggle_lsp')

local helm_mappings = {
  k = {
    name = "Kubernetes",
    d = { "<cmd>HelmDeployFromBuffer<CR>", "Helm Deploy Buffer to Context" },
    r = { "<cmd>RemoveDeployment<CR>", "Helm Remove Deployment From Buffer" },
    T = { "<cmd>HelmDryRun<CR>", "Helm DryRun Buffer" },
    a = { "<cmd>KubectlApplyFromBuffer<CR>", "Kubectl Apply From Buffer" },
    D = { "<cmd>DeleteNamespace<CR>", "Kubectl Delete Namespace" },
    u = { "<cmd>HelmDependencyUpdateFromBuffer<CR>", "Helm Dependency Update" },
    b = { "<cmd>HelmDependencyBuildFromBuffer<CR>", "Helm Dependency Build" },
    t = { "<cmd>HelmTemplateFromBuffer<CR>", "Helm Template From Buffer" },
    K = { "<cmd>OpenK9sSplit<CR>", "Split View K9s" },
    k = { "<cmd>OpenK9s<CR>", "Open K9s" },
    l = { "<cmd>ToggleYamlHelm<CR>", "Toggle YAML/Helm" },
  },
}

-- Register the Helm keybindings with a specific prefix
wk.register(helm_mappings, { prefix = "<leader>" })
