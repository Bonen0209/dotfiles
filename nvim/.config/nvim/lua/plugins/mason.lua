local mason_status_ok, mason = pcall(require, 'mason')
if not mason_status_ok then
  return
end

mason.setup()

local mason_tool_installer_status_ok, mason_tool_installer = pcall(require, 'mason-tool-installer')
if not mason_tool_installer_status_ok then
  return
end

mason_tool_installer.setup {
  -- a list of all tools you want to ensure are installed upon
  -- start
  ensure_installed = {
    -- LSP
    'vim-language-server', 'lua-language-server',
    'yaml-language-server', 'lemminx',
    'texlab',
    'bash-language-server', 'docker-language-server',
    'clangd',
    'basedpyright', 'ruff'
  }
}
