return {
    {
        "h4ckm1n-dev/kube-utils-nvim",
        branch = "developement",
        config = function()
            require("helm_utils").setup()
        end,
    },
}
