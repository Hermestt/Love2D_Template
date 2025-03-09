--[[local function printTableDebug(t, indent)
    indent = indent or 0
    local spacing = string.rep("  ", indent)

    for k, v in pairs(t) do
        if type(v) == "table" then
            print(spacing .. tostring(k) .. " = {")
            printTableDebug(v, indent + 1)
            print(spacing .. "}")
        else
            print(spacing .. tostring(k) .. " = " .. tostring(v))
        end
    end
end ]] --

local function printTableDebug(tbl, indent)
    indent = indent or 0
    local formatting = string.rep("  ", indent)

    if type(tbl) ~= "table" then
        print(formatting .. tostring(tbl))
        return
    end

    for k, v in pairs(tbl) do
        local keyStr = formatting .. tostring(k) .. ": "
        if type(v) == "table" then
            print(keyStr)
            printTableDebug(v, indent + 1) -- Recursive call for nested tables
        else
            print(keyStr .. tostring(v))
        end
    end
end

return printTableDebug
