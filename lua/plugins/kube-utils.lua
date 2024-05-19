return {
    {
        "h4ckm1n-dev/kube-utils-nvim",
        -- dir = "/local/path/to/plugin",
        branch = "main", -- comment to use local folder
        config = function()
            require("init").setup()
        end,
    },
}
