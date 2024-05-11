return {
    {
        "h4ckm1n-dev/kube-utils-nvim",
        branch = "main",
        event = "BufReadPost",
        config = function()
            require("helm_utils").setup()
        end,
    },
}
