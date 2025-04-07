-- debug.lua
local debug = {}

debug.messages = {}

function debug.log(msg)
    table.insert(debug.messages, tostring(msg))
end

function debug.clear()
    debug.messages = {}
end

function debug.draw(x, y)
    for i, msg in ipairs(debug.messages) do
        love.graphics.print(msg, x or 10, (y or 10) + (i - 1) * 15)
    end
end

return debug
