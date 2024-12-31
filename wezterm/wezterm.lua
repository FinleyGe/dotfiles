local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local function isViProcess(pane)
  -- get_foreground_process_name On Linux, macOS and Windows,
  -- the process can be queried to determine this path. Other operating systems
  -- (notably, FreeBSD and other unix systems) are not currently supported
  return pane:get_foreground_process_name():find('n?vim') ~= nil
  -- return pane:get_title():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
  if isViProcess(pane) then
    window:perform_action(
    -- This should match the keybinds you set in Neovim.
      act.SendKey({ key = vim_direction, mods = 'ALT' }),
      pane
    )
  else
    window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
  end
end

wezterm.on('ActivatePaneDirection-right', function(window, pane)
  conditionalActivatePane(window, pane, 'Right', 'l')
end)
wezterm.on('ActivatePaneDirection-left', function(window, pane)
  conditionalActivatePane(window, pane, 'Left', 'h')
end)
wezterm.on('ActivatePaneDirection-up', function(window, pane)
  conditionalActivatePane(window, pane, 'Up', 'k')
end)
wezterm.on('ActivatePaneDirection-down', function(window, pane)
  conditionalActivatePane(window, pane, 'Down', 'j')
end)

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Catppuccin Macciatto'
  else
    return 'Catppuccin Latte'
  end
end

local function background_for_appearance(appearance)
  if appearance:find 'Dark' then
    return {
      orientation = 'Vertical',
      colors = {
        '#0b0f29',
        '#1D2347',
      },
      noise = 64,
    }
  else
    return {
      orientation = 'Vertical',
      colors = {
        '#dce0e8',
        '#EFF1F5',
      },
      noise = 64,
    }
  end
end


local home = os.getenv('HOME')

function get_image_by_appearance(appearance)
  if appearance:find 'Dark' then
    -- return '/home/finley/.config/wezterm/images/dark.png'
    return home .. '/.config/wezterm/images/dark-2.png'
  else
    return home .. '/.config/wezterm/images/light-2.png'
  end
end

config.background = {
  {
    source = {
      File = get_image_by_appearance(get_appearance())
    },
  }
}

config.color_scheme = scheme_for_appearance(get_appearance())
-- config.window_background_gradient = background_for_appearance(get_appearance())
config.initial_cols = 120
config.initial_rows = 40

config.font = wezterm.font_with_fallback {
  'FiraCode Nerd Font',
  'Victor Mono',
  'LXGW Neo XiHei',
  'LXGW WenKai',
}

config.warn_about_missing_glyphs = false

config.font_rules = {
  {
    italic = false,
    font = wezterm.font_with_fallback {
      {
        family = 'FiraCode Nerd Font',
        weight = 450,
      },
      {
        family = 'Victor Mono',
        weight = 'Regular',
      },
      {
        family = 'LXGW Neo XiHei',
        weight = 'Regular',
      },
      {
        family = 'LXGW WenKai',
        weight = 'Regular',
      },
      -- 'Victor Mono',
      -- 'LXGW Neo Xihei',
      -- 'LXGW WenKai',
    },
  },
  {
    italic = true,
    font = wezterm.font_with_fallback {
      {
        family = 'Victor Mono',
        weight = 'Medium',
        italic = true,
      }, {
      family = 'LXGW WenKai',
      weight = 'Bold',
    }
    },
  }, {
  intensity = 'Bold',
  font = wezterm.font_with_fallback {
    {
      family = 'FiraCode Nerd Font',
      weight = 'Bold',
    }, {
    family = 'LXGW Neo XiHei',
    weight = 'Bold',
  }
  },
}, {
  intensity = 'Bold',
  italic = true,
  font = wezterm.font_with_fallback {
    {
      family = 'FiraCode Nerd Font',
      weight = 'Bold',
      italic = true,
    },
    'LXGW WenKai',
  },
},
}

