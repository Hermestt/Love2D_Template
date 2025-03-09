-- main.lua

-- General requires
local Input_Manager = require "src.input_manager"

-- Scene requires
local Scene_Manager = require('src.scene_manager')
local menu = require("scenes.scene_menu")
local game = require("scenes.game")
local pause = require("scenes.pause")

-- LOAD
function love.load()
    love.window.setTitle("NAME OF THE GAME")
    love.graphics.setBackgroundColor(0, 0, 0.11, 1)
    love.window.setMode(1024, 768, { resizable = false, vsync = false, minwidth = 400, minheight = 300, highdpi = true })
    Scene_Manager.register("menu", menu)
    Scene_Manager.register("game", game)
    Scene_Manager.register("pause", pause)
    Scene_Manager.switch("menu")
end

-- DRAW
function love.draw()
    Scene_Manager.draw()
end

-- TOGGLES
love.keypressed = function(pressed_key)
    Scene_Manager.keypressed(pressed_key)
end

love.keyreleased = function(released_key)
    Scene_Manager.keyreleased(released_key)
end


-- UPDATE
function love.update(dt)
    Scene_Manager.update(dt)
end
