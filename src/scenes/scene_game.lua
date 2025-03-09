-- game.lua

--  Requires
local Input_Manager = require("src.input_manager")
local Scene_Manager = require("src.scene_manager")
-- UI



local scene = {}


function scene.load()

end

function scene.update(dt)
    -- Pause State check
    if Input_Manager.paused then
        Scene_Manager.scenes["pause"].update(dt)
        return
    end
end

function scene.draw()
    -- PAUSE . Last thing to draw
    if Input_Manager.paused then
        Scene_Manager.scenes["pause"].draw()
    end
end

function scene.keypressed(pressed_key)
    Input_Manager.press(pressed_key)
end

function scene.keyreleased(released_key)
    Input_Manager.release(released_key)
end

function scene.exit()
end

return scene
