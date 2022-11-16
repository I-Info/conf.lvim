local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.sections.lualine_b = {
  "branch",
  components.diff,
  components.diagnostics,
}
lvim.builtin.lualine.sections.lualine_c = {
  components.python_env,
  components.filename,
}
lvim.builtin.lualine.sections.lualine_x = {
  components.lsp, 'encoding', 'fileformat', 'filetype',
}
lvim.builtin.lualine.sections.lualine_y = {
  components.spaces,
  components.location,
}
lvim.builtin.lualine.sections.lualine_z = {
  components.progress,
}
