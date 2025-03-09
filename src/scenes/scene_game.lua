-- game.lua

--  Requires
local Input_Manager = require("src.input_manager")
local Scene_Manager = require("src.scene_manager")
-- UI

local Scene = {}

function Scene.load()

end

function Scene.update(dt)
    -- Pause State check
    if Input_Manager.paused then
        Scene_Manager.scenes["pause"].update(dt)
        return
    end
end

function Scene.draw()
    -- PAUSE . Last thing to draw
    if Input_Manager.paused then
        Scene_Manager.scenes["pause"].draw()
    end
end

function Scene.keypressed(pressed_key)
    Input_Manager.press(pressed_key)
end

function Scene.keyreleased(released_key)
    Input_Manager.release(released_key)
end

function Scene.exit()
end

return Scene
