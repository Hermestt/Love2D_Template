--[[
    File: PlayerIdleState.lua
    Description: Idle states of the player
    Created: 2025-04-07
    Author: Pedro Oliveira
]]
local EntityBaseState = require("src.gamestates.entity.EntityBaseState")

local PlayerIdleState = EntityBaseState:new()

function PlayerIdleState:init(entity)
    self.entity = entity
end

function PlayerIdleState:update()
    if love.keyboard.isDown("right") or love.keyboard.isDown("left") or love.keyboard.isDown("up") or love.keyboard.isDown("down") then
        print("I'll change state to walking")
        self.entity:changeState("walking")
    end
end

return PlayerIdleState
