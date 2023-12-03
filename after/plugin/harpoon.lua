local ok, harpoon = pcall(require, "harpoon")

function init_harpoon()
    harpoon:setup()
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
    vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end)
    vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end)
    vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
    vim.keymap.set("n", "<leader>5", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>6", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>7", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>8", function() harpoon:list():select(4) end)
end

if not ok then
    print("Failed to load harpoon!")
else
    init_harpoon();
end
