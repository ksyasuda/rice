local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
        require("null-ls").builtins.formatting.shfmt.with({
            extra_args = { "-i", "4", "-ci", "-sr" }
        }),
        require("null-ls").builtins.diagnostics.shellcheck.with({
            extra_args = { "-s", "bash", "-o", "check-extra-masked-returns, check-set-e-suppressed, check-unassigned-uppercase, deprecate-which, quote-safe-variables" }
        })
    },
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
})

local markdownlint = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "markdown" },
    -- null_ls.generator creates an async source
    -- that spawns the command with the given arguments and options
    generator = null_ls.generator({
        command = "markdownlint",
        args = { "--stdin" },
        to_stdin = true,
        from_stderr = true,
        -- choose an output format (raw, json, or line)
        format = "line",
        check_exit_code = function(code, stderr)
            local success = code <= 1

            if not success then
              -- can be noisy for things that run often (e.g. diagnostics), but can
              -- be useful for things that run on demand (e.g. formatting)
              print(stderr)
            end

            return success
        end,
        -- use helpers to parse the output from string matchers,
        -- or parse it manually with a function
        on_output = helpers.diagnostics.from_patterns({
            {
                pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
                groups = { "row", "col", "message" },
            },
            {
                pattern = [[:(%d+) [%w-/]+ (.*)]],
                groups = { "row", "message" },
            },
        }),
    }),
}

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

null_ls.register(markdownlint)
-- null_ls.register(shellcheck)