config.font_size = 13
config.leader = { key = 'x', mods = 'CTRL' }
config.keys = {
  { key = 's',   mods = 'ALT',          action = act.SplitHorizontal },
  { key = 'v',   mods = 'ALT',          action = act.SplitVertical },
  { key = 'h',   mods = 'ALT',          action = act.EmitEvent('ActivatePaneDirection-left') },
  { key = 'j',   mods = 'ALT',          action = act.EmitEvent('ActivatePaneDirection-down') },
  { key = 'k',   mods = 'ALT',          action = act.EmitEvent('ActivatePaneDirection-up') },
  { key = 'l',   mods = 'ALT',          action = act.EmitEvent('ActivatePaneDirection-right') },
  { key = ':',   mods = 'LEADER|SHIFT', action = act.ActivateCommandPalette },
  { key = 'c',   mods = 'LEADER',       action = act.SpawnTab 'CurrentPaneDomain' },
  { key = ' ',   mods = 'LEADER',       action = act.RotatePanes 'CounterClockwise' },
  { key = 'x',   mods = 'LEADER',       action = act.CloseCurrentPane { confirm = true } },
  { key = '1',   mods = 'LEADER',       action = act.ActivateTab(0) },
  { key = '2',   mods = 'LEADER',       action = act.ActivateTab(1) },
  { key = '3',   mods = 'LEADER',       action = act.ActivateTab(2) },
  { key = '4',   mods = 'LEADER',       action = act.ActivateTab(3) },
  { key = '5',   mods = 'LEADER',       action = act.ActivateTab(4) },
  { key = '6',   mods = 'LEADER',       action = act.ActivateTab(5) },
  { key = '7',   mods = 'LEADER',       action = act.ActivateTab(6) },
  { key = '8',   mods = 'LEADER',       action = act.ActivateTab(7) },
  { key = '9',   mods = 'LEADER',       action = act.ActivateTab(8) },
  { key = '0',   mods = 'LEADER',       action = act.ActivateTab(9) },
  { key = 's',   mods = 'LEADER',       action = act.ShowTabNavigator },
  { key = 'm',   mods = 'LEADER',       action = act.TogglePaneZoomState },
  { key = 't',   mods = 'LEADER',       action = act.ShowLauncher },
  { key = 'Tab', mods = 'LEADER',       action = act.ActivateTabRelative(1) },
  { key = 'Tab', mods = 'LEADER|SHIFT', action = act.ActivateTabRelative(-1) },
  {
    key = '-',
    mods = 'ALT',
    action = act.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = '_',
    mods = 'ALT',
    action = act.AdjustPaneSize { 'Down', 5 },
  },
}

config.use_fancy_tab_bar = false

config.integrated_title_buttons = {
  'Hide', 'Maximize', 'Close'
  -- 'Close',
}

config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.integrated_title_button_style = 'Gnome'

-- config.unix_domains = {
--   {
--     name = 'unix',
--   }
-- }
--
-- config.default_gui_startup_args = { 'connect', 'unix' }

local tab_bar_background_list = {
  "#FFCCCC", -- 淡红色
  "#CCFFCC", -- 淡绿色
  "#CCCCFF", -- 淡蓝色
  "#FFFFCC", -- 淡黄色
  "#FFCCFF", -- 淡紫色
  "#CCFFFF", -- 淡青色
  "#FFD700", -- 金色
  "#9400D3"  -- 紫罗兰色
}

local function get_random_tab_bar_background()
  return tab_bar_background_list[math.random(8)]
end

local function get_color_by_window_id(window_id)
  local colors = {
    "#FFCCCC", -- 淡红色
    "#CCFFCC", -- 淡绿色
    "#CCCCFF", -- 淡蓝色
    "#FFFFCC", -- 淡黄色
    "#FFCCFF", -- 淡紫色
    "#CCFFFF", -- 淡青色
    "#FFD700", -- 金色
    "#9400D3"  -- 紫罗兰色
  }
  return colors[window_id % 8 + 1]
end

-- config.hide_tab_bar_if_only_one_tab = true

config.colors = {
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#1b1032',
    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = '#2b2042',
      -- The color of the text for the tab
      fg_color = '#c0c0c0',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Bold',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'Single',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = true,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',
      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab.tab_index + 1
    title = wezterm.truncate_right(title, max_width - 2)
    return {
      { Text = " " },
      { Text = title },
      { Text = " " },
    }
  end
)

config.tab_bar_style = {
  window_hide = wezterm.format({
    { Text = " " .. wezterm.nerdfonts.fa_angle_down .. " " },
  }),
  window_hide_hover = wezterm.format({
    { Text = " " .. wezterm.nerdfonts.fa_angle_down .. " " },
  }),
  window_maximize = wezterm.format({
    { Text = " " .. wezterm.nerdfonts.fa_angle_up .. " " },
  }),
  window_maximize_hover = wezterm.format({
    { Text = " " .. wezterm.nerdfonts.fa_angle_up .. " " },
  }),

  window_close = wezterm.format({
    { Text = " " .. wezterm.nerdfonts.cod_close .. " " },
  }),
  window_close_hover = wezterm.format({
    { Text = " " .. wezterm.nerdfonts.cod_close .. " " },
  }),
}

wezterm.on('update-right-status', function(window, pane)
  local date = wezterm.strftime '%H:%M:%S'
  -- local active_tab_name = window:active_tab():get_title()
  window:set_right_status(wezterm.format {
    { Attribute = { Intensity = "Half" } },
    { Background = { Color = get_color_by_window_id(window:window_id()) } },
    { Attribute = { Italic = true } },
    { Text = " " .. window:mux_window():get_title() },
    { Text = " " .. date .. " " },
  })
end)

return config
