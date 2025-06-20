local jdtls = require "jdtls"

-- Use USERPROFILE for Windows
local home = os.getenv "USERPROFILE"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

-- Replace backslashes with forward slashes
local workspace_dir = home .. "/.local/share/eclipse/" .. project_name
workspace_dir = workspace_dir:gsub("\\", "/")

-- mason path
local jdtls_path = home .. "/AppData/Local/nvim-data/mason/packages/jdtls"
local lombok_path = jdtls_path .. "/lombok.jar"
local bundles = {}
if vim.fn.filereadable(lombok_path) == 1 then
  table.insert(bundles, lombok_path)
end

jdtls_path = jdtls_path:gsub("\\", "/")

local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
launcher_jar = launcher_jar:gsub("\\", "/")
local config_path = jdtls_path .. "/config_win"

local config = {
  cmd = {
    "java",
    "-javaagent:" .. lombok_path,
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.level=ALL",
    "-noverify",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    launcher_jar,
    "-configuration",
    config_path,
    "-data",
    workspace_dir,
  },

  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" },
  settings = {
    java = {},
  },
  init_options = {
    bundles = bundles,
  },
}

jdtls.start_or_attach(config)
