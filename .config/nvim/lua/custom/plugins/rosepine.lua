return {
  'rose-pine/neovim',
  name = 'rose-pine',
  opts = {
    variant = 'moon',
    -- variant = 'main',
    dim_inactive_windows = true,
    extend_background_behind_borders = true,
    styles = {
      bold = true,
      -- italic = false,
      italic = true,
      -- transparency = false,
      transparency = true,
    },
    highlight_groups = {
      Comment = { italic = true },
    },
  },
}
