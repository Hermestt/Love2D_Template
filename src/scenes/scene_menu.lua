-- menu.lua
local Input_Manager = require("src.input_manager")
local scene = {}
local menus = {}

function scene.load()
    Input_Manager.paused = false

    menus = {}
end

function scene.update(dt)
    if Input_Manager.escape == true then
        love.event.quit()
    end
end

function scene.draw()

end

function scene.keypressed(pressed_key)
    Input_Manager.press(pressed_key)
end

function scene.keyreleased(released_key)
    Input_Manager.release(released_key)
end

return scene
