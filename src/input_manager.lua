-- input_manager.lua

-- This table is the manager and will contain some functions
-- that can be accessed from entities or the main.lua.

local Input_Manager = {}

-- Map specific user inputs to game actions
local press_functions = {}
local release_functions = {}

-- Keep track of whether game is paused
Input_Manager.paused = false


-- Look up in the map for actions that correspond to specific key presses
Input_Manager.press = function(pressed_key)
    if press_functions[pressed_key] then
        press_functions[pressed_key]()
    end
end

press_functions.left = function()
    Input_Manager.left = true
end
press_functions.right = function()
    Input_Manager.right = true
end
press_functions.down = function()
    Input_Manager.down = true
end
press_functions.up = function()
    Input_Manager.up = true
end
press_functions.escape = function()
    Input_Manager.paused = not Input_Manager.paused
    Input_Manager.escape = true
end
press_functions.space = function()
    Input_Manager.space = true
end
press_functions["return"] = function()
    Input_Manager.enter = true
end
press_functions.z = function()
    Input_Manager.z = true
end
press_functions.r = function()
    Input_Manager.r = true
end


-- Look up in the map for actions that correspond to specific key releases
Input_Manager.release = function(released_key)
    if release_functions[released_key] then
        release_functions[released_key]()
    end
end

release_functions.left = function()
    Input_Manager.left = false
end
release_functions.right = function()
    Input_Manager.right = false
end
release_functions.down = function()
    Input_Manager.down = false
end
release_functions.up = function()
    Input_Manager.up = false
end
release_functions.escape = function()
    Input_Manager.escape = false
end
release_functions["return"] = function()
    Input_Manager.enter = false
end
release_functions.z = function()
    Input_Manager.z = false
end
release_functions.r = function()
    Input_Manager.r = false
end


return Input_Manager
