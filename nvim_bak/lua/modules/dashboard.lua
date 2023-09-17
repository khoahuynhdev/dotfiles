local home = os.getenv('HOME')
local db = require('dashboard')

-- db.custom_header = {
-- '             `.............--------------`',
-- '          `:+ooooooooooooyyyyyyyyyyyyys:` ',
-- '         `-+oooooooooooosyyyyyyyyyyyys:`  ',
-- '       `-+oooooooooooosyyyyyyyyyyyys/`    ',
-- '      ./oooooooooooosyyyyyyyyyyyys/`      ',
-- '     /ooooooooooo+:--------------.        ',
-- '     oooooooooo+:`                        ',
-- '     ooooooooo/`            ``````````````',
-- '     ooooooo/.            `/yyyyyyyyyyyyso',
-- '     ooooo/.            `/yyyyyyyyyyyysooo',
-- '     ooo/.            `/yyyyyyyyyyyysooooo',
-- '     o+-            `/yyyyyyyyyyyysooooooo',
-- '     -`            `-::::::::::/oooooooooo',
-- '                             `-+oooooooooo',
-- '                           `-+oooooooooo+/',
-- '                         `-+oooooooooo+/. ',
-- '                       `-/oooooooooo+/.   ',
-- '                     `-+oooooooooo+/.     ',
-- '                    ./+++++++++++/.       ',
-- '                    `````````````         ',
-- }

-- db.custom_center = {
--       {icon = '  ',
--       desc = 'Recently latest session                  ',
--       shortcut = 'SPC s l',
--       action ='SessionLoad'},
--       {icon = '  ',
--       desc = 'Recently opened files                   ',
--       action =  'DashboardFindHistory',
--       shortcut = 'SPC f h'},
--       {icon = '  ',
--       desc = 'Find  File                              ',
--       action = 'Telescope find_files find_command=rg,--hidden,--files',
--       shortcut = 'SPC f f'},
--       {icon = '  ',
--       desc ='File Browser                            ',
--       action =  'Telescope file_browser',
--       shortcut = 'SPC f b'},
--       {icon = '  ',
--       desc = 'Find  word                              ',
--       action = 'Telescope live_grep',
--       shortcut = 'SPC f w'},
--       {icon = '  ',
--       desc = 'Open Personal dotfiles                  ',
--       action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
--       shortcut = 'SPC f d'},
--     }
-- -- Highlight Group
vim.api.nvim_set_hl(0, 'DashboardHeader', {fg = "#00DCDC"})

vim.g.indentLine_fileTypeExclude = {'dashboard'}

db.setup({
    theme = 'hyper',
    config = {
        week_header = {enable = true},
        shortcut = {
            {
                desc = '󰊳 Update',
                group = '@property',
                action = 'Lazy update',
                key = 'u'
            }, {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
                group = 'Label',
                action = 'Telescope find_files',
                key = 'f'
            }, {
                desc = ' Apps',
                group = 'DiagnosticHint',
                action = 'Telescope app',
                key = 'a'
            }, {
                desc = ' dotfiles',
                group = 'Number',
                action = 'Telescope dotfiles',
                key = 'd'
            }
        }
    }
})
