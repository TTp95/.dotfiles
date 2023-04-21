require'lualine'.setup{
  options = {
    theme = 'tokyonight'
  },
  sections = {
    lualine_a = {"mode", "paste"},
    lualine_b = {"branch", "diff"},
    lualine_c = {
      {"filename", file_status = true, full_path = true},
      -- See the difference here
      {"diagnostics", sources = {"nvim_diagnostic"}}
    },
    lualine_x = {"filetype"},
    lualine_y = {
      {
        "progress"
      }
    },
    lualine_z = {
      {
        "location",
        icon = ""
      }
    }
  }
}
