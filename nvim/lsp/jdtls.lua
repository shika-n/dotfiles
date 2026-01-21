local lombok_path = require("mason.settings").current.install_root_dir .. "/packages/jdtls/lombok.jar"

vim.env.JDTLS_JVM_ARGS = "-javaagent:" .. lombok_path
