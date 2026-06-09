return {
    "sainnhe/gruvbox-material",
    name = "gruvbox-material",
    lazy = false,
    priority = 1000, -- load before all other plugins
    config = function()
        -- 1. Configure the Gruvbox Material flavor to match the screenshot
        vim.g.gruvbox_material_background = "hard"   -- Darkest contrast available
        vim.g.gruvbox_material_foreground = "material" -- Muted, modern text tones
        vim.g.gruvbox_material_enable_bold = 1
        vim.g.gruvbox_material_enable_italic = 1

        -- 2. Force true-black/transparent background for absolute contrast
        vim.api.nvim_create_autocmd("ColorScheme", {
            group = vim.api.nvim_create_augroup("GruvboxCustom", { clear = true }),
            pattern = "gruvbox-material",
            callback = function()
                -- Makes the main windows pitch black / transparent
                vim.api.nvim_set_hl(0, "Normal", { bg = "#000000"})
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000"})
                vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000"})
                
                -- Reapply your preferred LSP undercurls for diagnostics
                vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true })
                vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true })
                vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true })
                vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true })
            end,
        })

        -- 3. Activate the theme
        vim.cmd.colorscheme "gruvbox-material"
    end,
}
