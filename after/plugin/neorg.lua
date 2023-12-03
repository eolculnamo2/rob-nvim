local ok, neorg = pcall(require, "neorg")

function start()
    neorg.setup({
        load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        work = "~/notes/work",
                        kast = "~/notes/kast",
                        home = "~/notes/home",
                    },
                    default_workspace = "work",
                },
            },
        },
    })
    vim.keymap.set("n", "<leader>zi", ":Neorg index <CR>", {})
    vim.keymap.set("n", "<leader>zr", ":Neorg return <CR>", {})
end

if not ok then
    print("Neorg failed to load!")
else
    start()
end
