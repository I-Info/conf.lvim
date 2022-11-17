lvim.builtin.lualine.style = "default"

local sections = lvim.builtin.lualine.sections
local components = require("lvim.core.lualine.components")

sections.lualine_a = {
  "mode"
}
sections.lualine_b = {
  "branch",
  components.diff,
  components.diagnostics,
}
sections.lualine_c = {
  components.python_env,
  components.filename,
}
sections.lualine_x = {
  components.lsp, 'encoding', 'fileformat', 'filetype',
}
sections.lualine_y = {
  components.spaces,
  components.location,
}
sections.lualine_z = {
  components.progress,
}
