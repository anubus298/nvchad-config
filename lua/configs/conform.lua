local formatters = {
  ["google-java-format"] = {
    command = "google-java-format",
    args = { "-" }, -- reads from stdin
    stdin = true,
  },
}

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    json = { "prettierd" },
    java = { "google-java-format" },
    css = { "prettierd" },
    html = { "prettierd" },
    markdown = { "prettierd" },
    yaml = { "prettierd" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 30000,
    lsp_fallback = true,
  },
  formatters = formatters,
}

return options
