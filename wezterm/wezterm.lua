-- Allow wezterm to understand windows paths 
package.path = package.path
  .. ";E:\\.config\\wezterm\\?.lua"
  .. ";E:\\.config\\wezterm\\?/init.lua"

local wezterm = require("wezterm")
local constants = require("constants")
local scripts = require("scripts")
local config = wezterm.config_builder()

-- Font
config.font_size = 12
config.line_height = 1.2
config.font = wezterm.font("CaskaydiaCove Nerd Font")

-- Colors
config.colors = {
 cursor_bg = "white",
 cursor_border = "white",
 background = "#000000",
 tab_bar = {
   background = "#000000",
   inactive_tab = {
     bg_color = "#000000",
     fg_color = "#888888",
   },
   active_tab = {
     bg_color = "#000000",
     fg_color = "#FFFFFF",
   },
   inactive_tab_hover = {
     bg_color = "#1a1a1a",
     fg_color = "#cccccc",
   },
   new_tab = {
     bg_color = "#000000",
     fg_color = "#ffffff",
   },
   new_tab_hover = {
     bg_color = "#1a1a1a",
     fg_color = "#ffffff",
   },
  },
}
config.color_scheme = "Oceanic Next (Gogh)"

-- Appearance
config.window_decorations = "RESIZE"
config.window_padding = {
 left = 10,
 right = 10,
 top = 0,
 bottom = 0,
}
config.foreground_text_hsb = {
  hue = 1.0,
  saturation = 1.2,
  brightness = 2,
}
-- config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Use this settings if you want to use an bg image
config.background = {{
 source = { File = { path = constants.bg_image }},
 opacity = 1,
 width = "100%",
 hsb = { brightness = 0.25 },
}}

-- Blur/Transparent Effect (this only appears to work on w11)
-- config.window_background_opacity = 0.7
-- config.win32_system_backdrop = "Acrylic"

-- Miscellaneous
config.mouse_bindings = constants.mouse_bindings
config.disable_default_key_bindings = true
config.keys = constants.key_bindings
config.max_fps = 120
config.prefer_egl = true

-- WSL settings
config.default_prog = { "wsl.exe", "--cd", "~", "--exec", "zsh" }

return config
