local ok, obsidian = pcall(require, "obsidian")
if not ok then
    print("Obsidian is broke")
else
    obsidian.setup({

        workspaces = {
            -- {
            --     name = "personal",
            --     path = "~/vaults/personal",
            -- },
            {
                name = "work",
                path = "~/Documents/Work",
            },
        },
        mappings = {
            -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            -- Toggle check-boxes.
            ["<leader>ch"] = {
                action = function()
                    return require("obsidian").util.toggle_checkbox()
                end,
                opts = { buffer = true },
            },
            -- Smart action depending on context, either follow link or toggle checkbox.
            ["<cr>"] = {
                action = function()
                    return require("obsidian").util.smart_action()
                end,
                opts = { buffer = true, expr = true },
            }
        },
    })
end
