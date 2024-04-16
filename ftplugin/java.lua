local home = os.getenv('HOME')
local root_markers = { 'gradlew', 'mvnw', '.git' }
local root_dir = require('jdtls.setup').find_root(root_markers)
local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local jdtls = require('jdtls')

function nnoremap(rhs, lhs, bufopts, desc)
    bufopts.desc = desc
    vim.keymap.set("n", rhs, lhs, bufopts)
end

function os.capture(cmd, raw)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
end

function get_jdtls_version()

end

local on_attach = function(client, bufnr)
    -- Regular Neovim LSP client keymappings
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    nnoremap('<space>wa', vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
    nnoremap('<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
    nnoremap('<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts, "List workspace folders")

    -- Java extensions provided by jdtls
    nnoremap("<space>oi", jdtls.organize_imports, bufopts, "Organize imports")
    nnoremap("<space>ev", jdtls.extract_variable, bufopts, "Extract variable")
    nnoremap("<space>ec", jdtls.extract_constant, bufopts, "Extract constant")
    vim.keymap.set('v', "<space>em", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
        { noremap = true, silent = true, buffer = bufnr, desc = "Extract method" })
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
    on_attach = on_attach,
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        -- THIS VERSIONED PATH GETS MESSED UP
        '-jar', vim.fn.glob('/opt/homebrew/Cellar/jdtls/1.34.0/libexec/plugins/org.eclipse.equinox.launcher_*.jar'),
        -- THIS VERSIONED PATH GETS MESSED UP
        '-configuration', '/opt/homebrew/Cellar/jdtls/1.34.0/libexec/config_mac',
        '-data', workspace_dir
    },
    root_dir = root_dir,

    settings = {
        -- ['java.format.settings.url'] = home .. "/code/dev-preferences/eclipse/resi-vim.xml",
        -- ['java.format.settings.profile'] = "Resi",
        java = {
            cleanup = {
                -- still not perfect, would be better to import a cleanup xml configuration
                -- found addFinalModifier on vs code java repo. These don't seem to be documented
                actions = {
                    -- this adds final modifier to everything which is too much :(
                    -- "addFinalModifier"
                },
            },
            saveActions = {
                cleanup = true,
            },
            format = {
                settings = {
                    -- url = home .. "/code/dev-preferences/eclipse/resi-vim.xml"
                    url = home .. "/code/dev-preferences/eclipse-prefs.xml",
                    profile = "Resi"
                }
            },
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-11",
                        -- path = home .. "/.jabba/jdk/openjdk@1.11.0-2/Contents/Home/bin",
                        path = home .. "/.jabba/jdk/openjdk@1.11.0-2/Contents/Home",
                    },
                    {
                        name = "JavaSE-17",
                        -- path = home .. "/.jabba/jdk/openjdk@1.17.0/Contents/Home/bin",
                        path = home .. "/.jabba/jdk/openjdk@1.17.0/Contents/Home",
                    }
                }
            }
        }
    }
}

require('jdtls').start_or_attach(config)
