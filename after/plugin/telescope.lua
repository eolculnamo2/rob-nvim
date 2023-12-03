local ok, builtin = pcall(require, "telescope.builtin")

function start()
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    vim.keymap.set("n", "<leader>fs", builtin.git_files, {})
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})

    vim.api.nvim_set_option("clipboard", "unnamed")
end

if not ok then
    print("Telescope failed to load!")
else
    start()
end
