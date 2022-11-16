local wezterm = require 'wezterm'
-- local act = wezterm.action

return {

-- color
  -- color_scheme = "Monokai (terminal.sexy)",
  -- color_scheme = "MonokaiPro (Gogh)",
  -- color_scheme = "MonokaiProRistretto (Gogh)",
  color_scheme = "nord",
  window_background_opacity = 0.9,
  window_background_image_hsb = {
        brightness = 0.8,
        hue = 1.0,
        saturation = 1.0
  },
-- font
  font = wezterm.font_with_fallback {
    'FiraCode Nerd Font',
    'Noto Sans CJK SC DemiLight',
  },

  font_size = 16,

  harfbuzz_features = { 'liga = 1'},
  assume_emoji_presentation = true,
  xim_im_name = 'fcitx',

-- keybind

  -- leader = { key = 'x', mods = 'CTRL'},

  -- keys = {
    -- F11 full Screen
    -- {
    --   key = 'F11',
    --   action = wezterm.action.ToggleFullScreen,
    -- },

    --[[ { ]]
  --[[     key = 'r', ]]
  --[[     mods = 'LEADER', ]]
  --[[     action = act.ActivateKeyTable{ ]]
  --[[       name = 'resize_pane', ]]
  --[[       one_shot = false, ]]
  --[[     }, ]]
  --[[   }, ]]
  --[[     { key = 'h', mods="CTRL", ]]
  --[[     action = act.ActivatePaneDirection 'Left' }, ]]
  --[[  ]]
  --[[     { key = 'l', mods="CTRL", ]]
  --[[     action = act.ActivatePaneDirection 'Right' }, ]]
  --[[  ]]
  --[[     { key = 'k', mods="CTRL", ]]
  --[[     action = act.ActivatePaneDirection 'Up' }, ]]
  --[[  ]]
  --[[     { key = 'j', mods="CTRL", ]]
  --[[     action = act.ActivatePaneDirection 'Down' }, ]]
  --[[ }, ]]
  --[[  ]]
  --[[ key_tables = { ]]
  --[[   resize_pane = { ]]
  --[[     { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } }, ]]
  --[[     { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } }, ]]
  --[[     { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } }, ]]
  --[[     { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } }, ]]
  --[[     { key = 'Escape', action = 'PopKeyTable' }, ]]
  --[[   }, ]]
  --[[ }, ]]
}
