-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Color scheme:
config.color_scheme = 'Gruvbox Material (Gogh)'
-- Font 
config.font_size = 24.0
config.font = wezterm.font('JetBrains Mono', { weight = 'Bold'})

-- do not ask quit confirmation
config.window_close_confirmation = 'NeverPrompt'

-- colors
config.colors = {
  cursor_bg = '#928374',
  cursor_border = '#928374',
}

-- term
config.term = "xterm-256color"
-- window size
config.initial_cols = 80
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
    key = '-',
    mods = 'CMD',
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
