local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_background_opacity = 0.8
config.window_background_image_hsb = {
  brightness = 0.8,
  hue = 1.0,
  saturation = 1.0
}

config.font = wezterm.font_with_fallback {
  'FiraCode Nerd Font Mono',
  'Victor Mono',
  -- 'LXGW WenKai Mono'
  -- 'Noto Sans CJK SC',
  'LXGW Neo XiHei',
}


config.font_rules = {
  {
    italic = true,
    font = wezterm.font_with_fallback {
      'Victor Mono',
      'LXGW WenKai Mono'
      -- { family = 'Zhi Mang Xing', scale = 1.2 }
    },
  }
}
config.font_size = 14
-- config.harfbuz_features = { 'liga = 1' }

return config

-- return {
--   window_background_opacity = 0.8,
--   window_background_image_hsb = {
--     brightness = 0.8,
--     hue = 1.0,
--     saturation = 1.0
--   },
--   -- font
--   font = wezterm.font_with_fallback {
--     'Fira Code Retina',
--     'Symbols Nerd Font',
--     'Noto Sans CJK SC DemiLight',
--   },
--   font_size = 16,
--   harfbuzz_features = { 'liga = 1' },
--   -- assume_emoji_presentation = true,
--   -- xim_im_name = 'fcitx',
--   -- use_ime = true,
-- }
