vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }


    use {
      "zbirenbaum/copilot.lua",
      after = "lualine.nvim",
      config = function ()
          vim.defer_fn(function()
            require('copilot').setup({
              panel = {
                enabled = true,
                auto_refresh = false,
                keymap = {
                  jump_prev = "[[",
                  jump_next = "]]",
                  accept = "<CR>",
                  refresh = "gr",
                  open = "<M-CR>"
                },
              },
              suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 75,
                keymap = {
                 accept = "<Tab>",
                 next = "<M-]>",
                 prev = "<M-[>",
                 dismiss = "<C-]>",
                },
              },
              -- filetypes = {
              --   yaml = false,
              --   markdown = false,
              --   help = false,
              --   gitcommit = false,
              --   gitrebase = false,
              --   hgcommit = false,
              --   svn = false,
              --   cvs = false,
              --   ["."] = false,
              -- },
              copilot_node_command = 'node', -- Node version must be < 18
              plugin_manager_path = vim.fn.stdpath("data") .. "/site/pack/packer",
              server_opts_overrides = {},
            })
        end, 100)
      end,
    }

    use {
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua" },
      config = function ()
          require("copilot_cmp").setup({
              -- method = "getCompletionsCycling",
              -- formatters = {
              --   insert_text = require("copilot_cmp.format").remove_existing
              -- }
          })
      end
    }

    use {
        'junegunn/fzf',
        run = function() vim.fn['fzf#install']() end
    }

    use {
        "lewis6991/hover.nvim",
        config = function()
            require("hover").setup {
                init = function()
                    -- Require providers
                    require("hover.providers.lsp")
                    -- require('hover.providers.gh')
                    -- require('hover.providers.jira')
                    require('hover.providers.man')
                    require('hover.providers.dictionary')
                end,
                preview_opts = {
                    border = "rounded"
                    -- border = {
                    --     { "╭", "FloatBorder" },
                    --     { "─", "FloatBorder" },
                    --     { "╮", "FloatBorder" },
                    --     { "│", "FloatBorder" },
                    --     { "╯", "FloatBorder" },
                    --     { "─", "FloatBorder" },
                    --     { "╰", "FloatBorder" },
                    --     { "│", "FloatBorder" },
                    -- }
                },
                -- Whether the contents of a currently open hover window should be moved
                -- to a :h preview-window when pressing the hover keymap.
                preview_window = false,
                title = true
            }

            -- Setup keymaps
            vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
            vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
        end
    }

    use 'ap/vim-css-color'
    use 'jiangmiao/auto-pairs'
    use 'junegunn/fzf.vim'
    use 'pechorin/any-jump.vim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'voldikss/vim-floaterm'
    use 'wakatime/vim-wakatime'

    use {
        'akinsho/nvim-bufferline.lua'
    }
    use {
        'andweeb/presence.nvim'
    }
    use {
        'folke/which-key.nvim'
    }
    use {
        'glepnir/dashboard-nvim'
    }
    use {
        'kyazdani42/nvim-tree.lua'
    }
    use 'kyazdani42/nvim-web-devicons'
    use {
        'lewis6991/gitsigns.nvim'
    }
    use {
        'nvim-telescope/telescope.nvim'
    }
    use {
        'ojroques/nvim-lspfuzzy'
    }

    use 'L3MON4D3/LuaSnip'
    -- use 'amrbashir/nvim-docs-view'
    use {
        'hrsh7th/nvim-cmp'
    }
    use {
        'hrsh7th/cmp-nvim-lsp'
    }
    use {
        'hrsh7th/cmp-nvim-lua'
    }
    use {
        'hrsh7th/cmp-nvim-lsp-signature-help'
    }
    use {
        'hrsh7th/cmp-path'
    }
    use {
        'hrsh7th/cmp-buffer'
    }
    use {
        'j-hui/fidget.nvim'
    }
    use {
        'jose-elias-alvarez/null-ls.nvim'
    }
    use {
        'ksyasuda/lsp_lines.nvim'
    }
    use {
        'neovim/nvim-lspconfig'
    }
    use {
        'onsails/lspkind-nvim'
    }
    -- use 'ray-x/lsp_signature.nvim'
    use {
        'rmagatti/goto-preview'
    }
    use 'saadparwaiz1/cmp_luasnip'
    use 'williamboman/nvim-lsp-installer'

    use {
        'Mofiqul/dracula.nvim'
    }
    use {
        'NTBBloodbath/doom-one.nvim'
    }
    use {
        'olimorris/onedarkpro.nvim'
    }
    use {
        'projekt0n/github-nvim-theme'
    }
end)
