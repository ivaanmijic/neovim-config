return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    local ok, icons = pcall(require, "nvchad.icons")
    if not ok then
      icons = {
        diagnostics = { Error = " ", Warn = " " },
        git = { add = " ", modified = " ", remove = " " },
      }
    end

    lualine.setup({
      options = {
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = { "dashboard", "NvimTree", "alpha" } },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return "" .. str
            end,
          },
        },
        lualine_b = {
          "branch",
          {
            "diff",
            colored = true,
            diff_color = {
              added = { fg = "#98be65" },
              modified = { fg = "#ECBE7B" },
              removed = { fg = "#ff6c6b" },
            },
            symbols = {
              added = icons.git.add,
              modified = icons.git.modified,
              removed = icons.git.remove,
            },
          },
        },
        lualine_c = {
          {
            "filename",
            file_status = true, -- Shows status (modified, readonly, etc.)
            path = 0, -- Only show the filename, no path
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
            },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 0,
          },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {},
    })
  end,
}
