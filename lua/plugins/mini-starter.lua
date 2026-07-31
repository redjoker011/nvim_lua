return {
  "echasnovski/mini.nvim",
  config = function()
    local starter = require('mini.starter')

    local ascii = {
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄█▀▀▀▀▀▀▄▄▄░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄█▀▀░░░░░░░░░░░▀▀█▄▄░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄█▀░░░░░░▄▄▄░░░░░░░░▄▀█▄░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░▀▀▄░░░░▄▀▀░░░█▄░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░▄█▀▀▀█▄░▄█▀▀▀█▄░▀▄░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░██░▀░██░██░▀░██░░█░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░▀█████▀░▀█████▀░░█░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░░░░░░░▄░░░░█░░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░░░░░░░██▀▀▀▀█░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░░░░░░█░▄▀▄▄▄▀░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░░░░░░▄█▀▀▀▀▄░░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░█▄░░░░░░░░░░░░░░█▄█▄█▄█░░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░█▄░░░░░░░░░░░░▄▀█████▀░░░░▄▀░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░▄█▄░░░░░░░░░░░░░░░░░░░░░▄█▀░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░▄█▀▄░░▀▄▄░░▄▄░░░░░░░▀▀▀▄▄▀▀░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░▀░░░▀▄░░░▀▀▀██▄▄▄▄▄▄█▀▀░░░░▄▄░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░▄█▀▄░▄▄▄░░░░▀██▀░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█▄░░░░▄█▄▄▄█████▄▄▄▀▀░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▀▀▀█▀▀▀▀▀░▀██▀░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▀░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░    Y  U   NO   VIM??   ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      "",
      ""
    }

    local default_header = function()
      local hour = tonumber(vim.fn.strftime('%H'))
      local part_id = math.floor((hour + 4) / 8) + 1
      local day_part = ({ 'evening', 'morning', 'afternoon', 'evening' })[part_id]
      local username = 'Pete!'

      return ('Good %s, %s'):format(day_part, username)
    end

    -- Resize Function: Crops height (line range) and width (margin characters)
    local function resize_ascii(lines, start_line, end_line, side_crop)
      local result = {}
      for i = start_line, end_line do
        local line = lines[i]
        local len = vim.fn.strchars(line)
        if side_crop > 0 and len > (side_crop * 2) then
          line = vim.fn.strcharpart(line, side_crop, len - (side_crop * 2))
        end
        table.insert(result, line)
      end
      return result
    end

    -- Adjust these parameters to resize:
    -- Param 2 & 3: Start and End lines (Height)
    -- Param 4: Characters to trim from left/right (Width)
    local resized_ascii = resize_ascii(ascii, 2, 26, 5)

    starter.setup({
      evaluate_single = true,
      header = table.concat(resized_ascii, "\n") .. "\n\n" .. default_header(),
      items = {
        starter.sections.builtin_actions(),
        starter.sections.recent_files(nil, false),
        starter.sections.recent_files(nil, true),
        starter.sections.sessions(5, true)
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.indexing('all', { 'Builtin actions' }),
        starter.gen_hook.padding(5, 2),
        -- Center header (1st param) and body sections (2nd param)
        starter.gen_hook.aligning('center', 'center')
      },
    })

    -- Highlight styling applied to Dracula theme
    local set_hl = vim.api.nvim_set_hl

    -- ASCII Meme Banner: Dracula Red (#FF5555) for dramatic rage effect
    set_hl(0, "MiniStarterHeader", { fg = "#FF5555", bold = true })

    -- Section Headers (e.g., "Builtin actions", "Recent files"): Dracula Cyan
    set_hl(0, "MiniStarterSection", { fg = "#8BE9FD", bold = true })

    -- Item Key / Index (e.g., [1], [2]): Dracula Pink
    set_hl(0, "MiniStarterItemPrefix", { fg = "#FF79C6", bold = true })

    -- Action Names: Dracula Purple
    set_hl(0, "MiniStarterItemBullet", { fg = "#BD93F9" })

    -- Footer / Query Line: Dracula Comment (Muted Purple)
    set_hl(0, "MiniStarterFooter", { fg = "#6272A4", italic = true })
  end
}
