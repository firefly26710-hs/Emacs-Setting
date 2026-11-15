require("bufferline").setup({
    options = {
        mode = "buffers",
        numbers = "ordinal",
        close_command = "bdelete! %d", 
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d", 

        show_buffer_icons = true, -- 是否顯示 filetype 圖示（依賴 nvim-web-devicons）
        show_buffer_close_icons = true, -- 是否在每個分頁上顯示關閉小叉叉
        show_close_icon = true, -- 是否在頂部最右側顯示全域關閉按鈕
        --
        -- diagnostics = "nvim_lsp", 
        -- diagnostics_indicator = function(count, level)
        -- local icon = level:match("error") and " " or " "
        -- return " " .. icon .. count
        -- end,

    }
})
