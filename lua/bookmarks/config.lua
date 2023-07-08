local M = {
    data = nil,
}

function M.setup(user_config)
    M.data = {
        mappings_enabled = true,
        keymap = {
            toggle = "<tab><tab>", -- toggle bookmarks
            add = "\\z", -- add bookmarks
            jump = "<CR>", -- jump from bookmarks
            delete = "dd", -- delete bookmarks
            order = "<space><space>", -- order bookmarks by frequency or updated_time
            delete_on_virt = "\\dd", -- delete bookmark at virt text line
            show_desc = "\\sd", -- show bookmark desc
        },
        width = 0.8, -- bookmarks window width:  (0, 1]
        height = 0.7, -- bookmarks window height: (0, 1]
        preview_ratio = 0.45, -- bookmarks preview window ratio (0.1]
        preview_ext_enable = false, -- if true, preview buf will add file ext, preview window may be highlighed(treesitter), but may be slower
        fix_enable = false,
        virt_text = "🔖", -- Show virt text at the end of bookmarked lines
        virt_pattern = { "*.go", "*.lua", "*.sh", "*.php", "*.rs" }, -- Show virt text only on matched pattern
        border_style = "single", -- border style: "single", "double", "rounded"
        hl = {
            border = "TelescopeBorder", -- border highlight
            cursorline = "guibg=Gray guifg=White", -- cursorline highlight
        },
    }

    if user_config == nil or type(user_config) ~= "table" then
        return
    end

    M.data = vim.tbl_deep_extend("force", M.data, user_config)
end

function M.get_data()
    return M.data
end

return M
