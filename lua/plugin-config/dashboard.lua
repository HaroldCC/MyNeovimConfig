local status, db = pcall(require, "dashboard")
if not status then
    vim.notify("没有找到 dashboard")
    return
end

db.custom_footer = {
    "",
    "",
    " 🐤🤞🤗🐲🐳🔱🌤️🚌🍁🍉🥟🕯️🏹🏀 "
}

db.custom_center = {
    {
        icon = "\t\t\t    ",
        desc = "Projects                            ",
        action = "Telescope projects",
    },
    {
        icon = "\t\t\t    ",
        desc = "Recently files                      ",
        action = "Telescope oldfiles",
    },
    {
        icon = "\t\t\t    ",
        desc = "Edit keybindings                    ",
        action = "edit ~/.config/nvim/lua/keybindings.lua",
    },
    {
        icon = "\t\t\t    ",
        desc = "Edit Projects                       ",
        action = "edit ~/.local/share/nvim/project_nvim/project_history",
    },
    -- {
    --   icon = "  ",
    --   desc = "Edit .bashrc                        ",
    --   action = "edit ~/.bashrc",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Change colorscheme                  ",
    --   action = "ChangeColorScheme",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Edit init.lua                       ",
    --   action = "edit ~/.config/nvim/init.lua",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Find file                           ",
    --   action = "Telescope find_files",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Find text                           ",
    --   action = "Telescopecope live_grep",
    -- },
}


db.custom_header = {
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[██╗  ██╗ █████╗ ██████╗  ██████╗ ██╗     ██████╗ ]],
    [[██║  ██║██╔══██╗██╔══██╗██╔═══██╗██║     ██╔══██╗]],
    [[███████║███████║██████╔╝██║   ██║██║     ██║  ██║]],
    [[██╔══██║██╔══██║██╔══██╗██║   ██║██║     ██║  ██║]],
    [[██║  ██║██║  ██║██║  ██║╚██████╔╝███████╗██████╔╝]],
    [[╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═════╝ ]],
    [[                                                 ]],
    [[                                                 ]],
    [[             [ version : 1.0.0 ]                 ]],
    [[]],
    [[]],
}
