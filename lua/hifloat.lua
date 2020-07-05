
local api = vim.api

local function create_buf()
    return api.nvim_create_buf(false, true)
end

local function create_win(x, y, width, color, blend)
    local buf = api.nvim_create_buf(false, true)
    local options = {
        relative='win',
        focusable=false,
        bufpos={x, y},
        row=0,
        col=0,
        width=width,
        height=1,
        style='minimal',
        win=wid,
    }
    win = api.nvim_open_win(buf, false, options)
    api.nvim_win_set_option(win, 'winhl', 'Normal:HiFloat' .. color)
    api.nvim_win_set_option(win, 'winblend', blend)
    return win
end

local function close_win(buf)
    return vim.api.nvim_win_close(buf, true)
end

return {
    create_win = create_win,
    close = close_win,
}
