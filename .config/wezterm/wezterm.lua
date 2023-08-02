local wezterm = require 'wezterm';

-- wezterm.on("open-nvtop-and-ytop", function(win, pane)
--   win:perform_action(wezterm.action{ SplitHorizontal = { domain = "CurrentPaneDomain", args = { "nvtop", }, }, }, pane)
--   win:perform_action(wezterm.action{ SplitVertical = { domain = "CurrentPaneDomain", args = { "ytop", "-ps", }, }, }, pane)
-- end)



return {
  keys = {
    {
      key = '-',
      mods = 'CTRL',
      action = wezterm.action{SplitVertical={domain="CurrentPaneDomain"}},
    },
    {
      key = 'f',
      mods = 'CTRL',
      action = wezterm.action{Search={CaseSensitiveString=""}},
    },
    {
      key = '\\',
      mods = 'CTRL',
      action = wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}},
    },
  },
  -- font = wezterm.font("UDEV Gothic 35NFLG", {weight="Bold", stretch="Normal", style="Normal"}),
  use_ime = true, -- wezは日本人じゃないのでこれがないとIME動かない
  font_size = 11.0,
  color_scheme = "tender (base16)", -- 自分の好きなテーマ探す https://wezfurlong.org/wezterm/colorschemes/index.html
  -- color_scheme = "Broadcast",
  -- color_scheme = "Decaf (base16)",
  -- color_scheme = "Poimandres", --青っぽいテーマ結構好き
--   adjust_window_size_when_changing_font_size = false,
  window_background_opacity = 0.9,
  text_background_opacity = 0.6,
}

-- 立ち上げのときのパネル設定
-- local new_pane = pane:split {}

-- pane:split { args = { "top" } }
-- pane:split { args = { "Right" } }

-- pane:split { set_environment_variables = { FOO = 'BAR' } }

-- pane:split { direction = 'Top', size = 0.333 }
-- pane:split { direction = 'Top', size = 0.5 }





