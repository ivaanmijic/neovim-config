return {
  "lervag/vimtex",
  lazy = false,

  init = function()
    vim.g.vimtex_view_method = "okular"
    vim.g.vimtex_compiler_method = "latexmk"
  end,
}
