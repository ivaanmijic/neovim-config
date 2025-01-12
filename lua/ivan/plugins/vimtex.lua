return {
  "lervag/vimtex",
  lazy = false,

  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = "latexmk"

    -- Multi file support
    -- vim.g.vimtex_main_file = "main.tex"
    -- vim.g.vimtex_multipdf_enabled = 1
    --
    -- Example key mappings for LaTeX
    vim.keymap.set("n", "<leader>ll", ":VimtexCompile<CR>", { noremap = true, silent = true }) -- Compile
    vim.keymap.set("n", "<leader>lv", ":VimtexView<CR>", { noremap = true, silent = true }) -- View PDF
    vim.keymap.set("n", "<leader>lc", ":VimtexClean<CR>", { noremap = true, silent = true }) -- Clean auxiliary files
  end,
}
