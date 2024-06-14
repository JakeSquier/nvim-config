return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    branch = "0.1.x",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        'andrew-george/telescope-themes'
    },
    keys =
    {
      {'<leader>fg', "<cmd>Telescope live_grep<cr>", desc = "Live grep"},
      {'<leader>ff', "<cmd>Telescope find_files<cr>", desc = "Find file"},
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        telescope.load_extension('themes')

        -- require('telescope').load_extension('fzf')

        -- get builtin schemes list
        local builtin_schemes = require("telescope._extensions.themes").builtin_schemes

        require("telescope").setup({
            defaults = {
                layout_config = {
                    horizontal = {
                      preview_cutoff = 0,
                    },
                },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
                color_devicons = true,
            },
            extensions = {
                fzf = {
                    override_generic_sorter = false,
                    override_file_sorter = true,
                    case_mode = 'smart_case',
                },
                themes = {
                    -- you can add regular telescope config
                    -- that you want to apply on this picker only
                    layout_config = {
                        horizontal = {
                            width = 0.8,
                            height = 0.7,
                        },
                    },

                    -- extension specific config

                    -- (boolean) -> show/hide previewer window
                    enable_previewer = true,

                    -- (boolean) -> enable/disable live preview
                    enable_live_preview = false,

                    -- all builtin themes are ignored by default
                    -- (list) -> provide table of theme names to overwrite builtins list
                    ignore = { "default", "desert", "elflord", "habamax" },
                    -- OR
                    -- extend the required `builtin_schemes` list to ignore other
                    -- schemes in addition to builtin schemes
                    ignore = vim.list_extend(builtin_schemes, { "embark" }),

                    persist = {
                        -- enable persisting last theme choice
                        enabled = true,

                        -- override path to file that execute colorscheme command
                        path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua"
                    }
                },
            },
        })
    end,
}
