return {
    "kdheepak/lazygit.nvim",
    enabled = true,
    keys = { { "<leader>gg", ":LazyGit<cr>" } },
    config = function()
        vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
    end,
}
