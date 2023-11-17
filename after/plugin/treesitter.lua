-- enables nicer highlighting, indenting, etc
require'nvim-treesitter.configs'.setup {
  ensure_installed = {  "c", "lua", "vim", "vimdoc", "query", "typescript", "javascript", "rust" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
