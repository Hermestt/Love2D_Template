--[[
    File: Player.lua
    Description: Player entity
    Created: 2025-04-07
    Author: Pedro Oliveira
    Notes: This is where the player gets its movements
]]

local IdleState = require("src.gamestates.entity.Player.PlayerIdleState")
local WalkingState = require("src.gamestates.entity.Player.PlayerWalkingState")

local Entity = require("src.entities.Entity")


local Player = Entity:new()

function Player:new(name)
    local obj = {
        name = name or "Noname",
        state = "idle",
        states = {},
        x = 1,
        y = 1,
        target_x = 1,
        target_y = 1,
        render_x = 1,
        render_y = 1,
        moving = false,
        movement_elapsed_time = 0,
        move_time = 0.35
        -- direction = nil - this will be needed to make the sprite face a direction
    }

    obj.states = {
        idle = IdleState:new(),
        walking = WalkingState:new()
    }

    for _, state in pairs(obj.states) do
        state:init(obj)
    end

    setmetatable(obj, self)
    self.__index = self
    return obj
end

return Player
