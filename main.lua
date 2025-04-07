-- main.lua
require("src.Constants")
local Room = require("src.world.Room")
local Player = require("src.entities.Player")
local debug = require("utils.debug")

local r = Room:new()
local p = Player:new("Mariana")

-- LOAD
function love.load()
    love.window.setTitle("Echoes of the Self")
    love.graphics.setBackgroundColor(0, 0, 0.11, 1)
    love.window.setMode(1024, 768, { resizable = false, vsync = false, minwidth = 400, minheight = 300, highdpi = true })

    r:init()
    r:GenerateWallsAndFloors()

    p:init(2, 4)
end

-- DRAW
function love.draw()
    r:render()
    p:render()

    debug.draw()
end

-- TOGGLES
love.keypressed = function(pressed_key)

end

love.keyreleased = function(released_key)

end


-- UPDATE
function love.update(dt)
    debug.clear()
    p:update(dt)

    debug.log("FPS: " .. love.timer.getFPS())
    debug.log("Player x: " .. p.x)
    debug.log("Player y: " .. p.y)
end
