return {
  "echasnovski/mini.nvim",
  config = function()
    local starter = require('mini.starter')

    ---------------------------------------------------------------------------
    -- Width limits for recent-file items (in characters)
    ---------------------------------------------------------------------------
    local MAX_NAME = 32 -- max length of the file name itself
    local MAX_DIR  = 28 -- max length of the (shortened) directory hint
    local SEP      = package.config:sub(1, 1) -- "/" or "\" on Windows

    -- Cut from the right: "very_long_file_name.lua" -> "very_long_fi…"
    local function trunc_right(str, max)
      if vim.fn.strchars(str) <= max then return str end
      return vim.fn.strcharpart(str, 0, max - 1) .. '…'
    end

    -- Cut from the left (keeps the most specific part of a path): "…/lua/plugins"
    local function trunc_left(str, max)
      local len = vim.fn.strchars(str)
      if len <= max then return str end
      return '…' .. vim.fn.strcharpart(str, len - max + 1)
    end

    -- "~/.config/nvim/lua/plugins" -> "~/.c/n/l/plugins" (then length-capped)
    local function short_dir(path, relative_to_cwd)
      local dir = vim.fn.fnamemodify(path, relative_to_cwd and ':.:h' or ':~:h')
      if dir == '.' or dir == '' then return '' end
      return trunc_left(vim.fn.pathshorten(dir), MAX_DIR)
    end

    -- Drop-in replacement for starter.sections.recent_files() with short names
    local function recent_files(n, current_dir)
      n = n or 5
      local section = current_dir and 'Recent files (cwd)' or 'Recent files'

      -- Returning a function makes mini.starter re-evaluate it on every refresh
      return function()
        local cwd = vim.fn.getcwd() .. SEP
        local files = vim.tbl_filter(function(f)
          if vim.fn.filereadable(f) == 0 then return false end
          if current_dir then
            return vim.startswith(vim.fn.fnamemodify(f, ':p'), cwd)
          end
          return true
        end, vim.v.oldfiles or {})

        if #files == 0 then
          return { { name = 'There are no recent files', action = '', section = section } }
        end

        local items = {}
        for i = 1, math.min(n, #files) do
          local path = files[i]
          local name = trunc_right(vim.fn.fnamemodify(path, ':t'), MAX_NAME)
          local dir  = short_dir(path, current_dir)
          if dir ~= '' then name = ('%s  (%s)'):format(name, dir) end

          table.insert(items, {
            name    = name,
            action  = function() vim.cmd.edit(vim.fn.fnameescape(path)) end,
            section = section,
          })
        end
        return items
      end
    end

    ---------------------------------------------------------------------------
    -- Hooks
    ---------------------------------------------------------------------------
    local focus_top = function(content)
      vim.schedule(function()
        if vim.bo.filetype == "ministarter" then
          vim.api.nvim_win_set_cursor(0, { 1, 0 })
        end
      end)
      return content
    end

    ---------------------------------------------------------------------------
    -- Header
    ---------------------------------------------------------------------------
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

    local greeting = function()
      local hour = tonumber(vim.fn.strftime('%H'))
      local part_id = math.floor((hour + 4) / 8) + 1
      local day_part = ({ 'evening', 'morning', 'afternoon', 'evening' })[part_id]
      return ('Good %s, %s'):format(day_part, 'Pete!')
    end

    -- Crops height (line range) and width (chars trimmed from each side)
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

    -- Params: start line, end line (height), chars to trim left/right (width)
    local banner = table.concat(resize_ascii(ascii, 2, 26, 5), "\n")

    ---------------------------------------------------------------------------
    -- Setup
    ---------------------------------------------------------------------------
    starter.setup({
      evaluate_single = true,
      -- Function so the greeting updates whenever the starter is redrawn
      header = function() return banner .. "\n\n" .. greeting() end,
      items = {
        starter.sections.builtin_actions(),
        recent_files(5, false),
        recent_files(5, true),
        starter.sections.sessions(5, true),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.indexing('all', { 'Builtin actions' }),
        starter.gen_hook.padding(5, 2),
        -- Center header (1st param) and body sections (2nd param)
        starter.gen_hook.aligning('center', 'center'),
        focus_top,
      },
    })

    ---------------------------------------------------------------------------
    -- Highlights (Dracula)
    ---------------------------------------------------------------------------
    local set_hl = vim.api.nvim_set_hl
    set_hl(0, "MiniStarterHeader",     { fg = "#FF5555", bold = true })   -- banner: red
    set_hl(0, "MiniStarterSection",    { fg = "#8BE9FD", bold = true })   -- sections: cyan
    set_hl(0, "MiniStarterItemPrefix", { fg = "#FF79C6", bold = true })   -- [1], [2]: pink
    set_hl(0, "MiniStarterItemBullet", { fg = "#BD93F9" })                -- bullets: purple
    set_hl(0, "MiniStarterFooter",     { fg = "#6272A4", italic = true }) -- footer: comment
  end
}
