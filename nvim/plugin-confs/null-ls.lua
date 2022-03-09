local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

require("null-ls").setup({
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end,
    sources = {
        require("null-ls").builtins.completion.spell,
        require("null-ls").builtins.completion.luasnip,
        require("null-ls").builtins.code_actions.gitsigns,
        require("null-ls").builtins.code_actions.shellcheck,
        require("null-ls").builtins.diagnostics.cppcheck,
        require("null-ls").builtins.diagnostics.gitlint,
        require("null-ls").builtins.diagnostics.jsonlint,
        -- require("null-ls").builtins.diagnostics.luacheck,
        require("null-ls").builtins.diagnostics.markdownlint,
        require("null-ls").builtins.diagnostics.pylint,
        require("null-ls").builtins.diagnostics.pydocstyle.with({
            extra_args = { "--config=$ROOT/setup.cfg" }
        }),
        require("null-ls").builtins.diagnostics.vint,
        require("null-ls").builtins.formatting.json_tool,
        -- require("null-ls").builtins.formatting.lua_format,
        require("null-ls").builtins.formatting.markdownlint,
        require("null-ls").builtins.formatting.prettier,
        -- handled by lsp server
        -- require("null-ls").builtins.formatting.rustfmt,
        require("null-ls").builtins.formatting.shfmt.with({
            filetypes = {"sh", "bash"},
            extra_args = { "-i", "0", "-ci", "-sr" }
        }),
        require("null-ls").builtins.diagnostics.shellcheck.with({
            extra_args = {  "-s", "bash", "-o", "check-extra-masked-returns, check-set-e-suppressed, check-unassigned-uppercase, deprecate-which, quote-safe-variables" }
        }),
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.formatting.isort,
    },
})

-- local markdownlint = {
--     method = null_ls.methods.DIAGNOSTICS,
--     filetypes = { "markdown" },
--     -- null_ls.generator creates an async source
--     -- that spawns the command with the given arguments and options
--     generator = null_ls.generator({
--         command = "markdownlint",
--         args = { "--stdin" },
--         to_stdin = true,
--         from_stderr = true,
--         -- choose an output format (raw, json, or line)
--         format = "line",
--         check_exit_code = function(code, stderr)
--             local success = code <= 1

--             if not success then
--               -- can be noisy for things that run often (e.g. diagnostics), but can
--               -- be useful for things that run on demand (e.g. formatting)
--               print(stderr)
--             end

--             return success
--         end,
--         -- use helpers to parse the output from string matchers,
--         -- or parse it manually with a function
--         on_output = helpers.diagnostics.from_patterns({
--             {
--                 pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
--                 groups = { "row", "col", "message" },
--             },
--             {
--                 pattern = [[:(%d+) [%w-/]+ (.*)]],
--                 groups = { "row", "message" },
--             },
--         }),
--     }),
-- }

-- local shellcheck = {
--     method = null_ls.methods.DIAGNOSTICS,
--     filetypes = { "sh", "bash", "zsh", "fish" },
--     generator = null_ls.generator({
--         command = "shellcheck",
--         args = {  "-s", "bash", "-o", "all", "-e", "2250" },
--         from_stderr = true,
--         format = "line",
--         check_exit_code = function(code, stderr)
--             local success = code <= 1

--             if not success then
--               -- can be noisy for things that run often (e.g. diagnostics), but can
--               -- be useful for things that run on demand (e.g. formatting)
--               print(stderr)
--             end

--             return success
--         end,
--         on_output = helpers.diagnostics.from_patterns({
--             {
--                 pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
--                 groups = { "row", "col", "message" },
--             },
--             {
--                 pattern = [[:(%d+) [%w-/]+ (.*)]],
--                 groups = { "row", "message" },
--             },
--         }),
-- }),
-- }

-- null_ls.register(markdownlint)
-- null_ls.register(shellcheck)
