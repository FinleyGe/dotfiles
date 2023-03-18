local wezterm = require 'wezterm'

return {
  -- color
  -- color_scheme = "Monokai (terminal.sexy)",
  -- color_scheme = "MonokaiPro (Gogh)",
  -- color_scheme = "MonokaiProRistretto (Gogh)",
  -- color_scheme = "nord",
  window_background_opacity = 0.8,
  window_background_image_hsb = {
    brightness = 0.8,
    hue = 1.0,
    saturation = 1.0
  },
  -- font
  font = wezterm.font_with_fallback {
    'Fira Code Retina',
    'Symbols Nerd Font',
    'Noto Sans CJK SC DemiLight',
  },
  font_size = 16,
  harfbuzz_features = { 'liga = 1' },
  assume_emoji_presentation = true,
  -- xim_im_name = 'fcitx',
  -- use_ime = true,
}
