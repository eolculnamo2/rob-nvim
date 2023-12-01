local lsp_zero = require("lsp-zero")
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local jdtls_status, jdtls = pcall(require, "jdtls")

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_format_on_save = function(bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
            if jdtls_status then
                jdtls.organize_imports()
            end
            vim.lsp.buf.format({ bufnr = bufnr })
        end,

    })
end

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ["<C-Space>"] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
    }),
})

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    lsp_format_on_save(bufnr)

    if vim.bo.filetype == "java" then
        vim.opt.expandtab = false
    else
        vim.opt.expandtab = true
    end
end)
require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "tsserver",
        "eslint",
        "rust_analyzer",
    },
    handlers = {
        lsp_zero.default_setup,
    },
})
require("lspconfig").rescriptls.setup({})
