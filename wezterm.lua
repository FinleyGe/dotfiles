local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}
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

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.initial_cols = 150
config.initial_rows = 40

config.window_background_opacity = 0.8
config.window_background_image_hsb = {
  brightness = 0.8,
  hue = 1.0,
  saturation = 1.0
}

config.font = wezterm.font_with_fallback {
  'FiraCode Nerd Font',
  -- 'Victor Mono',
  'LXGW Neo XiHei',
}
config.warn_about_missing_glyphs = false

config.font_rules = {
  {
    italic = true,
    font = wezterm.font_with_fallback {
      'Victor Mono',
      'LXGW WenKai Mono',
      'FiraCode Nerd Font Mono',
    },
  }
}

config.font_size = 14
config.leader = { key = 'x', mods = 'CTRL' }
config.keys = {
  { key = 'v', mods = 'ALT',          action = act.SplitHorizontal },
  { key = 's', mods = 'ALT',          action = act.SplitVertical },
  { key = 'h', mods = 'ALT',          action = act.EmitEvent('ActivatePaneDirection-left') },
  { key = 'j', mods = 'ALT',          action = act.EmitEvent('ActivatePaneDirection-down') },
  { key = 'k', mods = 'ALT',          action = act.EmitEvent('ActivatePaneDirection-up') },
  { key = 'l', mods = 'ALT',          action = act.EmitEvent('ActivatePaneDirection-right') },
  { key = ':', mods = 'LEADER|SHIFT', action = act.ActivateCommandPalette },
  { key = 'c', mods = 'LEADER',       action = act.SpawnTab 'CurrentPaneDomain' },
  { key = ' ', mods = 'LEADER',       action = act.RotatePanes 'CounterClockwise' },
  { key = 'x', mods = 'LEADER',       action = act.CloseCurrentPane { confirm = true } },
  { key = '1', mods = 'LEADER',       action = act.ActivateTab(0) },
  { key = '2', mods = 'LEADER',       action = act.ActivateTab(1) },
  { key = '3', mods = 'LEADER',       action = act.ActivateTab(2) },
  { key = '4', mods = 'LEADER',       action = act.ActivateTab(3) },
  { key = '5', mods = 'LEADER',       action = act.ActivateTab(4) },
  { key = '6', mods = 'LEADER',       action = act.ActivateTab(5) },
  { key = '7', mods = 'LEADER',       action = act.ActivateTab(6) },
  { key = '8', mods = 'LEADER',       action = act.ActivateTab(7) },
  { key = '9', mods = 'LEADER',       action = act.ActivateTab(8) },
  { key = '0', mods = 'LEADER',       action = act.ActivateTab(9) },
  { key = 's', mods = 'LEADER',       action = act.ShowTabNavigator },
  { key = 'm', mods = 'LEADER',       action = act.TogglePaneZoomState },
  { key = 't', mods = 'LEADER',       action = act.ShowLauncher },
}

return config
