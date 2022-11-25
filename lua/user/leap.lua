local leap = require("leap")
local M = {}

leap.add_default_mappings()

local function get_line_starts(winid)
  local wininfo = vim.fn.getwininfo(winid)[1]
  local cur_line = vim.fn.line('.')

  -- Get targets.
  local targets = {}
  local lnum = wininfo.topline
  while lnum <= wininfo.botline do
    local fold_end = vim.fn.foldclosedend(lnum)
    -- Skip folded ranges.
    if fold_end ~= -1 then
      lnum = fold_end + 1
    else
      if lnum ~= cur_line then table.insert(targets, { pos = { lnum, 1 } }) end
      lnum = lnum + 1
    end
  end
  -- Sort them by vertical screen distance from cursor.
  local cur_screen_row = vim.fn.screenpos(winid, cur_line, 1)['row']
  local function screen_rows_from_cur(t)
    local t_screen_row = vim.fn.screenpos(winid, t.pos[1], t.pos[2])['row']
    return math.abs(cur_screen_row - t_screen_row)
  end

  table.sort(targets, function(t1, t2)
    return screen_rows_from_cur(t1) < screen_rows_from_cur(t2)
  end)

  if #targets >= 1 then
    return targets
  end
end

function M.leap_to_line()
  local winid = vim.api.nvim_get_current_win()
  require('leap').leap {
    target_windows = { winid },
    targets = get_line_starts(winid),
  }
end

function M.leap_bidirectional()
  leap.leap { target_windows = { vim.fn.win_getid() } }
end

function M.leap_highlight()
  vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Conceal' })
  vim.api.nvim_set_hl(0, 'LeapMatch', {
    fg = 'white', -- for light themes, set to 'black' or similar
    bold = true,
    nocombine = true,
  })
  vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
    fg = 'LightGreen',
    bold = true,
    nocombine = true,
  })
  vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
    fg = 'LightBlue',
    nocombine = true,
  })
end

leap.opts.highlight_unlabeled_phase_one_targets = true

return M
