local wezterm = require 'wezterm'

local config = {}

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
  'FiraCode Nerd Font Mono',
  'Victor Mono',
  'LXGW Neo XiHei',
}


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

return config
