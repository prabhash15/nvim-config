return {

    'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
config = function ()
require("bufferline").setup {
  options = {
    mode = "buffers", -- or "tabs"
    numbers = "none", -- "ordinal" | "buffer_id" | "both" | function
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,

    indicator = {
      icon = '▎', -- this should be a single character
      style = 'icon', -- 'icon' | 'underline' | 'none'
    },

    buffer_close_icon = '󰅖',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',

    max_name_length = 18,
    max_prefix_length = 15,
    truncate_names = true,

    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,

    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true
      }
    },

    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,

    separator_style = "thin", -- "slant" | "padded_slant" | "thick" | "thin"
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = 'id'
  }
}
end,
}
