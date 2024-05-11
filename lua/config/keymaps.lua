-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

local troubleMappings = {
  x = {
    name = "diagnostic/quickfix", -- Label for Trouble keybindings
    o = { "<cmd>TroubleToggle<CR>", "Toggle Trouble" },
    w = {
      function()
        trouble.toggle("workspace_diagnostics")
      end,
      "Workspace Diagnostics",
    },
    d = {
      function()
        trouble.toggle("document_diagnostics")
      end,
      "Document Diagnostics",
    },
    q = {
      function()
        trouble.toggle("quickfix")
      end,
      "Quickfix",
    },
    l = {
      function()
        trouble.toggle("loclist")
      end,
      "Location List",
    },
    r = {
      function()
        trouble.toggle("lsp_references")
      end,
      "LSP References",
    },
    m = { "<cmd>TroubleToggle mode<CR>", "Toggle Mode" },
    s = { "<cmd>TroubleToggle severity<CR>", "Toggle Severity" },
    x = { "<cmd>TroubleClose<CR>", "Close Trouble" },
    z = { "<cmd>TroubleRefresh<CR>", "Refresh Trouble" },
    p = { "<cmd>TroublePreview<CR>", "Preview Diagnostic" },
    h = { "<cmd>TroubleHover<CR>", "Hover Diagnostic" },
    j = { "<cmd>TroubleNext<CR>", "Next Diagnostic" },
    k = { "<cmd>TroublePrevious<CR>", "Previous Diagnostic" },
  },
}

-- Register the Trouble keybindings with which-key under the leader key
wk.register(troubleMappings, { prefix = "<leader>" })

-- Helm keybindings
local helm_mappings = {
	k = {
		name = "Kubernetes", -- This sets a label for all helm-related keybindings
		c = { "<cmd>HelmDeployFromBuffer<CR>", "Helm Deploy Buffer to Context" },
    r = { "<cmd>RemoveDeployment<CR>", "Helm Remove Deployment From Buffer" },
		d = { "<cmd>HelmDryRun<CR>", "helm DryRun Buffer" },
    a = { "<cmd>KubectlApplyFromBuffer<CR>", "kubectl apply from buffer" },
    k = { "<cmd>OpenK9s<CR>", "View Cluster In K9s" },
    K = { "<cmd>OpenK9sSplit<CR>", "Split View K9s" }, 
	},
}

-- Require the which-key plugin
local wk = require("which-key")

-- Register the Helm keybindings with a specific prefix
wk.register(helm_mappings, { prefix = "<leader>" })