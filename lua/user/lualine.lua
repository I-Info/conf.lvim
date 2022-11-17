lvim.builtin.lualine.style = "default"

local sections = lvim.builtin.lualine.sections
local components = require("lvim.core.lualine.components")

sections.lualine_a = {
  "mode"
}
sections.lualine_b = {
  "branch",
}
sections.lualine_c = {
  components.python_env,
  components.diff,
  components.filename,
}

sections.lualine_x = {
  components.lsp,
  components.diagnostics,
  'encoding',
  -- 'fileformat',
  components.spaces,
  'filetype',
}
sections.lualine_y = {
  components.location,
}
sections.lualine_z = {
  components.progress,
}
