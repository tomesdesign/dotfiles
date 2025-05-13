-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Color scheme:
config.color_scheme = 'Gruvbox Material (Gogh)'
-- config.colors = {
--   foreground = '#000000', -- Foreground (Text)
--   -- background = '#ffffea', -- Background FFFFD8
--   background = '#ffffd8', -- color from official Tour of Go

--   cursor_bg = '#000000',  -- Cursor color
--   cursor_border = '#000000',
--   cursor_fg = '#ffffea',

--   selection_bg = '#B2D7F0', -- Selection background
--   selection_fg = '#000000', -- Selection foreground

--   ansi = {
--     '#101010', -- Black (Host)
--     '#d70000', -- Red (Syntax string / Errors) - Bright red for better visibility
--     '#5f8700', -- Green (Command) - Muted green for contrast
--     '#af8700', -- Yellow (Command second) - Golden yellow
--     '#005faf', -- Blue (Path) - Muted blue
--     '#8700af', -- Magenta (Syntax var) - Purple tone
--     '#008787', -- Cyan (Prompt) - Muted cyan
--     '#e4e4e4', -- White - Light gray for subtlety
--   },
--   brights = {
--     '#303030', -- Bright Black - Dark gray for emphasis
--     '#ff0000', -- Bright Red (Command error) - Vivid red for errors
--     '#87d700', -- Bright Green (Exec) - Brighter green
--     '#af8700', -- Bright Yellow - same as ansi
--     '#5fafff', -- Bright Blue (Folder) - Brighter blue
--     '#af5fff', -- Bright Magenta - Brighter purple tone
--     '#00d7af', -- Bright Cyan - Brighter cyan
--     '#ffffff', -- Bright White - Pure white for strong contrast
--   },
-- }


-- Font 
config.font_size = 18.0
config.font = wezterm.font {
  family = 'JetBrains Mono',
  weight = 'Medium',
  harfbuzz_features = { 'calt=0' },
}

-- do not ask quit confirmation
config.window_close_confirmation = 'NeverPrompt'

-- colors
-- config.colors = {
--   cursor_bg = '#928374',
--   cursor_border = '#928374',
-- }

-- term
-- config.term = "xterm-256color"
config.term = "xterm-kitty" -- we want kitty protocol to support images
config.	enable_kitty_graphics = true
max_fps = 120
-- window size
config.initial_cols = 100
config.initial_rows = 60
-- disable the title bar but enable the resizable border
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
-- window padding
config.window_padding = {
  left = 20,
  right = 0,
  top = 10,
  bottom = 0,
 }

 config.use_fancy_tab_bar = false

 -- Key shortcuts
 config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = '\\',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '\\',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- move between splits
  {
    key="h", 
    mods="CMD", 
    action=wezterm.action{ActivatePaneDirection="Left"}
  },
  {
    key="l", 
    mods="CMD", 
    action=wezterm.action{ActivatePaneDirection="Right"}
  },
  {
    key="j", 
    mods="CMD", 
    action=wezterm.action{ActivatePaneDirection="Down"}
  },
  {
    key="k", 
    mods="CMD", 
    action=wezterm.action{ActivatePaneDirection="Up"}
  },
  -- cycle panes
  {
    key="]", 
    mods="CMD", 
    action=wezterm.action{ActivatePaneDirection="Next"}
  },
  {
    key="[", 
    mods="CMD", 
    action=wezterm.action{ActivatePaneDirection="Prev"}
  },
}

-- and finally, return the configuration to wezterm
return config
