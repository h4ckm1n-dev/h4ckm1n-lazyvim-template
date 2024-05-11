return {
    {
        "h4ckm1n-dev/kube-utils-nvim",
        branch = "dev",
        event = "BufReadPost",
        config = function()
            require("helm_utils").setup()
        end,
    },
}
