-- menu.lua
local Input_Manager = require("src.input_manager")
local Scene = {}
local menu_options = {}

function Scene.load()
    Input_Manager.paused = false

    menu_options = {}
end

function Scene.update(dt)
    if Input_Manager.escape == true then
        love.event.quit()
    end
end

function Scene.draw()

end

function Scene.keypressed(pressed_key)
    Input_Manager.press(pressed_key)
end

function Scene.keyreleased(released_key)
    Input_Manager.release(released_key)
end

return Scene
