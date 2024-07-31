local config = {
    cmd = {'C:/language_servers/jdt-language-server-1.36.0-202405301306/bin/jdtls.bat'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}

require('jdtls').start_or_attach(config)
