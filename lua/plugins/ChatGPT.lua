return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup({
      --      api_host_cmd = "echo http://localhost:11434",  uncomment if you are using ollama as an API
      --      api_key_cmd = "echo ''",
      openai_params = {
        model = "gpt-4", -- if using ollama as an API, change to "your model"
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 3000,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
      openai_edit_params = {
        --        api_host_cmd = "echo http://localhost:11434",
        --        api_key_cmd = "echo ''",
        model = "gpt-4", -- if using ollama as an API, change to "your model"
        frequency_penalty = 0,
        presence_penalty = 0,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
