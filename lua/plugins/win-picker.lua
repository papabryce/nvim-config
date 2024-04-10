return {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
        require 'window-picker'.setup({
            picker_config = {
                statusline_winbar_picker = {
                    -- You can change the display string in status bar.
                    -- It supports '%' printf style. Such as `return char .. ': %f'` to display
                    -- buffer file path. See :h 'stl' for details.
                    selection_display = function(char, windowid)
                        return '%=' .. char .. '%='
                    end,

                    -- whether you want to use winbar instead of the statusline
                    -- "always" means to always use winbar,
                    -- "never" means to never use winbar
                    -- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
                    use_winbar = 'never', -- "always" | "never" | "smart"
                },

                floating_big_letter = {
                    -- window picker plugin provides bunch of big letter fonts
                    -- fonts will be lazy loaded as they are being requested
                    -- additionally, user can pass in a table of fonts in to font
                    -- property to use instead

                    font = 'ansi-shadow', -- ansi-shadow |
                },
            },
        })
    end,
}
