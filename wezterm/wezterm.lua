local wezterm  = require('wezterm')
return {
    default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe' },
    color_scheme_dirs = { 'C:\\Users\\LLBlumire\\AppData\\Roaming\\wezterm\\colors' },
    color_scheme = 'carbonfox',
    enable_tab_bar = false,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    font = wezterm.font("JetBrains Mono"),
    line_height = 1.125,
    font_size = 12,
}
