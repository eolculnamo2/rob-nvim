local home = os.getenv('HOME')
local root_markers = { 'gradlew', 'mvnw', '.git' }
local root_dir = require('jdtls.setup').find_root(root_markers)
local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
print(workspace_dir)

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
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
        '-jar', vim.fn.glob('/opt/homebrew/Cellar/jdtls/1.29.0/libexec/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration', '/opt/homebrew/Cellar/jdtls/1.29.0/libexec/config_mac',
        '-data', workspace_dir
    },
    root_dir = root_dir,

    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-11",
                        path = "/Users/robbertram/.jabba/jdk/openjdk@1.11.0-2/Contents/Home/",
                    },
                    {
                        name = "JavaSE-17",
                        path = "/Users/robbertram/.jabba/jdk/openjdk@1.17.0/Contents/Home/",
                    }
                }
            }
        }
    }
}

require('jdtls').start_or_attach(config)
