--[[
    File: PlayerWakingState.lua
    Description: Walking states of the player
    Created: 2025-04-07
    Author: Pedro Oliveira
]]
local lerp = require("utils.lerp")
local debug = require("utils.debug")
local EntityBaseState = require("src.gamestates.entity.EntityBaseState")

local PlayerWalkingState = EntityBaseState:new()

function PlayerWalkingState:init(entity)
    self.entity = entity -- Give the state object the pointer to the entity
end

function PlayerWalkingState:enter()
    if love.keyboard.isDown("right") or love.keyboard.isDown("left") or love.keyboard.isDown("up") or love.keyboard.isDown("down") then
        if love.keyboard.isDown("right") then
            self.entity.target_x = self.entity.x + 1
        elseif love.keyboard.isDown("left") then
            self.entity.target_x = self.entity.x - 1
        elseif love.keyboard.isDown("up") then
            self.entity.target_y = self.entity.y - 1
        elseif love.keyboard.isDown("down") then
            self.entity.target_y = self.entity.y + 1
        end

        self.entity.moving = true
        self.entity.movement_elapsed_time = 0
    end
end

function PlayerWalkingState:update(dt)
    if self.entity.moving then
        self:performMovement(dt)
    end
end

function PlayerWalkingState:performMovement(dt)
    local progress = self.entity.movement_elapsed_time / self.entity.move_time
    debug.log("Progress:" .. progress)

    self.entity.render_x = lerp(self.entity.x, self.entity.target_x, progress)
    self.entity.render_y = lerp(self.entity.y, self.entity.target_y, progress)

    self.entity.movement_elapsed_time = self.entity.movement_elapsed_time + dt
    debug.log("Elap. time:" .. self.entity.movement_elapsed_time)

    if progress >= 1 then
        self.entity.x = self.entity.target_x
        self.entity.y = self.entity.target_y
        progress = 0

        if love.keyboard.isDown("right") or love.keyboard.isDown("left") or love.keyboard.isDown("up") or love.keyboard.isDown("down") then
            if love.keyboard.isDown("right") then
                self.entity.target_x = self.entity.x + 1
            elseif love.keyboard.isDown("left") then
                self.entity.target_x = self.entity.x - 1
            elseif love.keyboard.isDown("up") then
                self.entity.target_y = self.entity.y - 1
            elseif love.keyboard.isDown("down") then
                self.entity.target_y = self.entity.y + 1
            end

            self.entity.moving = true
            self.entity.movement_elapsed_time = 0
        else
            self.entity.moving = false
            self.entity:changeState("idle")
        end
    end
end

return PlayerWalkingState
